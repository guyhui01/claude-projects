# Tâches Dev — IP Sprint — Stabilisation & Onboarding

> Agent : AGENT-DEV-DRUPAL-PHP.md
> Stack : Drupal 10 · Commerce 2.x · PHP 8.2 · Stripe · SendGrid · MySQL 8.0 · Redis 7.x · Nginx
> Code Level 2 : illustrative — intent + patterns

---

## Vue d'ensemble IP Sprint

| US / Tâche | Titre | SP | Dev assigné | Branch Git |
|------------|-------|----|-------------|------------|
| US-004 | Téléchargement fiche technique PDF | 2 | Dev4 | `feature/US-004-fiche-technique-pdf` |
| US-020 | Adresses livraison multiples (carnet adresses) | 3 | Dev3 | `feature/US-020-adresses-multiples` |
| US-022 | Email accusé réception demande compte | 2 | Dev2 | `feature/US-022-email-accuse-reception` |
| US-023 | Email bienvenue + guide démarrage | 2 | Dev2 | `feature/US-023-email-bienvenue` |
| Stabilisation | Lighthouse, Redis, tests de charge, correctifs DoD | 4 | Team | `fix/stabilisation-ip` |

**Vélocité IP Sprint :** 13 SP (réduite — focus stabilisation et non-feature)
**Prérequis :** Sprint 4 livré, environnement staging stable, accès production DSI confirmé

---

## US-004 — Téléchargement fiche technique PDF (2 SP)

**Branche :** `feature/US-004-fiche-technique-pdf`

### Composants à créer / modifier

| Fichier | Action | Description |
|---------|--------|-------------|
| `config/install/field.storage.commerce_product.field_fiche_technique.yml` | create | Stockage File field sur entité `commerce_product` |
| `config/install/field.field.commerce_product.default.field_fiche_technique.yml` | create | Instance field `field_fiche_technique` — extensions autorisées : pdf |
| `config/install/core.entity_view_display.commerce_product.default.default.yml` | modify | Ajouter field formatter "Download link" sur la fiche produit |
| `Company-Test_b2b.routing.yml` | modify | Route publique `/produit/{product}/fiche-technique` — accès sans auth |
| `templates/field/field--field-fiche-technique.html.twig` | create | Rendu bouton téléchargement stylisé |

### Snippet illustratif Level 2

```yaml
# config/install/field.field.commerce_product.default.field_fiche_technique.yml
langcode: fr
status: true
field_name: field_fiche_technique
entity_type: commerce_product
bundle: default
label: 'Fiche technique PDF'
required: false
description: 'Fiche technique produit téléchargeable (PDF). Accès public autorisé.'
settings:
  file_extensions: pdf
  file_directory: 'fiches-techniques'
  max_filesize: '10 MB'
  description_field: false
field_type: file
```

```yaml
# config/install/core.entity_view_display.commerce_product.default.default.yml
# Extrait — formatter "download_link" pour le champ fiche technique
content:
  field_fiche_technique:
    weight: 10
    label: hidden
    type: file_default
    settings:
      use_description_as_link_text: false
      link_text: 'Télécharger la fiche technique'
```

```php
<?php
// Company-Test_b2b.routing.yml — route téléchargement public (sans auth)
// Ajout dans Company-Test_b2b.routing.yml

/*
Company-Test_b2b.product_datasheet:
  path: '/produit/{commerce_product}/fiche-technique'
  defaults:
    _controller: '\Drupal\Company-Test_b2b\Controller\ProductDatasheetsController::download'
  requirements:
    _access: 'TRUE'    # Accès anonyme autorisé
    commerce_product: \d+
  options:
    parameters:
      commerce_product:
        type: entity:commerce_product
*/

// src/Controller/ProductDatasheetsController.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Controller;

use Drupal\commerce_product\Entity\ProductInterface;
use Drupal\Core\Controller\ControllerBase;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpFoundation\ResponseHeaderBag;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class ProductDatasheetsController extends ControllerBase {

  public function download(ProductInterface $commerce_product): BinaryFileResponse {
    $fileField = $commerce_product->get('field_fiche_technique');

    if ($fileField->isEmpty()) {
      throw new NotFoundHttpException('Aucune fiche technique disponible pour ce produit.');
    }

    /** @var \Drupal\file\FileInterface $file */
    $file     = $fileField->entity;
    $filePath = \Drupal::service('file_system')->realpath($file->getFileUri());
    $filename = $commerce_product->getTitle() . '-fiche-technique.pdf';

    return new BinaryFileResponse(
      $filePath,
      200,
      ['Content-Type' => 'application/pdf'],
      true,
      ResponseHeaderBag::DISPOSITION_ATTACHMENT,
      false,
      false
    );
  }
}
```

