# Tâches Dev — Sprint 4 — Livraisons & Enrichissement UX

> Agent : AGENT-DEV-DRUPAL-PHP.md
> Stack : Drupal 10 · Commerce 2.x · PHP 8.2 · Stripe · SendGrid · Chronopost REST API · Redis 7.x
> Code Level 2 : illustrative — intent + patterns

---

## Vue d'ensemble sprint

| US | Titre | SP | Dev assigné | Branch Git |
|----|-------|----|-------------|------------|
| US-019 | Calcul frais livraison automatique (Chronopost/Colissimo) | 5 | Dev1 + Dev2 | `feature/US-019-frais-livraison` |
| US-021 | Envoi numéro suivi transporteur | 3 | Dev3 | `feature/US-021-suivi-transporteur` |
| US-003 | Filtres catalogue avancés (référence, type fibre, conditionnement) | 3 | Dev4 | `feature/US-003-filtres-catalogue` |
| US-008 | Tarifs négociés spécifiques par client B2B | 5 | Dev1 | `feature/US-008-tarifs-negocies` |

**Vélocité Sprint 4 :** 16 SP
**Prérequis :** Sprint 3 livré (paiement Stripe opérationnel), module `commerce_shipping` installé, accès sandbox API Chronopost confirmé

---

## US-019 — Calcul frais livraison automatique (5 SP)

**Branche :** `feature/US-019-frais-livraison`

### Composants à créer / modifier

| Fichier | Action | Description |
|---------|--------|-------------|
| `src/Service/ShippingRateCalculatorService.php` | create | Calcul tarifs livraison : appel API Chronopost + grille tarifaire poids/CP + cache Redis |
| `src/Plugin/Commerce/ShippingMethod/ChronopostShippingMethod.php` | create | Plugin Commerce Shipping — intègre ShippingRateCalculatorService |
| `src/Plugin/Commerce/ShippingMethod/ColissimoShippingMethod.php` | create | Plugin Colissimo alternatif (France métropolitaine) |
| `src/Service/ChronopostApiClient.php` | create | Client HTTP pour API REST Chronopost (tarification sandbox/prod) |
| `config/install/commerce_shipping.shipping_method.chronopost_express.yml` | create | Configuration méthode livraison Chronopost Express |
| `config/install/commerce_shipping.shipping_method.colissimo_standard.yml` | create | Configuration méthode livraison Colissimo Standard |
| `Company-Test_b2b.services.yml` | modify | Déclarer ShippingRateCalculatorService avec injection CacheBackendInterface (Redis) |

### Snippet illustratif Level 2

```php
<?php
// src/Service/ShippingRateCalculatorService.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Service;

use Drupal\commerce_price\Price;
use Drupal\commerce_shipping\ShipmentInterface;
use Drupal\Core\Cache\CacheBackendInterface;

class ShippingRateCalculatorService {

  private const CACHE_TTL = 3600; // 1 heure — Redis

  public function __construct(
    private readonly ChronopostApiClient $chronopost,
    private readonly CacheBackendInterface $redisCacheBackend,
  ) {}

  /**
   * Calcule les frais de livraison pour un envoi.
   * Priorité : cache Redis → API Chronopost → grille tarifaire fallback.
   */
  public function calculate(ShipmentInterface $shipment, string $carrier = 'chronopost'): Price {
    $cacheKey = $this->buildCacheKey($shipment, $carrier);
    $cached   = $this->redisCacheBackend->get($cacheKey);

    if ($cached !== false) {
      return new Price($cached->data['amount'], $cached->data['currency']);
    }

    $weight    = $this->getWeightKg($shipment);
    $postCode  = $shipment->getShippingProfile()->get('address')->postal_code ?? '75001';

    try {
      $rate = match ($carrier) {
        'chronopost' => $this->chronopost->getRate($weight, $postCode),
        'colissimo'  => $this->getFallbackRate($weight),
        default      => $this->getFallbackRate($weight),
      };
    } catch (\Exception $e) {
      // Fallback sur grille locale si API indisponible
      $rate = $this->getFallbackRate($weight);
    }

    // Mise en cache Redis TTL 3600s
    $this->redisCacheBackend->set(
      $cacheKey,
      ['amount' => $rate, 'currency' => 'EUR'],
      time() + self::CACHE_TTL
    );

    return new Price((string) $rate, 'EUR');
  }

  /**
   * Grille tarifaire locale (fallback si API indisponible).
   * Poids en kg → tarif HT en EUR
   */
  private function getFallbackRate(float $weightKg): float {
    return match (true) {
      $weightKg <= 1.0  => 5.90,
      $weightKg <= 5.0  => 8.50,
      $weightKg <= 10.0 => 12.00,
      $weightKg <= 30.0 => 18.50,
      default           => 29.90,
    };
  }

  private function getWeightKg(ShipmentInterface $shipment): float {
    return $shipment->getWeight()->convert('kg')->getNumber();
  }

  private function buildCacheKey(ShipmentInterface $shipment, string $carrier): string {
    $weight   = round($this->getWeightKg($shipment), 1);
    $postCode = $shipment->getShippingProfile()->get('address')->postal_code ?? 'default';
    return "shipping_rate:{$carrier}:{$weight}:{$postCode}";
  }
}
```

