# Tâches de Développement — Sprint 1

## Référence
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 1 — Fondations Catalogue & Comptes B2B |
| Vélocité | 16 SP livrés |
| Agent | AGENT-DEV-DRUPAL-PHP.md |
| Branche git | `feature/sprint-01` → merge vers `develop` |

---

## US-001 — Navigation catalogue par catégorie (3 SP)

**Branche :** `feature/US-001-navigation-catalogue`

### Tâches

| # | Tâche | Composant Drupal | Effort |
|---|-------|-----------------|--------|
| T1 | Créer vocabulaire taxonomie "Catégorie produit" (Câbles FTTH, Boîtiers fibres) | Taxonomy + config YAML | 0.5j |
| T2 | Configurer Vue Drupal Views "Catalogue par catégorie" avec filtre exposed | Views | 0.5j |
| T3 | Configurer breadcrumb automatique (Easy Breadcrumb module) | Config YAML | 0.25j |
| T4 | Créer template Twig page catalogue avec compteur résultats | Theming | 0.5j |
| T5 | Page "Aucun produit disponible" pour catégorie vide | Views no-results | 0.25j |
| T6 | Export config YAML + tests Behat scénarios 1-5 | CMI + Behat | 0.5j |

### Points d'implémentation clés

```php
// Fichiers à créer / modifier
config/sync/taxonomy.vocabulary.product_category.yml
config/sync/views.view.catalog_by_category.yml
config/sync/easy_breadcrumb.settings.yml
web/themes/custom/Company-Test_b2b_theme/templates/views/
  └── views-view--catalog-by-category.html.twig
```

### Config YAML — taxonomie
```yaml
# taxonomy.vocabulary.product_category.yml
langcode: fr
status: true
name: 'Catégorie produit'
vid: product_category
description: 'Câbles FTTH, Boîtiers fibres, Accessoires'
```

---

## US-002 — Fiche produit complète + tarif B2B (5 SP)

**Branche :** `feature/US-002-fiche-produit-b2b`

### Tâches

| # | Tâche | Composant Drupal | Effort |
|---|-------|-----------------|--------|
| T1 | Créer types de produits Commerce : `cable_ftth` et `boitier_fibre` | Commerce Product + config YAML | 0.5j |
| T2 | Configurer les variations produit (référence SKU, conditionnement, prix) | Commerce Variation | 0.5j |
| T3 | Implémenter Price Resolver B2B (prix visible uniquement rôle `b2b_buyer`) | PriceSubscriber / hook_entity_access | 1j |
| T4 | Champ "Fiche technique PDF" sur type produit | Field config YAML | 0.25j |
| T5 | Template Twig fiche produit B2B (désignation, référence, prix HT, ajout panier) | Twig | 0.75j |
| T6 | Bloquer affichage prix pour anonyme — message "Connectez-vous" | Access control | 0.5j |
| T7 | Export config YAML + tests PHPUnit PriceResolver | CMI + PHPUnit | 0.5j |

### Points d'implémentation clés

```php
// src/EventSubscriber/B2bPriceSubscriber.php
class B2bPriceSubscriber implements EventSubscriberInterface {
  public function onPriceCalculate(PriceCalculateEvent $event): void {
    $account = $this->currentUser;
    if (!$account->hasRole('b2b_buyer')) {
      $event->stopPropagation(); // prix non résolu = masqué
    }
  }
}
```

```yaml
# config/sync/commerce_product_type.cable_ftth.yml
id: cable_ftth
label: 'Câble FTTH'
variationType: cable_ftth_variation
```

---

## US-005 — Création compte professionnel B2B (5 SP)

**Branche :** `feature/US-005-creation-compte-b2b`

### Tâches

| # | Tâche | Composant Drupal | Effort |
|---|-------|-----------------|--------|
| T1 | Créer module custom `Company-Test_b2b` (scaffold, info.yml, services.yml) | Module custom | 0.5j |
| T2 | Ajouter champs custom sur User : `field_raison_sociale`, `field_siret`, `field_telephone`, `field_compte_statut` | Field config YAML | 0.5j |
| T3 | Étendre le formulaire d'inscription `user.register` avec les champs B2B | `hook_form_alter()` | 0.5j |
| T4 | Créer `SiretConstraint` + `SiretConstraintValidator` (regex `^\d{14}$`) | Plugin Constraint | 0.5j |
| T5 | Statut initial "en_attente" à la création du compte | `hook_user_insert()` | 0.25j |
| T6 | Email de confirmation acheteur via SendGrid (template `b2b_registration_confirm`) | `hook_mail()` + MailManager | 0.75j |
| T7 | Email notif admin Company-Test (template `b2b_admin_new_request`) | `hook_mail()` | 0.5j |
| T8 | Redirection post-inscription vers page "En attente de validation" | `hook_user_insert()` redirect | 0.25j |
| T9 | Export config YAML + tests PHPUnit SiretValidator | CMI + PHPUnit | 0.25j |