```twig
{# templates/field/field--field-fiche-technique.html.twig #}
{% if items %}
  <div class="product-datasheet">
    {% for item in items %}
      <a href="{{ item.content['#url'] }}"
         class="btn-datasheet"
         download
         aria-label="Télécharger la fiche technique PDF">
        <svg aria-hidden="true" width="16" height="16"><!-- icône PDF --></svg>
        Fiche technique PDF
      </a>
    {% endfor %}
  </div>
{% endif %}
```

### DoD checklist US-004

| Critère | Vérifié |
|---------|---------|
| Bouton "Fiche technique PDF" visible sur la fiche produit | [ ] |
| Téléchargement accessible sans connexion (utilisateur anonyme) | [ ] |
| Fichier PDF téléchargé correct (pas de page 403/404) | [ ] |
| Champ non affiché si aucun PDF chargé sur le produit | [ ] |
| Upload PDF possible depuis l'interface admin produit | [ ] |
| Taille max fichier respectée (10 MB) | [ ] |
| Tests PHPUnit ProductDatasheetsController (accès anonyme) | [ ] |
| Staging validé PO | [ ] |

---

## US-020 — Adresses livraison multiples (3 SP)

**Branche :** `feature/US-020-adresses-multiples`

### Composants à créer / modifier

| Fichier | Action | Description |
|---------|--------|-------------|
| `Company-Test_b2b.info.yml` | modify | Ajouter dépendance : `profile` (module Drupal Commerce Profile) |
| `config/install/profile.type.customer_address.yml` | create | Type de profil "Adresse de livraison" — multi-valeur activé |
| `src/Plugin/Commerce/CheckoutPane/AddressBookPane.php` | create | Pane checkout — sélecteur adresse existante + ajout nouvelle |
| `templates/address-book/address-book-selector.html.twig` | create | Affichage carnet adresses au checkout (radio buttons + carte) |
| `src/Form/AddressBookForm.php` | create | Formulaire ajout/édition/suppression d'adresses (Mon compte) |
| `Company-Test_b2b.routing.yml` | modify | Routes `/mon-compte/adresses`, `/mon-compte/adresses/ajouter`, `/mon-compte/adresses/{profile}/modifier` |

### Snippet illustratif Level 2

```php
<?php
// src/Plugin/Commerce/CheckoutPane/AddressBookPane.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Plugin\Commerce\CheckoutPane;

use Drupal\commerce_checkout\Plugin\Commerce\CheckoutPane\CheckoutPaneBase;
use Drupal\profile\Entity\ProfileInterface;

/**
 * @CommerceCheckoutPane(
 *   id = "Company-Test_address_book",
 *   label = @Translation("Carnet d'adresses livraison"),
 *   default_step = "order_information",
 *   wrapper_element = "fieldset",
 * )
 */
class AddressBookPane extends CheckoutPaneBase {

  public function buildPaneForm(array $pane_form, \Drupal\Core\Form\FormStateInterface $form_state, array &$complete_form): array {
    $profiles = $this->getCustomerAddressProfiles();

    if (!empty($profiles)) {
      $options = $this->buildAddressOptions($profiles);
      $options['_new'] = '+ Utiliser une nouvelle adresse';

      $pane_form['address_selection'] = [
        '#type'          => 'radios',
        '#title'         => 'Choisir une adresse de livraison',
        '#options'       => $options,
        '#default_value' => $this->getDefaultAddressId($profiles),
        '#required'      => true,
      ];
    }

    // Formulaire nouvelle adresse (affiché si "nouvelle adresse" sélectionné)
    $pane_form['new_address'] = [
      '#type'   => 'address',
      '#title'  => 'Nouvelle adresse de livraison',
      '#states' => [
        'visible' => [':input[name="address_selection"]' => ['value' => '_new']],
      ],
    ];

    $pane_form['save_new_address'] = [
      '#type'  => 'checkbox',
      '#title' => 'Enregistrer cette adresse dans mon carnet',
      '#states'=> [
        'visible' => [':input[name="address_selection"]' => ['value' => '_new']],
      ],
    ];

    return $pane_form;
  }

  public function submitPaneForm(array &$pane_form, \Drupal\Core\Form\FormStateInterface $form_state, array &$complete_form): void {
    $selectedId = $form_state->getValue(['Company-Test_address_book', 'address_selection']);
    $order      = $this->order;

    if ($selectedId === '_new') {
      $addressData = $form_state->getValue(['Company-Test_address_book', 'new_address']);
      $profile     = $this->createShippingProfile($addressData);

      // Sauvegarder si demandé
      if ($form_state->getValue(['Company-Test_address_book', 'save_new_address'])) {
        $profile->setOwnerId($order->getCustomerId())->save();
      }
    } else {
      $profile = \Drupal::entityTypeManager()
        ->getStorage('profile')
        ->load($selectedId);
    }

    $order->shipments->first()?->setShippingProfile($profile);
  }

  private function getCustomerAddressProfiles(): array {
    return \Drupal::entityTypeManager()
      ->getStorage('profile')
      ->loadByProperties([
        'uid'    => \Drupal::currentUser()->id(),
        'type'   => 'customer_address',
        'status' => 1,
      ]);
  }

  private function buildAddressOptions(array $profiles): array {
    $options = [];
    foreach ($profiles as $profile) {
      /** @var ProfileInterface $profile */
      $address = $profile->get('address')->first();
      $label   = sprintf(
        '%s %s — %s %s%s',
        $address->getGivenName(),
        $address->getFamilyName(),
        $address->getAddressLine1(),
        $address->getPostalCode(),
        $profile->get('is_default')->value ? ' (par défaut)' : ''
      );
      $options[$profile->id()] = $label;
    }
    return $options;
  }

  private function getDefaultAddressId(array $profiles): ?string {
    foreach ($profiles as $profile) {
      if ($profile->get('is_default')->value) {
        return (string) $profile->id();
      }
    }
    return $profiles ? (string) array_key_first($profiles) : null;
  }
}
```

