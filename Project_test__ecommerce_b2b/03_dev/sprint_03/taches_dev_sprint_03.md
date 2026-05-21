# Tâches Dev — Sprint 3 — Canal autonome financièrement

> Agent : AGENT-DEV-DRUPAL-PHP.md
> Stack : Drupal 10 · Commerce 2.x · PHP 8.2 · Stripe · SendGrid · MySQL 8.0 · Redis 7.x
> Code Level 2 : illustrative — intent + patterns

---

## Vue d'ensemble sprint

| US | Titre | SP | Dev assigné | Branch Git |
|----|-------|----|-------------|------------|
| US-016 | Paiement CB 3D Secure via Stripe PaymentIntent + Webhook | 8 | Dev1 + Dev2 | `feature/US-016-stripe-3ds` |
| US-018 | Génération facture PDF post-commande | 3 | Dev3 | `feature/US-018-facture-pdf` |
| US-012 | Historique commandes acheteur B2B | 3 | Dev4 | `feature/US-012-historique-commandes` |

**Vélocité Sprint 3 :** 14 SP
**Prérequis :** Module `Company-Test_b2b` opérationnel (Sprint 1+2), workflow commande configuré (US-014), clés API Stripe sandbox disponibles

---

## US-016 — Paiement CB 3D Secure via Stripe PaymentIntent + Webhook (8 SP)

**Branche :** `feature/US-016-stripe-3ds`

### Composants à créer / modifier

| Fichier | Action | Description |
|---------|--------|-------------|
| `src/Plugin/Commerce/PaymentGateway/StripePaymentGateway.php` | create | Gateway Commerce 2.x intégrant Stripe PaymentIntent API |
| `src/Plugin/Commerce/CheckoutPane/StripePaymentPane.php` | create | Override PurchaseOrderPane — formulaire carte + 3DS handling |
| `src/Controller/WebhookController.php` | create | Endpoint POST `/webhook/stripe` — validation HMAC + dispatch |
| `src/EventSubscriber/StripeWebhookSubscriber.php` | create | Handler événements Stripe : payment_intent.succeeded, payment_failed |
| `src/Service/StripeIdempotenceService.php` | create | Vérification unicité PaymentIntent par order_id (Redis) |
| `js/stripe-payment.js` | create | confirmCardPayment() côté client avec Stripe Elements |
| `config/install/Company-Test_b2b.settings.yml` | modify | Clés Stripe (publishable_key, webhook_secret) via config form |
| `Company-Test_b2b.routing.yml` | modify | Ajouter route `/webhook/stripe` — accès public, CSRF off |

### Snippet illustratif Level 2

```php
<?php
// src/Plugin/Commerce/PaymentGateway/StripePaymentGateway.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Plugin\Commerce\PaymentGateway;

use Drupal\commerce_payment\Plugin\Commerce\PaymentGateway\OffsitePaymentGatewayBase;
use Stripe\PaymentIntent;
use Stripe\Stripe;

/**
 * @CommercePaymentGateway(
 *   id = "Company-Test_stripe",
 *   label = "Stripe 3D Secure",
 *   display_label = "Paiement par carte bancaire",
 *   modes = {"test" = "Test", "live" = "Production"},
 * )
 */
class StripePaymentGateway extends OffsitePaymentGatewayBase {

  public function createPaymentIntent(float $amount, string $currency = 'eur'): PaymentIntent {
    Stripe::setApiKey($this->configuration['secret_key']);

    return PaymentIntent::create([
      'amount'               => (int) ($amount * 100), // en centimes
      'currency'             => $currency,
      'payment_method_types' => ['card'],
      'confirmation_method'  => 'manual',
      'confirm'              => false,
      'metadata'             => ['order_id' => $this->getOrderId()],
    ]);
  }

  public function confirmPayment(string $paymentIntentId): PaymentIntent {
    return PaymentIntent::retrieve($paymentIntentId)->confirm();
  }
}
```