```php
<?php
// src/Service/ChronopostApiClient.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Service;

use GuzzleHttp\ClientInterface;

class ChronopostApiClient {

  private const SANDBOX_BASE_URL = 'https://ws.chronopost.fr/tarification-cxf/TarificationServiceWS';

  public function __construct(
    private readonly ClientInterface $httpClient,
    private readonly string $accountNumber,
    private readonly string $password,
    private readonly bool $sandbox = true,
  ) {}

  /**
   * Appel API REST Chronopost (simulé en sandbox).
   * Retourne le tarif HT en EUR.
   */
  public function getRate(float $weightKg, string $destinationPostCode): float {
    // Appel API simulé Level 2 — structure réelle à adapter selon contrat Chronopost
    $response = $this->httpClient->post(self::SANDBOX_BASE_URL, [
      'json' => [
        'accountNumber'          => $this->accountNumber,
        'password'               => $this->password,
        'shippingDate'           => date('d/m/Y'),
        'destinationCountryCode' => 'FR',
        'destinationPostalCode'  => $destinationPostCode,
        'weight'                 => $weightKg,
        'productCode'            => '01', // Chronopost Express
      ],
    ]);

    $data = json_decode($response->getBody()->getContents(), true);
    return (float) ($data['price']['amount'] ?? 0.0);
  }
}
```

```php
<?php
// src/Plugin/Commerce/ShippingMethod/ChronopostShippingMethod.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Plugin\Commerce\ShippingMethod;

use Drupal\commerce_shipping\Plugin\Commerce\ShippingMethod\ShippingMethodBase;
use Drupal\commerce_shipping\ShippingRate;
use Drupal\commerce_shipping\ShipmentInterface;

/**
 * @CommerceShippingMethod(
 *   id = "Company-Test_chronopost",
 *   label = "Chronopost Express 24h",
 * )
 */
class ChronopostShippingMethod extends ShippingMethodBase {

  public function calculateRates(ShipmentInterface $shipment): array {
    $price = $this->shippingCalculator->calculate($shipment, 'chronopost');

    return [
      new ShippingRate(
        id: 'chronopost_express',
        shippingMethod: $this->parentEntity,
        amount: $price,
        description: 'Livraison Chronopost Express 24h'
      ),
    ];
  }
}
```