```yaml
# config/install/profile.type.customer_address.yml
langcode: fr
status: true
id: customer_address
label: 'Adresse de livraison'
registration: false
multiple: true   # Permet plusieurs adresses par utilisateur
roles:
  - b2b_buyer
```

### DoD checklist US-020

| Critère | Vérifié |
|---------|---------|
| Carnet adresses accessible depuis `/mon-compte/adresses` | [ ] |
| Ajout nouvelle adresse fonctionnel | [ ] |
| Modification / suppression d'une adresse existante | [ ] |
| Adresse par défaut marquée et pré-sélectionnée au checkout | [ ] |
| Sélecteur d'adresses affiché au checkout (si adresses existantes) | [ ] |
| Option "Utiliser une nouvelle adresse" + case à cocher "Enregistrer" | [ ] |
| Tests PHPUnit AddressBookPane | [ ] |
| Staging validé PO | [ ] |

---

## US-022 — Email accusé réception demande compte (2 SP)

**Branche :** `feature/US-022-email-accuse-reception`

### Composants à créer / modifier

| Fichier | Action | Description |
|---------|--------|-------------|
| `Company-Test_b2b.module` | modify | `hook_user_insert()` — compléter avec envoi SendGrid template `confirmation-inscription` |
| `templates/emails/confirmation-inscription.html.twig` | create | Template HTML accusé réception avec délai validation 24h |
| `config/install/Company-Test_b2b.sendgrid_templates.yml` | modify | Ajouter template ID `confirmation-inscription` |

### Snippet illustratif Level 2

```php
<?php
// Company-Test_b2b.module — hook_user_insert() complété
// (partiellement implémenté en Sprint 1 — complétion IP Sprint)
declare(strict_types=1);

/**
 * Implements hook_user_insert().
 * Déclenché à la création d'un compte utilisateur.
 */
function Company-Test_b2b_user_insert(\Drupal\user\UserInterface $account): void {
  // Statut initial "en_attente" (déjà implémenté Sprint 1)
  $account->set('field_compte_statut', 'en_attente')->save();

  // US-022 — Email accusé réception acheteur
  /** @var \Drupal\Core\Mail\MailManagerInterface $mailManager */
  $mailManager = \Drupal::service('plugin.manager.mail');
  $mailManager->mail(
    'Company-Test_b2b',
    'registration_acknowledgement',   // clé mail
    $account->getEmail(),
    'fr',
    [
      'account'           => $account,
      'raison_sociale'    => $account->get('field_raison_sociale')->value,
      'delai_validation'  => '24 heures',
      'contact_email'     => 'support@Company-Test.fr',
    ]
  );

  // Email notification admin (déjà implémenté Sprint 1 — vérifier fonctionnement)
  $adminEmail = \Drupal::config('system.site')->get('mail');
  $mailManager->mail(
    'Company-Test_b2b',
    'admin_new_request',
    $adminEmail,
    'fr',
    ['account' => $account]
  );
}

/**
 * Implements hook_mail().
 * Définit les emails du module Company-Test_b2b.
 */
function Company-Test_b2b_mail(string $key, array &$message, array $params): void {
  $message['headers']['Content-Type'] = 'text/html; charset=UTF-8';

  switch ($key) {
    case 'registration_acknowledgement':
      $message['subject'] = 'Demande de compte Company-Test reçue — Validation sous 24h';
      $message['body'][]  = \Drupal::service('renderer')->renderPlain(
        \Drupal::service('twig')
          ->load('@Company-Test_b2b/emails/confirmation-inscription.html.twig')
          ->render($params)
      );
      break;

    case 'admin_new_request':
      $message['subject'] = '[Company-Test] Nouvelle demande de compte B2B : ' .
                             $params['account']->get('field_raison_sociale')->value;
      $message['body'][]  = 'Nouvelle demande de compte B2B à valider dans le back-office.';
      break;
  }
}
```