```php
<?php
// src/Controller/WebhookController.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Controller;

use Drupal\Core\Controller\ControllerBase;
use Stripe\Webhook;
use Stripe\Exception\SignatureVerificationException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class WebhookController extends ControllerBase {

  public function __construct(
    private readonly string $webhookSecret,
    private readonly StripeIdempotenceService $idempotence,
    private readonly EventDispatcherInterface $dispatcher,
  ) {}

  public function handle(Request $request): Response {
    $payload   = $request->getContent();
    $sigHeader = $request->headers->get('Stripe-Signature');

    // Validation HMAC — rejet si signature invalide
    try {
      $event = Webhook::constructEvent($payload, $sigHeader, $this->webhookSecret);
    } catch (SignatureVerificationException $e) {
      return new Response('Signature invalide', Response::HTTP_BAD_REQUEST);
    }

    // Idempotence : ignorer les événements déjà traités
    if ($this->idempotence->isAlreadyProcessed($event->id)) {
      return new Response('Already processed', Response::HTTP_OK);
    }

    // Dispatch vers subscriber métier
    $this->dispatcher->dispatch(new StripeWebhookEvent($event), $event->type);
    $this->idempotence->markAsProcessed($event->id);

    return new Response('OK', Response::HTTP_OK);
  }
}
```

```php
<?php
// src/Service/StripeIdempotenceService.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Service;

use Drupal\Core\Cache\CacheBackendInterface;

class StripeIdempotenceService {

  private const CACHE_BIN = 'stripe_idempotence';
  private const TTL       = 86400; // 24h

  public function __construct(
    private readonly CacheBackendInterface $cache,
  ) {}

  public function isAlreadyProcessed(string $eventId): bool {
    return (bool) $this->cache->get(self::CACHE_BIN . ':' . $eventId);
  }

  public function markAsProcessed(string $eventId): void {
    $this->cache->set(
      self::CACHE_BIN . ':' . $eventId,
      true,
      time() + self::TTL
    );
  }
}
```

```php
<?php
// src/EventSubscriber/StripeWebhookSubscriber.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\EventSubscriber;

use Drupal\commerce_order\Entity\OrderInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class StripeWebhookSubscriber implements EventSubscriberInterface {

  public static function getSubscribedEvents(): array {
    return [
      'payment_intent.succeeded' => 'onPaymentSucceeded',
      'payment_intent.payment_failed' => 'onPaymentFailed',
    ];
  }

  public function onPaymentSucceeded(StripeWebhookEvent $event): void {
    $intent   = $event->getStripeEvent()->data->object;
    $orderId  = $intent->metadata->order_id;
    $order    = $this->orderStorage->load($orderId);

    if ($order instanceof OrderInterface) {
      // Transition workflow → processing
      $order->getState()->applyTransitionById('process');
      $order->save();
      // Créer entité Payment Commerce
      $this->paymentStorage->create([
        'payment_gateway'   => 'Company-Test_stripe',
        'order_id'          => $orderId,
        'amount'            => $order->getTotalPrice(),
        'remote_id'         => $intent->id,
        'state'             => 'completed',
      ])->save();
    }
  }

  public function onPaymentFailed(StripeWebhookEvent $event): void {
    $intent  = $event->getStripeEvent()->data->object;
    $orderId = $intent->metadata->order_id;
    $this->logger->error(
      'Paiement Stripe échoué pour commande @order : @error',
      ['@order' => $orderId, '@error' => $intent->last_payment_error?->message]
    );
  }
}
```

```javascript
// js/stripe-payment.js — Stripe Elements + 3DS confirmation
const stripe = Stripe(drupalSettings.Company-Test_b2b.stripe_publishable_key);
const elements = stripe.elements();
const cardElement = elements.create('card', { style: cardStyle });
cardElement.mount('#stripe-card-element');

async function handlePaymentSubmit(event) {
  event.preventDefault();
  const { error, paymentIntent } = await stripe.confirmCardPayment(
    drupalSettings.Company-Test_b2b.client_secret, {
      payment_method: { card: cardElement }
    }
  );
  if (error) {
    document.getElementById('stripe-errors').textContent = error.message;
  } else if (paymentIntent.status === 'succeeded') {
    document.getElementById('stripe-payment-form').submit();
  }
}
```