```yaml
# Company-Test_b2b.services.yml — ajout cache Redis pour shipping
services:
  Company-Test_b2b.shipping_rate_calculator:
    class: Drupal\Company-Test_b2b\Service\ShippingRateCalculatorService
    arguments:
      - '@Company-Test_b2b.chronopost_api_client'
      - '@cache.default'   # pointe vers Redis si PhpRedis configuré dans settings.php
    tags:
      - { name: service_collector, tag: Company-Test_b2b.shipping }

  Company-Test_b2b.chronopost_api_client:
    class: Drupal\Company-Test_b2b\Service\ChronopostApiClient
    arguments:
      - '@http_client'
      - '%Company-Test_b2b.chronopost_account%'
      - '%Company-Test_b2b.chronopost_password%'
      - true   # sandbox mode
```

### DoD checklist US-019

| Critère | Vérifié |
|---------|---------|
| Calcul frais Chronopost affiché au checkout (étape livraison) | [ ] |
| Cache Redis peuplé après 1er appel — TTL 3600s confirmé | [ ] |
| Fallback grille tarifaire locale si API Chronopost indisponible | [ ] |
| Au moins 2 méthodes livraison proposées (Chronopost Express + Colissimo Standard) | [ ] |
| Frais calculés en fonction du poids et du code postal | [ ] |
| Tests PHPUnit ShippingRateCalculatorService (mock API + mock Redis) | [ ] |
| Tests PHPUnit getFallbackRate (toutes les tranches de poids) | [ ] |
| Code review (Dev1 → Dev2) | [ ] |
| Staging validé PO — démonstration checkout avec livraison | [ ] |

---

## US-021 — Envoi numéro suivi transporteur (3 SP)

**Branche :** `feature/US-021-suivi-transporteur`

### Composants à créer / modifier

| Fichier | Action | Description |
|---------|--------|-------------|
| `src/EventSubscriber/OrderShippedSubscriber.php` | create | Listener transition `ship` → email SendGrid avec numéro de suivi |
| `config/install/field.field.commerce_order.default.field_tracking_number.yml` | create | Champ `field_tracking_number` (string) sur entité `commerce_order` |
| `config/install/field.field.commerce_order.default.field_tracking_carrier.yml` | create | Champ `field_tracking_carrier` (list string : chronopost, colissimo) |
| `config/install/field.storage.commerce_order.field_tracking_number.yml` | create | Stockage champ tracking number |
| `templates/emails/expedition-tracking.html.twig` | create | Template HTML email expédition avec lien tracking URL |
| `Company-Test_b2b.module` | modify | `hook_mail()` : clé `shipment_tracking` avec variables tracking |

### Snippet illustratif Level 2

```php
<?php
// src/EventSubscriber/OrderShippedSubscriber.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\EventSubscriber;

use Drupal\commerce_order\Event\OrderEvent;
use Drupal\commerce_order\Event\OrderEvents;
use Drupal\Core\Mail\MailManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class OrderShippedSubscriber implements EventSubscriberInterface {

  // URLs de tracking des transporteurs
  private const TRACKING_URLS = [
    'chronopost' => 'https://www.chronopost.fr/tracking-no-cms/suivi-page?listeNumerosLT={tracking_number}',
    'colissimo'  => 'https://www.laposte.fr/outils/suivre-vos-envois?code={tracking_number}',
  ];

  public function __construct(
    private readonly MailManagerInterface $mailManager,
  ) {}

  public static function getSubscribedEvents(): array {
    return [
      // Écoute la transition de workflow 'ship' sur les commandes Commerce
      'commerce_order.ship.post_transition' => 'onOrderShipped',
    ];
  }

  public function onOrderShipped(OrderEvent $event): void {
    $order          = $event->getOrder();
    $trackingNumber = $order->get('field_tracking_number')->value;
    $carrier        = $order->get('field_tracking_carrier')->value ?? 'chronopost';

    if (empty($trackingNumber)) {
      // Pas de numéro de suivi renseigné — pas d'email
      return;
    }

    $trackingUrl = str_replace(
      '{tracking_number}',
      urlencode($trackingNumber),
      self::TRACKING_URLS[$carrier] ?? self::TRACKING_URLS['chronopost']
    );

    $this->mailManager->mail(
      'Company-Test_b2b',
      'shipment_tracking',
      $order->getCustomer()->getEmail(),
      'fr',
      [
        'order'          => $order,
        'tracking_number'=> $trackingNumber,
        'carrier'        => ucfirst($carrier),
        'tracking_url'   => $trackingUrl,
        'estimated_date' => $this->getEstimatedDeliveryDate($carrier),
      ]
    );
  }

  private function getEstimatedDeliveryDate(string $carrier): string {
    $days = match ($carrier) {
      'chronopost' => 1,
      'colissimo'  => 3,
      default      => 5,
    };
    return (new \DateTimeImmutable("+{$days} weekdays"))->format('d/m/Y');
  }
}
```