```twig
{# templates/emails/confirmation-inscription.html.twig #}
<!DOCTYPE html>
<html lang="fr">
<body style="font-family: Arial, sans-serif; color: #333;">
  <div style="max-width:600px; margin:0 auto; padding:20px;">
    <img src="{{ base_url }}/themes/custom/Company-Test_b2b_theme/logo.png" alt="Company-Test" height="50">
    <h2>Votre demande de compte a bien été reçue</h2>
    <p>Bonjour,</p>
    <p>
      Nous avons bien reçu la demande de compte professionnel pour
      <strong>{{ raison_sociale }}</strong>.
    </p>
    <div style="background:#f4f8ff; border-left:4px solid #003B6F; padding:12px; margin:20px 0;">
      <strong>Délai de validation : {{ delai_validation }}</strong><br>
      Notre équipe commerciale vérifie votre dossier et vous enverra un email
      de confirmation dès que votre compte sera activé.
    </div>
    <p>
      En cas de question, contactez-nous à
      <a href="mailto:{{ contact_email }}">{{ contact_email }}</a>.
    </p>
    <p>Cordialement,<br><strong>L'équipe Company-Test</strong></p>
  </div>
</body>
</html>
```

### DoD checklist US-022

| Critère | Vérifié |
|---------|---------|
| Email accusé réception envoyé < 1 min après inscription | [ ] |
| Objet email correct avec mention délai 24h | [ ] |
| Nom de la raison sociale affiché dans l'email | [ ] |
| Email admin notification nouvelle demande fonctionnel | [ ] |
| Tests PHPUnit hook_user_insert() / hook_mail() | [ ] |
| Template HTML rendu correct sur Outlook, Gmail, mobile | [ ] |
| Staging validé PO | [ ] |

---

## US-023 — Email bienvenue + guide démarrage (2 SP)

**Branche :** `feature/US-023-email-bienvenue`

### Composants à créer / modifier

| Fichier | Action | Description |
|---------|--------|-------------|
| `src/EventSubscriber/AccountActivationSubscriber.php` | modify | Étendre pour envoyer email bienvenue après activation compte (`actif`) |
| `templates/emails/bienvenue-b2b.html.twig` | create | Template HTML email bienvenue avec guide démarrage (liens catalogue, commande, contact) |
| `config/install/Company-Test_b2b.sendgrid_templates.yml` | modify | Ajouter template ID `bienvenue-b2b` |

### Snippet illustratif Level 2

```php
<?php
// src/EventSubscriber/AccountActivationSubscriber.php — ajout envoi email bienvenue
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\EventSubscriber;

use Drupal\Core\Mail\MailManagerInterface;
use Drupal\user\UserInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

/**
 * Écoute l'activation de compte (transition statut → actif)
 * et envoie l'email de bienvenue avec guide démarrage.
 */
class AccountActivationSubscriber implements EventSubscriberInterface {

  // URLs du guide démarrage — à configurer via admin
  private const GUIDE_LINKS = [
    'catalogue'       => '/catalogue',
    'comment_commander'=> '/guide/passer-commande',
    'contact_commercial'=> '/contact',
    'faq'             => '/faq',
  ];

  public function __construct(
    private readonly MailManagerInterface $mailManager,
  ) {}

  public static function getSubscribedEvents(): array {
    return [
      // Événement custom déclenché par AccountValidationService (Sprint 2)
      'Company-Test_b2b.account_activated' => 'onAccountActivated',
    ];
  }

  public function onAccountActivated(AccountActivatedEvent $event): void {
    $account = $event->getAccount();
    $this->sendActivationEmail($account);
    $this->sendWelcomeEmail($account); // US-023
  }

  private function sendActivationEmail(UserInterface $account): void {
    $this->mailManager->mail(
      'Company-Test_b2b',
      'account_activated',
      $account->getEmail(),
      'fr',
      ['account' => $account]
    );
  }

  private function sendWelcomeEmail(UserInterface $account): void {
    $this->mailManager->mail(
      'Company-Test_b2b',
      'welcome_b2b',
      $account->getEmail(),
      'fr',
      [
        'account'             => $account,
        'raison_sociale'      => $account->get('field_raison_sociale')->value,
        'catalogue_url'       => self::GUIDE_LINKS['catalogue'],
        'comment_commander_url' => self::GUIDE_LINKS['comment_commander'],
        'contact_commercial_url'=> self::GUIDE_LINKS['contact_commercial'],
        'faq_url'             => self::GUIDE_LINKS['faq'],
        'commercial_name'     => 'Équipe commerciale Company-Test',
        'commercial_email'    => 'commercial@Company-Test.fr',
        'commercial_phone'    => '+33 1 XX XX XX XX',
      ]
    );
  }
}
```