```yaml
# Company-Test_b2b.routing.yml — ajout route webhook
Company-Test_b2b.stripe_webhook:
  path: '/webhook/stripe'
  defaults:
    _controller: '\Drupal\Company-Test_b2b\Controller\WebhookController::handle'
  requirements:
    _access: 'TRUE'
  options:
    no_cache: TRUE
    _csrf_token: FALSE   # Stripe signe ses requêtes via HMAC — pas de CSRF Drupal
```

### DoD checklist US-016

| Critère | Vérifié |
|---------|---------|
| PaymentIntent créé et confirmé en sandbox Stripe | [ ] |
| 3DS2 déclenché et validé sur carte test `4000000000003220` | [ ] |
| Webhook endpoint `/webhook/stripe` répond 200 OK | [ ] |
| Signature HMAC invalide → rejet 400 | [ ] |
| Idempotence : événement dupliqué ignoré | [ ] |
| Transition workflow commande → `processing` après paiement | [ ] |
| Entité `Payment` Commerce créée avec `remote_id` Stripe | [ ] |
| Tests PHPUnit WebhookController (mock Stripe SDK) | [ ] |
| Tests PHPUnit StripeIdempotenceService | [ ] |
| Config `publishable_key` / `webhook_secret` via admin form (non hardcodé) | [ ] |
| Code review back-end (Dev1 → Dev2) | [ ] |
| Staging validé PO | [ ] |

---

## US-018 — Génération facture PDF post-commande (3 SP)

**Branche :** `feature/US-018-facture-pdf`

### Composants à créer / modifier

| Fichier | Action | Description |
|---------|--------|-------------|
| `src/Service/InvoiceGeneratorService.php` | create | Service génération PDF via mPDF/DOMPDF, numérotation INV-YYYY-NNNN |
| `src/EventSubscriber/OrderCompleteSubscriber.php` | create | Listener `OrderEvents::ORDER_COMPLETE` → déclenche génération + envoi email |
| `templates/invoice/invoice.html.twig` | create | Template Twig facture (logo, données client, lignes produits, TVA, mentions légales) |
| `src/Service/InvoiceNumberingService.php` | create | Numérotation séquentielle auto avec verrou atomique (DB) |
| `config/install/Company-Test_b2b.invoice.yml` | create | Config : répertoire stockage, préfixe numérotation, template |
| `Company-Test_b2b.module` | modify | `hook_mail()` : ajouter clé `invoice_ready` avec pièce jointe PDF |

### Snippet illustratif Level 2

```php
<?php
// src/Service/InvoiceGeneratorService.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Service;

use Drupal\commerce_order\Entity\OrderInterface;
use Mpdf\Mpdf;
use Mpdf\Config\ConfigVariables;

class InvoiceGeneratorService {

  public function __construct(
    private readonly \Twig\Environment $twig,
    private readonly InvoiceNumberingService $numbering,
    private readonly string $storageDir,
  ) {}

  public function generate(OrderInterface $order): string {
    $invoiceNumber = $this->numbering->getNextNumber($order);
    $html = $this->twig->render(
      '@Company-Test_b2b/invoice/invoice.html.twig',
      [
        'order'          => $order,
        'invoice_number' => $invoiceNumber,
        'invoice_date'   => new \DateTimeImmutable(),
        'billing'        => $order->getBillingProfile(),
        'items'          => $order->getItems(),
        'total_ht'       => $order->getSubtotalPrice(),
        'tva'            => $this->computeTva($order),
        'total_ttc'      => $order->getTotalPrice(),
        'vendor'         => $this->getVendorInfo(),
      ]
    );

    $mpdf = new Mpdf([
      'mode'         => 'utf-8',
      'format'       => 'A4',
      'margin_top'   => 20,
      'margin_bottom'=> 20,
    ]);
    $mpdf->WriteHTML($html);

    $filename   = $invoiceNumber . '.pdf';
    $filepath   = $this->storageDir . '/' . $filename;
    $mpdf->Output($filepath, \Mpdf\Output\Destination::FILE);

    return $filepath;
  }

  private function computeTva(OrderInterface $order): string {
    // TVA 20% sur total HT
    $ht = (float) $order->getSubtotalPrice()->getNumber();
    return number_format($ht * 0.20, 2) . ' EUR';
  }

  private function getVendorInfo(): array {
    return [
      'name'    => 'Company-Test SAS',
      'siret'   => '12345678901234',
      'address' => '10 rue de la Fibre, 75001 Paris',
      'tva_intracommunautaire' => 'FR12345678901',
    ];
  }
}
```