```yaml
# config/install/field.field.commerce_order.default.field_tracking_number.yml
langcode: fr
status: true
field_name: field_tracking_number
entity_type: commerce_order
bundle: default
label: 'Numéro de suivi transporteur'
required: false
settings:
  max_length: 50
  is_ascii: false
field_type: string
```

```twig
{# templates/emails/expedition-tracking.html.twig #}
<p>Bonjour {{ order.getCustomer().getDisplayName() }},</p>
<p>Votre commande <strong>N° {{ order.getOrderNumber() }}</strong> a été expédiée.</p>
<p>
  Transporteur : <strong>{{ carrier }}</strong><br>
  Numéro de suivi : <strong>{{ tracking_number }}</strong><br>
  Livraison estimée : <strong>{{ estimated_date }}</strong>
</p>
<p>
  <a href="{{ tracking_url }}" style="background:#003B6F;color:white;padding:10px 20px;text-decoration:none;border-radius:4px;">
    Suivre ma livraison
  </a>
</p>
<p>Merci de votre confiance,<br>L'équipe Company-Test</p>
```

### DoD checklist US-021

| Critère | Vérifié |
|---------|---------|
| Champ `field_tracking_number` présent sur formulaire admin commande | [ ] |
| Email SendGrid envoyé automatiquement à la transition `ship` | [ ] |
| Lien tracking URL fonctionnel pour Chronopost ET Colissimo | [ ] |
| Email non envoyé si champ tracking vide | [ ] |
| Date de livraison estimée calculée selon transporteur | [ ] |
| Tests PHPUnit OrderShippedSubscriber | [ ] |
| Template email responsive validé (desktop + mobile) | [ ] |
| Code review (Dev3 → Dev4) | [ ] |
| Staging validé PO | [ ] |

---

## US-003 — Filtres catalogue avancés (3 SP)

**Branche :** `feature/US-003-filtres-catalogue`

### Composants à créer / modifier