```twig
{# templates/emails/bienvenue-b2b.html.twig #}
<!DOCTYPE html>
<html lang="fr">
<body style="font-family: Arial, sans-serif; color: #333;">
  <div style="max-width:600px; margin:0 auto; padding:20px;">
    <img src="{{ base_url }}/themes/custom/Company-Test_b2b_theme/logo.png" alt="Company-Test" height="50">

    <h2 style="color:#003B6F;">Bienvenue sur la plateforme Company-Test B2B, {{ raison_sociale }} !</h2>

    <p>Votre compte professionnel est maintenant activé. Vous pouvez dès maintenant
       accéder à notre catalogue et passer vos commandes en ligne.</p>

    <h3>Guide de démarrage rapide</h3>
    <table style="width:100%; border-collapse:collapse;">
      <tr>
        <td style="padding:12px; background:#f4f8ff; border-radius:4px;">
          <strong>1. Parcourir le catalogue</strong><br>
          <a href="{{ catalogue_url }}" style="color:#003B6F;">
            Accéder au catalogue Câbles FTTH et Boîtiers fibres
          </a>
        </td>
      </tr>
      <tr><td style="height:8px;"></td></tr>
      <tr>
        <td style="padding:12px; background:#f4f8ff; border-radius:4px;">
          <strong>2. Passer votre première commande</strong><br>
          <a href="{{ comment_commander_url }}" style="color:#003B6F;">
            Voir le guide pas-à-pas
          </a>
        </td>
      </tr>
      <tr><td style="height:8px;"></td></tr>
      <tr>
        <td style="padding:12px; background:#f4f8ff; border-radius:4px;">
          <strong>3. Contacter votre commercial dédié</strong><br>
          {{ commercial_name }}<br>
          <a href="mailto:{{ commercial_email }}">{{ commercial_email }}</a> —
          {{ commercial_phone }}
        </td>
      </tr>
    </table>

    <div style="margin-top:24px; text-align:center;">
      <a href="{{ catalogue_url }}"
         style="background:#003B6F; color:white; padding:12px 28px;
                text-decoration:none; border-radius:4px; font-size:16px;">
        Accéder au catalogue
      </a>
    </div>

    <p style="margin-top:24px; font-size:12px; color:#999;">
      Des questions ? Consultez notre
      <a href="{{ faq_url }}">FAQ</a> ou
      <a href="{{ contact_commercial_url }}">contactez-nous</a>.
    </p>
  </div>
</body>
</html>
```

### DoD checklist US-023

| Critère | Vérifié |
|---------|---------|
| Email bienvenue envoyé lors de l'activation du compte (transition → actif) | [ ] |
| Liens catalogue, guide commande, contact commercial présents et fonctionnels | [ ] |
| Nom de la raison sociale personnalisé dans l'email | [ ] |
| Email bienvenue envoyé APRÈS (et non À LA PLACE DE) l'email d'activation | [ ] |
| Template HTML rendu correct sur Outlook, Gmail, mobile | [ ] |
| Tests PHPUnit AccountActivationSubscriber (both emails sent) | [ ] |
| Staging validé PO | [ ] |

---

## Stabilisation — Audits & Optimisations (4 SP)

### Section A — Audit Lighthouse (score cible > 85)