```php
<?php
// src/Service/InvoiceNumberingService.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Service;

use Drupal\commerce_order\Entity\OrderInterface;
use Drupal\Core\Database\Connection;

class InvoiceNumberingService {

  public function __construct(
    private readonly Connection $database,
  ) {}

  /**
   * Génère le prochain numéro de facture : INV-2026-0042
   * Verrou DB pour éviter les doublons en concurrence.
   */
  public function getNextNumber(OrderInterface $order): string {
    $year = (int) date('Y');

    // Transaction sérialisable pour atomicité
    $this->database->startTransaction();
    $seq = $this->database->query(
      "SELECT COALESCE(MAX(sequence_number), 0) + 1 AS next
       FROM {Company-Test_invoice_sequence}
       WHERE year = :year FOR UPDATE",
      [':year' => $year]
    )->fetchField();

    $this->database->insert('Company-Test_invoice_sequence')
      ->fields(['year' => $year, 'sequence_number' => $seq, 'order_id' => $order->id()])
      ->execute();

    return sprintf('INV-%d-%04d', $year, $seq);
  }
}
```

```php
<?php
// src/EventSubscriber/OrderCompleteSubscriber.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\EventSubscriber;

use Drupal\commerce_order\Event\OrderEvent;
use Drupal\commerce_order\Event\OrderEvents;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class OrderCompleteSubscriber implements EventSubscriberInterface {

  public function __construct(
    private readonly InvoiceGeneratorService $invoiceGenerator,
    private readonly \Drupal\Core\Mail\MailManagerInterface $mailManager,
  ) {}

  public static function getSubscribedEvents(): array {
    return [OrderEvents::ORDER_COMPLETE => 'onOrderComplete'];
  }

  public function onOrderComplete(OrderEvent $event): void {
    $order   = $event->getOrder();
    $pdfPath = $this->invoiceGenerator->generate($order);

    // Envoi email avec la facture en pièce jointe
    $this->mailManager->mail(
      'Company-Test_b2b',
      'invoice_ready',
      $order->getCustomer()->getEmail(),
      'fr',
      [
        'order'      => $order,
        'pdf_path'   => $pdfPath,
        'invoice_nr' => basename($pdfPath, '.pdf'),
      ]
    );
  }
}
```

```twig
{# templates/invoice/invoice.html.twig — structure Level 2 #}
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
    body { font-family: Arial, sans-serif; font-size: 11pt; }
    .header { display: flex; justify-content: space-between; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { border: 1px solid #ccc; padding: 6px; }
    th { background: #003B6F; color: white; }
    .total { font-weight: bold; text-align: right; }
  </style>
</head>
<body>
  <div class="header">
    <div><img src="{{ base_url }}/themes/custom/Company-Test_b2b_theme/logo.png" height="60"></div>
    <div>
      <h2>FACTURE N° {{ invoice_number }}</h2>
      <p>Date : {{ invoice_date|date("d/m/Y") }}</p>
    </div>
  </div>

  <div class="billing">
    <strong>Facturé à :</strong><br>
    {{ billing.address.given_name }} {{ billing.address.family_name }}<br>
    {{ billing.address.address_line1 }}<br>
    {{ billing.address.postal_code }} {{ billing.address.locality }}
  </div>

  <table>
    <thead>
      <tr><th>Référence</th><th>Désignation</th><th>Qté</th><th>Prix HT</th><th>Total HT</th></tr>
    </thead>
    <tbody>
      {% for item in items %}
      <tr>
        <td>{{ item.getPurchasedEntity().getSku() }}</td>
        <td>{{ item.getTitle() }}</td>
        <td>{{ item.getQuantity() }}</td>
        <td>{{ item.getUnitPrice().getNumber()|number_format(2) }} €</td>
        <td>{{ item.getTotalPrice().getNumber()|number_format(2) }} €</td>
      </tr>
      {% endfor %}
    </tbody>
  </table>

  <div class="total">
    <p>Total HT : {{ total_ht.getNumber()|number_format(2) }} €</p>
    <p>TVA 20% : {{ tva }}</p>
    <p><strong>Total TTC : {{ total_ttc.getNumber()|number_format(2) }} €</strong></p>
  </div>

  <footer>
    <small>{{ vendor.name }} — SIRET {{ vendor.siret }} — TVA : {{ vendor.tva_intracommunautaire }}</small>
  </footer>
</body>
</html>
```