| Fichier | Action | Description |
|---------|--------|-------------|
| `config/install/views.view.catalog_by_category.yml` | modify | Ajouter filtres exposés : référence SKU, taxo type fibre, taxo conditionnement |
| `config/install/taxonomy.vocabulary.fiber_type.yml` | create | Vocabulaire "Type de fibre" (OS1, OM3, OM4, OM5) |
| `config/install/taxonomy.vocabulary.packaging.yml` | create | Vocabulaire "Conditionnement" (bobine 100m, 300m, 500m, câble à l'unité) |
| `templates/views/views-view--catalog-by-category--exposed-form.html.twig` | create | Template Twig formulaire filtres exposés avec AJAX |
| `js/catalog-filters.js` | create | AJAX views refresh + mise à jour URL query params (deep-linking) |
| `css/catalog-filters.css` | create | Styles filtres (accordéon mobile, chips de filtres actifs) |

### Snippet illustratif Level 2

```yaml
# config/install/views.view.catalog_by_category.yml — ajout filtres exposés (Level 2)
# Extrait de la section filters dans display.default.display_options
filters:
  sku_reference:
    id: sku
    table: commerce_product_variation_field_data
    field: sku
    label: 'Référence produit'
    operator: contains
    exposed: true
    expose:
      identifier: ref
      label: 'Rechercher par référence'
      use_operator: false
  field_fiber_type_target_id:
    id: field_fiber_type_target_id
    table: commerce_product__field_fiber_type
    field: field_fiber_type_target_id
    label: 'Type de fibre'
    exposed: true
    expose:
      identifier: fibre
      label: 'Type de fibre'
    type: select
    reduce_duplicates: true
  field_packaging_target_id:
    id: field_packaging_target_id
    table: commerce_product__field_packaging
    field: field_packaging_target_id
    label: 'Conditionnement'
    exposed: true
    expose:
      identifier: conditionnement
      label: 'Conditionnement'
    type: checkboxes
use_ajax: true
exposed_form:
  type: input_required
  options:
    submit_button: 'Filtrer'
    reset_button: true
    reset_button_label: 'Réinitialiser'
    autosubmit: true   # AJAX auto-submit
    autosubmit_hide: false
```

```javascript
// js/catalog-filters.js — Deep-linking URL + AJAX Views
(function ($, Drupal, drupalSettings) {
  'use strict';

  Drupal.behaviors.Company-TestCatalogFilters = {
    attach: function (context, settings) {
      const $form = $('.views-exposed-form', context).once('catalog-filters');
      if (!$form.length) return;

      // Restaurer les filtres depuis les query params URL au chargement
      const urlParams = new URLSearchParams(window.location.search);
      urlParams.forEach(function (value, key) {
        const $field = $form.find('[name="' + key + '"]');
        if ($field.is(':checkbox')) {
          $field.filter('[value="' + value + '"]').prop('checked', true);
        } else {
          $field.val(value);
        }
      });

      // Mettre à jour l'URL sans rechargement de page à chaque changement AJAX
      $(document).on('ajaxSuccess', function (event, xhr, settings) {
        if (settings.url && settings.url.includes('views/ajax')) {
          const formData = new FormData($form[0]);
          const params   = new URLSearchParams();
          formData.forEach(function (value, key) {
            if (value && key !== 'form_build_id' && key !== 'form_token') {
              params.set(key, value);
            }
          });
          window.history.replaceState({}, '', '?' + params.toString());
        }
      });

      // Afficher les chips des filtres actifs
      $form.find('select, input[type="checkbox"]').on('change', function () {
        updateActiveFilterChips($form);
      });
    }
  };

  function updateActiveFilterChips($form) {
    const $chipsContainer = $('#active-filters-chips');
    $chipsContainer.empty();
    $form.find('select option:selected, input[type="checkbox"]:checked').each(function () {
      const label = $(this).text() || $(this).val();
      $chipsContainer.append(
        '<span class="filter-chip">' + label + ' <button type="button" data-target="' +
        $(this).attr('name') + '">×</button></span>'
      );
    });
  }

})(jQuery, Drupal, drupalSettings);
```

```yaml
# config/install/taxonomy.vocabulary.fiber_type.yml
langcode: fr
status: true
name: 'Type de fibre'
vid: fiber_type
description: 'Classification fibre optique : OS1, OM3, OM4, OM5'
```

### DoD checklist US-003

| Critère | Vérifié |
|---------|---------|
| Filtre "Référence produit" (recherche SKU partielle) fonctionnel | [ ] |
| Filtre "Type de fibre" (taxonomie, select) fonctionnel | [ ] |
| Filtre "Conditionnement" (taxonomie, checkboxes) fonctionnel | [ ] |
| Rafraîchissement AJAX sans rechargement de page | [ ] |
| URL mise à jour avec query params pour deep-linking | [ ] |
| Filtres restaurés depuis l'URL au chargement de la page | [ ] |
| Bouton "Réinitialiser" efface les filtres et l'URL | [ ] |
| Chips filtres actifs affichés et supprimables | [ ] |
| Tests Behat filtres catalogue (scénario happy path + combinaison filtres) | [ ] |
| Responsive mobile — accordéon filtres sur petits écrans | [ ] |
| Staging validé PO | [ ] |

---

## US-008 — Tarifs négociés spécifiques par client B2B (5 SP)

**Branche :** `feature/US-008-tarifs-negocies`

### Composants à créer / modifier

| Fichier | Action | Description |
|---------|--------|-------------|
| `src/EventSubscriber/CustomerPriceSubscriber.php` | create | Étend B2bPriceSubscriber — priority +10 — applique prix négocié si `field_prix_negocie` renseigné |
| `config/install/field.storage.user.field_prix_negocie.yml` | create | Stockage Map field sur User (variation_id → prix négocié) |
| `config/install/field.field.user.user.field_prix_negocie.yml` | create | Instance field `field_prix_negocie` sur bundle User |
| `src/Form/NegotiatedPriceAdminForm.php` | create | Formulaire admin pour saisir les prix négociés par utilisateur + variation |
| `Company-Test_b2b.routing.yml` | modify | Route admin `/admin/Company-Test/prix-negocies/{user}` |
| `Company-Test_b2b.services.yml` | modify | Déclarer CustomerPriceSubscriber avec priority argument |

### Snippet illustratif Level 2

```php
<?php
// src/EventSubscriber/CustomerPriceSubscriber.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\EventSubscriber;

use Drupal\commerce_price\Price;
use Drupal\commerce_product\Event\ProductVariationAjaxChangeEvent;
use Drupal\commerce_price\Event\PriceCalculateEvent;
use Drupal\Core\Session\AccountInterface;
use Drupal\user\UserInterface;

/**
 * Subscriber prix négocié — priorité supérieure à B2bPriceSubscriber.
 * Applique un prix spécifique user_id + variation_id si configuré.
 * Fallback transparent sur le prix B2B standard si pas de prix négocié.
 */
class CustomerPriceSubscriber extends B2bPriceSubscriber {

  // Priorité +10 par rapport à B2bPriceSubscriber (priorité 0)
  private const PRIORITY = 10;

  public function __construct(
    private readonly AccountInterface $currentUser,
    private readonly \Drupal\user\UserStorageInterface $userStorage,
  ) {
    parent::__construct($currentUser);
  }

  public static function getSubscribedEvents(): array {
    return [
      PriceCalculateEvent::CALCULATE => ['onPriceCalculate', self::PRIORITY],
    ];
  }

  public function onPriceCalculate(PriceCalculateEvent $event): void {
    $account = $this->currentUser;
    if (!$account->hasRole('b2b_buyer')) {
      return; // Déléguer au parent B2bPriceSubscriber
    }

    /** @var UserInterface $user */
    $user = $this->userStorage->load($account->id());
    $variationId = $event->getPurchasedEntity()->id();

    $negotiatedPrice = $this->getNegotiatedPrice($user, $variationId);

    if ($negotiatedPrice !== null) {
      // Prix négocié trouvé → override du prix calculé
      $event->setPrice($negotiatedPrice);
      $event->stopPropagation(); // Ne pas appliquer le prix B2B standard
      return;
    }

    // Pas de prix négocié → laisser B2bPriceSubscriber gérer
    parent::onPriceCalculate($event);
  }

  /**
   * Récupère le prix négocié pour un utilisateur + variation donnés.
   * Format field_prix_negocie : [{"variation_id": "42", "price": "12.50", "currency": "EUR"}]
   */
  private function getNegotiatedPrice(UserInterface $user, string $variationId): ?Price {
    $rawValues = $user->get('field_prix_negocie')->getValue();

    foreach ($rawValues as $entry) {
      $data = json_decode($entry['value'] ?? '{}', true);
      if (isset($data['variation_id']) && (string) $data['variation_id'] === $variationId) {
        return new Price((string) $data['price'], $data['currency'] ?? 'EUR');
      }
    }

    return null; // Pas de prix négocié pour cette variation
  }
}
```

```php
<?php
// src/Form/NegotiatedPriceAdminForm.php
declare(strict_types=1);

namespace Drupal\Company-Test_b2b\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\user\UserInterface;

class NegotiatedPriceAdminForm extends FormBase {

  public function getFormId(): string {
    return 'Company-Test_negotiated_price_admin_form';
  }

  public function buildForm(array $form, FormStateInterface $form_state, UserInterface $user = null): array {
    $form['#title'] = 'Prix négociés pour ' . $user?->getDisplayName();

    $existingPrices = $this->getCurrentNegotiatedPrices($user);

    $form['prices_table'] = [
      '#type'   => 'table',
      '#header' => ['Variation produit', 'Prix HT (€)', 'Devise', 'Action'],
      '#prefix' => '<div id="prices-wrapper">',
      '#suffix' => '</div>',
    ];

    foreach ($existingPrices as $delta => $entry) {
      $form['prices_table'][$delta]['variation_id'] = [
        '#type'          => 'entity_autocomplete',
        '#target_type'   => 'commerce_product_variation',
        '#title'         => 'Variation',
        '#default_value' => $this->loadVariation($entry['variation_id']),
      ];
      $form['prices_table'][$delta]['price'] = [
        '#type'          => 'number',
        '#title'         => 'Prix HT',
        '#default_value' => $entry['price'],
        '#step'          => '0.01',
        '#min'           => 0,
      ];
      $form['prices_table'][$delta]['remove'] = [
        '#type'  => 'submit',
        '#value' => 'Supprimer',
        '#name'  => 'remove_' . $delta,
      ];
    }

    $form['actions']['submit'] = [
      '#type'  => 'submit',
      '#value' => 'Enregistrer les prix négociés',
    ];

    return $form;
  }

  public function submitForm(array &$form, FormStateInterface $form_state): void {
    // Sérialiser les prix négociés en JSON et sauvegarder sur l'utilisateur
    $user     = $form_state->getBuildInfo()['args'][0];
    $tableData = $form_state->getValue('prices_table');
    $encoded   = array_map(
      fn($row) => ['value' => json_encode([
        'variation_id' => $row['variation_id'],
        'price'        => $row['price'],
        'currency'     => 'EUR',
      ])],
      array_filter($tableData, fn($row) => !empty($row['variation_id']))
    );
    $user->set('field_prix_negocie', $encoded)->save();
    $this->messenger()->addStatus('Prix négociés mis à jour avec succès.');
  }

  private function getCurrentNegotiatedPrices(?UserInterface $user): array {
    if (!$user) return [];
    return array_map(
      fn($item) => json_decode($item['value'], true),
      $user->get('field_prix_negocie')->getValue()
    );
  }
}
```

```yaml
# Company-Test_b2b.services.yml — CustomerPriceSubscriber avec priorité
services:
  Company-Test_b2b.customer_price_subscriber:
    class: Drupal\Company-Test_b2b\EventSubscriber\CustomerPriceSubscriber
    arguments:
      - '@current_user'
      - '@entity_type.manager'
    tags:
      - { name: event_subscriber }
```

### DoD checklist US-008

| Critère | Vérifié |
|---------|---------|
| Prix négocié affiché sur fiche produit pour utilisateur B2B configuré | [ ] |
| Prix B2B standard affiché si aucun prix négocié configuré (fallback) | [ ] |
| Anonyme ne voit aucun prix (comportement US-002 préservé) | [ ] |
| Formulaire admin `/admin/Company-Test/prix-negocies/{user}` fonctionnel | [ ] |
| Prix négocié appliqué sur total panier et commande | [ ] |
| CustomerPriceSubscriber priorité +10 vs B2bPriceSubscriber confirmée | [ ] |
| Tests PHPUnit CustomerPriceSubscriber (avec + sans prix négocié) | [ ] |
| Tests PHPUnit fallback sur B2bPriceSubscriber si pas de prix | [ ] |
| Code review (Dev1 → Dev2) | [ ] |
| Staging validé PO — démonstration 2 users avec prix différents | [ ] |

---

## DoD Sprint 4 — Checklist Go-Live DSI (ajoutée suite retro Sprint 3)

### Critères techniques

| # | Critère | Responsable | Statut |
|---|---------|-------------|--------|
| 1 | SSL/TLS — certificat valide (Let's Encrypt ou CA officiel) | DevOps | [ ] |
| 2 | HTTPS forcé sur toutes les routes (HSTS header) | DevOps | [ ] |
| 3 | Sauvegarde DB automatique (quotidienne, rétention 7j) | DevOps | [ ] |
| 4 | Monitoring uptime (UptimeRobot ou équivalent) | DevOps | [ ] |
| 5 | Logs applicatifs configurés (Drupal watchdog → syslog) | Dev1 | [ ] |
| 6 | Rate limiting Stripe webhook (Nginx : 10 req/s) | DevOps | [ ] |
| 7 | Rate limiting global API (Nginx : 100 req/s) | DevOps | [ ] |
| 8 | Fichiers configuration exportés et versionnés (git) | Dev Team | [ ] |
| 9 | Pas de clé API en clair dans le code (config form + env vars) | Dev Team | [ ] |
| 10 | Module `devel` et `webprofiler` désactivés en prod | Dev1 | [ ] |

### Critères fonctionnels

| # | Critère | Responsable | Statut |
|---|---------|-------------|--------|
| 11 | Parcours achat complet E2E validé en staging (catalogue → panier → paiement 3DS → confirmation) | QA | [ ] |
| 12 | Email confirmation commande reçu < 2 min | QA | [ ] |
| 13 | Facture PDF générée et reçue par email | QA | [ ] |
| 14 | Calcul frais livraison correct sur 5 codes postaux tests | QA | [ ] |
| 15 | Filtres catalogue fonctionnels avec deep-linking | QA | [ ] |
| 16 | Prix négocié affiché correctement pour 2 users tests | QA | [ ] |

### Critères de performance

| # | Critère | Responsable | Statut |
|---|---------|-------------|--------|
| 17 | Lighthouse Performance score > 85 (mobile + desktop) | Dev Team | [ ] |
| 18 | Temps de réponse page catalogue < 300ms (cache chaud) | Dev Team | [ ] |
| 19 | Cache Redis opérationnel (hit rate > 80% en staging) | Dev1 | [ ] |
| 20 | Test de charge 50 utilisateurs simultanés sans dégradation | Dev Team | [ ] |

---

## Déploiement Sprint 4

### Séquence de déploiement sur staging

```bash
# 1. Merge develop
git checkout develop
git pull origin develop
git merge feature/US-019-frais-livraison --no-ff
git merge feature/US-021-suivi-transporteur --no-ff
git merge feature/US-003-filtres-catalogue --no-ff
git merge feature/US-008-tarifs-negocies --no-ff
git push origin develop

# 2. Sur le serveur staging
composer install --no-dev --optimize-autoloader

# 3. Activer les modules Commerce Shipping
drush en commerce_shipping -y

# 4. Mises à jour DB + config
drush updatedb -y
drush config:import -y

# 5. Créer les vocabulaires taxonomie (si migration nécessaire)
drush php:script modules/custom/Company-Test_b2b/scripts/create_taxonomies.php

# 6. Vider les caches Redis + Drupal
drush eval "Drupal::cache('default')->deleteAll();"
drush cr

# 7. Router rebuild (nouvelles routes admin prix négociés)
drush router:rebuild

# 8. Configurer les clés Chronopost staging
drush cset Company-Test_b2b.settings chronopost_account "Company-Test_TEST_ACCOUNT"
drush cset Company-Test_b2b.settings chronopost_password "test_password"
```

### Checklist de fin de Sprint 4

| US | PHPUnit | Behat | Config YAML | Code Review | Staging | Go-Live DSI |
|----|---------|-------|-------------|-------------|---------|-------------|
| US-019 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| US-021 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| US-003 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| US-008 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