```bash
# Lancer l'audit Lighthouse en CI (via Lighthouse CI)
npm install -g @lhci/cli
lhci autorun --config=lighthouserc.yml

# lighthouserc.yml (à créer à la racine du projet)
ci:
  collect:
    url:
      - https://staging.Company-Test.fr/catalogue
      - https://staging.Company-Test.fr/produits/cable-ftth-os1
      - https://staging.Company-Test.fr/mon-compte/commandes
  assert:
    assertions:
      categories:performance:
        - error
        - minScore: 0.85
      categories:accessibility:
        - error
        - minScore: 0.85
      categories:best-practices:
        - error
        - minScore: 0.90
      categories:seo:
        - error
        - minScore: 0.85
```

**Points d'optimisation prioritaires identifiés**

| Axe | Action | Impact |
|-----|--------|--------|
| Images | Convertir images produits en WebP, attribut `loading="lazy"` | +15 pts Performance |
| CSS critique | Inline Critical CSS (above-the-fold) + defer CSS non-critique | +10 pts Performance |
| Cache navigateur | Headers `Cache-Control: max-age=31536000` sur assets statiques (Nginx) | +8 pts Performance |
| Core Web Vitals | Mesurer LCP < 2.5s, CLS < 0.1, FID < 100ms | Perf globale |
| Accessibilité | Contraste texte/fond ratios WCAG AA, alt images produits | +5 pts Accessibility |

### Section B — Optimisations Redis

```php
<?php
// Vérification hit rate Redis (à exécuter en drush eval ou Controller de debug)
// src/Controller/RedisHealthController.php — accès restreint admin

declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Controller;

use Drupal\Core\Controller\ControllerBase;
use Symfony\Component\HttpFoundation\JsonResponse;

class RedisHealthController extends ControllerBase {

  public function stats(): JsonResponse {
    $redis  = \Drupal::service('redis.factory')->getClient();
    $info   = $redis->info('stats');

    $hits   = (int) ($info['keyspace_hits'] ?? 0);
    $misses = (int) ($info['keyspace_misses'] ?? 0);
    $total  = $hits + $misses;
    $hitRate = $total > 0 ? round(($hits / $total) * 100, 2) : 0;

    return new JsonResponse([
      'keyspace_hits'   => $hits,
      'keyspace_misses' => $misses,
      'hit_rate_percent'=> $hitRate,
      'target'          => '> 80%',
      'status'          => $hitRate >= 80 ? 'OK' : 'ATTENTION',
    ]);
  }
}
```

```php
// settings.php — configuration Redis optimisée (Level 2)
$settings['redis.connection']['interface'] = 'PhpRedis';
$settings['redis.connection']['host']      = '127.0.0.1';
$settings['redis.connection']['port']      = 6379;
$settings['cache']['default']              = 'cache.backend.redis';

// TTL par bin de cache — optimisation granulaire
$settings['cache_ttl_overrides'] = [
  'cache.bin.render'        => 3600,   // 1h pour le rendu HTML
  'cache.bin.page'          => 300,    // 5 min pour les pages
  'cache.bin.bootstrap'     => 86400,  // 24h pour bootstrap Drupal
  'cache.bin.config'        => 86400,  // 24h pour la config
  'shipping_rate_cache'     => 3600,   // 1h pour les tarifs livraison (US-019)
  'stripe_idempotence'      => 86400,  // 24h pour idempotence Stripe (US-016)
];
```

**Commandes Redis de diagnostic**

```bash
# Connexion Redis CLI
redis-cli -h 127.0.0.1 -p 6379

# Stats générales
INFO stats

# Clés par pattern
KEYS "drupal:cache:shipping_rate:*"
KEYS "drupal:cache:stripe_idempotence:*"

# Durée de vie d'une clé
TTL "drupal:cache:shipping_rate:chronopost:5.0:75001"

# Vider uniquement le cache rendu (sans vider toute la conf)
drush php:eval "\Drupal::cache('render')->deleteAll();"

# Vider les tarifs livraison Redis
redis-cli KEYS "drupal:cache:default:shipping_rate:*" | xargs redis-cli DEL
```

### Section C — Tests de charge (cible : 100 utilisateurs simultanés)