### DoD checklist US-018

| Critère | Vérifié |
|---------|---------|
| PDF généré automatiquement à la completion de commande | [ ] |
| Numérotation INV-YYYY-NNNN sans doublon (test concurrence) | [ ] |
| PDF stocké dans répertoire privé Drupal (non accessible web direct) | [ ] |
| Email SendGrid envoyé avec PDF en pièce jointe | [ ] |
| Template Twig conforme maquette (logo, TVA, mentions légales) | [ ] |
| Tests PHPUnit InvoiceGeneratorService (mock mPDF) | [ ] |
| Tests PHPUnit InvoiceNumberingService (séquence + atomicité) | [ ] |
| Code review (Dev3 → Dev1) | [ ] |
| Staging validé PO | [ ] |

---

## US-012 — Historique commandes acheteur B2B (3 SP)

**Branche :** `feature/US-012-historique-commandes`

### Composants à créer / modifier

| Fichier | Action | Description |
|---------|--------|-------------|
| `config/install/views.view.order_history_b2b.yml` | create | Vue Views commerce_order avec contextual filter uid + filtres exposés statut |
| `templates/views/views-view-fields--order-history-b2b.html.twig` | create | Template Twig row commande (N°, date, statut badge, total, PDF) |
| `Company-Test_b2b.routing.yml` | modify | Route `/mon-compte/commandes` — accès rôle `b2b_buyer` |
| `config/install/block.block.order_history_menu.yml` | create | Lien "Mes commandes" dans menu compte utilisateur |

### Snippet illustratif Level 2

```yaml
# config/install/views.view.order_history_b2b.yml — Level 2
id: order_history_b2b
label: 'Historique commandes B2B'
base_table: commerce_order
base_field: order_id
display:
  default:
    display_options:
      fields:
        order_number:
          id: order_number
          table: commerce_order
          field: order_number
          label: 'N° Commande'
        placed:
          id: placed
          field: placed
          label: 'Date'
          date_format: 'custom'
          custom_date_format: 'd/m/Y'
        state:
          id: state
          field: state
          label: 'Statut'
        total_price:
          id: total_price
          field: total_price__number
          label: 'Total HT'
      filters:
        state_exposed:
          id: state
          exposed: true
          expose:
            label: 'Filtrer par statut'
            identifier: statut
        uid:
          id: uid
          relationship: none
          value: '***CURRENT_USER***'  # contextual filter uid = utilisateur connecté
      sorts:
        placed:
          id: placed
          order: DESC
      pager:
        type: full
        options:
          items_per_page: 10
      access:
        type: role
        options:
          role:
            b2b_buyer: b2b_buyer
```

```php
<?php
// src/Controller/OrderHistoryController.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\Core\Session\AccountInterface;

class OrderHistoryController extends ControllerBase {

  public function __construct(
    private readonly AccountInterface $currentUser,
  ) {}

  /**
   * Retourne la page historique avec la Vue pré-filtrée sur l'utilisateur courant.
   */
  public function page(): array {
    return [
      '#type'     => 'view',
      '#name'     => 'order_history_b2b',
      '#display'  => 'page_1',
      '#arguments'=> [$this->currentUser->id()],
      '#cache'    => ['contexts' => ['user']],
    ];
  }
}
```