### Points d'implémentation clés

```php
// src/Plugin/Validation/Constraint/SiretConstraintValidator.php
class SiretConstraintValidator extends ConstraintValidator {
  public function validate(mixed $value, Constraint $constraint): void {
    if (!preg_match('/^\d{14}$/', $value)) {
      $this->context->addViolation($constraint->message);
    }
  }
}

// Company-Test_b2b.module
function Company-Test_b2b_user_insert(UserInterface $account): void {
  $account->set('field_compte_statut', 'en_attente')->save();
  // Envoi emails...
}
```

```yaml
# config/sync/field.field.user.user.field_siret.yml
field_name: field_siret
entity_type: user
bundle: user
label: 'SIRET'
required: true
settings:
  max_length: 14
```

---

## US-006 — Connexion acheteur B2B (2 SP)

**Branche :** `feature/US-006-connexion-b2b`

### Tâches

| # | Tâche | Composant Drupal | Effort |
|---|-------|-----------------|--------|
| T1 | EventSubscriber sur `UserLoginEvent` → vérifier `field_compte_statut` | EventSubscriber | 0.5j |
| T2 | Bloquer la session si statut ≠ `actif` — afficher message contextuel | Session + messenger | 0.5j |
| T3 | Messages différenciés : "En attente (24h)" / "Refusé — Contactez-nous" | Twig / messenger | 0.25j |
| T4 | Lien "Contacter Company-Test" → page contact ou mailto config | Config | 0.25j |
| T5 | Throttling connexion : configurer Flood Control (5 tentatives / 15 min) | flood_control config YAML | 0.25j |
| T6 | Tests PHPUnit LoginSubscriber | PHPUnit Kernel | 0.25j |

### Points d'implémentation clés

```php
// src/EventSubscriber/B2bLoginSubscriber.php
class B2bLoginSubscriber implements EventSubscriberInterface {
  public function onUserLogin(UserLoginEvent $event): void {
    $account = $event->getAccount();
    $status = $account->get('field_compte_statut')->value;

    if ($status === 'en_attente') {
      user_logout();
      $this->messenger->addWarning(
        'Votre compte est en cours de validation (délai 24h).'
      );
    } elseif ($status === 'refuse') {
      user_logout();
      $this->messenger->addError(
        'Votre demande de compte a été refusée. Contactez-nous pour plus d\'informations.'
      );
    }
  }
}
```

```yaml
# config/sync/flood.settings.yml  (via flood_control)
user_limit: 5
user_window: 900   # 15 minutes en secondes
```

---

## SPIKE — Évaluation PSP Stripe / PayPlug (timebox 1j)

**Résultat :** Stripe retenu ✅ — `drupal/commerce_stripe` compatible Commerce 2.x

### Livrables du SPIKE
- [x] Comparatif Stripe vs PayPlug (frais, 3DS2, API)
- [x] Module `drupal/commerce_stripe` testé en local
- [x] US-016 confirmée en scope V1
- [ ] Clés API Stripe sandbox à récupérer auprès du client

---

## Checklist de fin de Sprint 1

### DoD par US
| US | PHPUnit | Behat | Config YAML | Code Review | Staging |
|----|---------|-------|-------------|-------------|---------|
| US-001 | ✅ | ✅ | ✅ | ✅ | ✅ |
| US-002 | ✅ | ✅ | ✅ | ✅ | ✅ |
| US-005 | ✅ | ✅ | ✅ | ✅ | ✅ |
| US-006 | ✅ | — | ✅ | ✅ | ✅ |
| US-007 | — | — | — | — | ⚠️ Reportée Sprint 2 |

### Commandes de déploiement staging Sprint 1
```bash
git checkout develop
git pull
composer install
drush updatedb -y
drush config:import -y
drush cr
```