```yaml
# k6-load-test.js — scénario test de charge catalogue B2B (100 users)
# Exécution : k6 run k6-load-test.js

import http from 'k6/http';
import { sleep, check } from 'k6';
import { Rate } from 'k6/metrics';

const errorRate = new Rate('errors');

export const options = {
  stages: [
    { duration: '2m', target: 25  },   // Montée progressive 0 → 25 users
    { duration: '5m', target: 100 },   // Charge nominale 100 users
    { duration: '2m', target: 0   },   // Descente
  ],
  thresholds: {
    http_req_duration: ['p(95)<500'],   // 95% des requêtes < 500ms
    errors:            ['rate<0.01'],   // Taux d'erreur < 1%
  },
};

const BASE_URL = 'https://staging.Company-Test.fr';

export default function () {
  // Scénario 1 : Navigation catalogue (utilisateur anonyme)
  const catalogResponse = http.get(`${BASE_URL}/catalogue`);
  check(catalogResponse, { 'catalogue status 200': r => r.status === 200 });
  errorRate.add(catalogResponse.status !== 200);
  sleep(1);

  // Scénario 2 : Fiche produit
  const productResponse = http.get(`${BASE_URL}/produits/cable-ftth-os1`);
  check(productResponse, { 'fiche produit status 200': r => r.status === 200 });
  sleep(0.5);

  // Scénario 3 : Filtres catalogue AJAX
  const filterResponse = http.get(`${BASE_URL}/catalogue?fibre=os1&conditionnement=bobine_100m`);
  check(filterResponse, { 'filtres status 200': r => r.status === 200 });
  sleep(1);
}
```

**Résultats cibles**

| Métrique | Cible | Seuil critique |
|----------|-------|----------------|
| p(95) temps réponse | < 500ms | > 1000ms = échec |
| Taux d'erreur HTTP | < 1% | > 5% = blocant |
| Throughput | > 50 req/s | — |
| CPU serveur | < 70% | > 90% = alerte |
| Mémoire Redis | < 512 MB | > 1 GB = alerte |

### Section D — Correctifs DoD manquants

```bash
# Revue DoD des sprints précédents — commandes de vérification

# PHPUnit — lancer la suite complète du module
./vendor/bin/phpunit modules/custom/Company-Test_b2b --testdox

# Behat — lancer les scénarios
./vendor/bin/behat features/Company-Test_b2b/

# Vérification coding standards PSR-12 + Drupal
./vendor/bin/phpcs --standard=Drupal,DrupalPractice modules/custom/Company-Test_b2b

# Auto-correction des violations de style
./vendor/bin/phpcbf --standard=Drupal,DrupalPractice modules/custom/Company-Test_b2b

# Vérification sécurité (Composer audit)
composer audit

# Vérification modules Drupal avec mises à jour de sécurité
drush pm:security
```

---

## Checklist Go-Live — 20 points de vérification avant mise en production

### Infrastructure & Sécurité

| # | Point de contrôle | Responsable | Statut |
|---|-------------------|-------------|--------|
| 1 | Certificat SSL/TLS valide et non expirant dans les 30 jours | DevOps | [ ] |
| 2 | HSTS activé (Strict-Transport-Security: max-age=31536000) | DevOps | [ ] |
| 3 | Toutes les clés API en variables d'environnement (jamais en .env versionné) | Dev1 | [ ] |
| 4 | Clés Stripe prod distinctes des clés sandbox (vérifier Stripe Dashboard) | Dev1 | [ ] |
| 5 | Webhook Stripe endpoint configuré en production dans Stripe Dashboard | Dev1 | [ ] |
| 6 | Rate limiting Nginx activé sur `/webhook/stripe` (max 10 req/s) | DevOps | [ ] |
| 7 | Rate limiting global Nginx (max 100 req/s par IP) | DevOps | [ ] |
| 8 | Headers sécurité HTTP (X-Frame-Options, X-Content-Type-Options, CSP) | DevOps | [ ] |

### Données & Sauvegarde

| # | Point de contrôle | Responsable | Statut |
|---|-------------------|-------------|--------|
| 9 | Sauvegarde automatique DB MySQL (cron quotidien, rétention 7 jours) | DevOps | [ ] |
| 10 | Test de restauration DB validé (< 30 min RTO) | DevOps | [ ] |
| 11 | Sauvegarde fichiers `/sites/default/files` incluse dans backup | DevOps | [ ] |
| 12 | Répertoire factures PDF (hors webroot) inclus dans backup | DevOps | [ ] |

### Monitoring & Logs

| # | Point de contrôle | Responsable | Statut |
|---|-------------------|-------------|--------|
| 13 | Monitoring uptime configuré (alerte < 5 min si down) | DevOps | [ ] |
| 14 | Logs Drupal watchdog → syslog ou service centralisé (Graylog, ELK) | DevOps | [ ] |
| 15 | Alertes mail/Slack sur erreurs PHP niveau CRITICAL | DevOps | [ ] |
| 16 | Dashboard Redis (hit rate, mémoire) accessible équipe | Dev1 | [ ] |

### Validation fonctionnelle finale