```twig
{# templates/views/views-view-fields--order-history-b2b.html.twig #}
<tr class="order-row">
  <td>
    <a href="{{ path('commerce_order.detail', {commerce_order: row.order_id}) }}">
      {{ fields.order_number.content }}
    </a>
  </td>
  <td>{{ fields.placed.content }}</td>
  <td>
    <span class="order-badge order-badge--{{ row.state }}">
      {{ fields.state.content }}
    </span>
  </td>
  <td>{{ fields.total_price.content }} €</td>
  <td>
    {% if row.invoice_path %}
      <a href="{{ row.invoice_download_url }}" class="btn-dl-invoice">
        Télécharger facture PDF
      </a>
    {% endif %}
  </td>
</tr>
```

```yaml
# Company-Test_b2b.routing.yml — ajout route historique commandes
Company-Test_b2b.order_history:
  path: '/mon-compte/commandes'
  defaults:
    _controller: '\Drupal\Company-Test_b2b\Controller\OrderHistoryController::page'
    _title: 'Mes commandes'
  requirements:
    _role: 'b2b_buyer'
  options:
    _cache_contexts:
      - user
```

### DoD checklist US-012

| Critère | Vérifié |
|---------|---------|
| Page `/mon-compte/commandes` accessible uniquement rôle `b2b_buyer` | [ ] |
| Seules les commandes de l'utilisateur connecté sont affichées | [ ] |
| Filtre exposé "Statut" fonctionnel (tous / en attente / expédié / livré) | [ ] |
| Tri par date décroissante par défaut | [ ] |
| Pagination 10 commandes par page | [ ] |
| Lien vers détail commande fonctionnel | [ ] |
| Lien téléchargement facture PDF affiché si disponible | [ ] |
| Badge statut coloré (CSS par état) | [ ] |
| Tests Behat scénarios historique commandes | [ ] |
| Staging validé PO | [ ] |

---

## Déploiement Sprint 3

### Prérequis avant déploiement staging

```bash
# Vérifier que les dépendances Composer sont à jour
composer require stripe/stripe-php mpdf/mpdf

# Vérifier la version PHP
php -v  # doit afficher PHP 8.2.x
```

### Séquence de déploiement sur staging

```bash
# 1. Merge de la branche feature vers develop
git checkout develop
git pull origin develop
git merge feature/US-016-stripe-3ds --no-ff
git merge feature/US-018-facture-pdf --no-ff
git merge feature/US-012-historique-commandes --no-ff
git push origin develop

# 2. Sur le serveur staging
composer install --no-dev --optimize-autoloader

# 3. Mise à jour base de données
drush updatedb -y

# 4. Import configuration
drush config:import -y

# 5. Créer la table de séquence factures
drush php:eval "require_once 'modules/custom/Company-Test_b2b/Company-Test_b2b.install'; Company-Test_b2b_update_8003();"

# 6. Vider les caches
drush cr

# 7. Activer le module si nouvelles dépendances
drush en commerce_stripe -y

# 8. Vérifier les routes
drush router:rebuild

# 9. Configurer les clés Stripe (staging)
drush cset Company-Test_b2b.settings stripe_publishable_key "pk_test_XXXXXX"
drush cset Company-Test_b2b.settings stripe_webhook_secret "whsec_XXXXXX"
```

### Checklist de fin de Sprint 3

| US | PHPUnit | Behat | Config YAML | Code Review | Staging |
|----|---------|-------|-------------|-------------|---------|
| US-016 | [ ] | [ ] | [ ] | [ ] | [ ] |
| US-018 | [ ] | [ ] | [ ] | [ ] | [ ] |
| US-012 | [ ] | [ ] | [ ] | [ ] | [ ] |

### Gate DoR Sprint 4 (à valider avant J1 Sprint 4)
- [ ] Stripe webhook configuré et testé en sandbox (Stripe CLI)
- [ ] Clés API Stripe staging disponibles (Dev1)
- [ ] Répertoire stockage factures PDF créé et sécurisé sur staging
- [ ] API Chronopost — accès sandbox confirmé (Dev2)
- [ ] Templates SendGrid expedition-tracking créés (Dev3)
- [ ] Wireframes filtres catalogue avancés validés PO (Dev4)
- [ ] Champ `field_prix_negocie` sur entité User — spécifications validées PO