| # | Point de contrôle | Responsable | Statut |
|---|-------------------|-------------|--------|
| 17 | Parcours E2E complet validé en pré-prod (inscription → commande → paiement 3DS → facture → suivi) | QA | [ ] |
| 18 | Lighthouse score > 85 sur les 3 pages clés (catalogue, fiche produit, checkout) | Dev Team | [ ] |
| 19 | Module `devel`, `webprofiler`, `stage_file_proxy` désactivés et non présents dans prod | Dev1 | [ ] |
| 20 | Configuration `error_reporting` Drupal = off en production (pas d'exposition d'erreurs PHP) | Dev1 | [ ] |

---

## Commandes de déploiement Production — Séquence complète

```bash
#!/bin/bash
# deploy_production.sh — Séquence de mise en production Company-Test B2B
# Exécuter en tant qu'utilisateur de déploiement (non root)
# Durée estimée : 15-20 minutes

set -e  # Stop on first error

echo "=== [1/10] Déploiement Production Company-Test B2B - $(date) ==="

# 1. Vérifier le statut git avant déploiement
echo "[1/10] Vérification branch main..."
git checkout main
git pull origin main
git log --oneline -5

# 2. Activer le mode maintenance Drupal
echo "[2/10] Activation mode maintenance..."
drush state:set system.maintenance_mode 1 --input-format=integer
drush cr

# 3. Récupérer les dépendances PHP
echo "[3/10] Composer install..."
composer install --no-dev --optimize-autoloader --no-interaction

# 4. Mises à jour base de données
echo "[4/10] Mises à jour DB..."
drush updatedb --yes --no-interaction

# 5. Import de la configuration depuis config/sync
echo "[5/10] Import configuration Drupal..."
drush config:import --yes --no-interaction

# 6. Rebuild des routes (nouvelles routes IP Sprint)
echo "[6/10] Rebuild router..."
drush router:rebuild

# 7. Activer les modules requis (si nouveau)
echo "[7/10] Activation modules..."
drush pm:enable commerce_shipping profile --yes

# 8. Vider les caches Redis et Drupal
echo "[8/10] Vidage caches..."
redis-cli -h 127.0.0.1 -p 6379 FLUSHDB
drush cr

# 9. Warmup cache (optionnel — crawler pages clés)
echo "[9/10] Warmup cache pages clés..."
curl -s https://www.Company-Test.fr/catalogue > /dev/null
curl -s https://www.Company-Test.fr/ > /dev/null

# 10. Désactiver le mode maintenance
echo "[10/10] Désactivation mode maintenance..."
drush state:set system.maintenance_mode 0 --input-format=integer
drush cr

echo "=== Déploiement terminé - $(date) ==="
echo "Vérifier : https://www.Company-Test.fr"
```

```bash
# Commandes post-déploiement — vérifications rapides

# Statut du site
drush status

# Vérifier les erreurs récentes dans watchdog
drush watchdog:show --count=20 --severity=error

# Vérifier les modules activés
drush pm:list --status=enabled --type=module | grep Company-Test

# Vérifier la config Stripe prod (ne pas afficher la valeur en clair)
drush config:get Company-Test_b2b.settings stripe_publishable_key

# Tester le webhook Stripe (Stripe CLI)
stripe trigger payment_intent.succeeded

# Vérifier Redis
redis-cli ping
redis-cli info keyspace

# Lancer un test Lighthouse rapide post-déploiement
npx lighthouse https://www.Company-Test.fr/catalogue --output=json --output-path=./lighthouse-prod.json
```

---

## Checklist de fin d'IP Sprint

| US / Tâche | PHPUnit | Behat | Config YAML | Code Review | Staging | Go-Live DSI |
|------------|---------|-------|-------------|-------------|---------|-------------|
| US-004 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| US-020 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| US-022 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| US-023 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Lighthouse > 85 | N/A | N/A | N/A | [ ] | [ ] | [ ] |
| Redis hit rate > 80% | N/A | N/A | N/A | [ ] | [ ] | [ ] |
| Tests de charge 100 users | N/A | N/A | N/A | [ ] | [ ] | [ ] |
| Checklist Go-Live 20 points | N/A | N/A | N/A | [ ] | [ ] | [ ] |
| Script deploy_production.sh validé | N/A | N/A | N/A | [ ] | [ ] | [ ] |

---

## Revue PI — Points d'attention V2

À documenter en fin d'IP Sprint pour préparer le PI suivant :
- Intégration ERP/SAP (hors périmètre V1 — phase 2)
- Module marketplace multi-vendeur (hors périmètre V1)
- Export commandes CSV (périmètre V1 — traitement manuel validé — à automatiser V2)
- Internationalisation (belgique, luxembourg — langues NL/DE)
- API mobile (App acheteur B2B — périmètre V2)
