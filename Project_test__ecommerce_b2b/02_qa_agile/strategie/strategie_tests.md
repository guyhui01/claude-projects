# Stratégie de Tests Agile — Company-Test e-Commerce B2B

## Agent QA Agile — ISTQB® CTFL-AT · CTAL-ATT

## Approche : Shift-Left Testing

```
Sprint 1 : Tests unitaires + acceptance catalogue & comptes
Sprint 2 : Tests intégration commande + back-office
Sprint 3 : Tests paiement CB (critique) + facturation
Sprint 4 : Tests livraisons + régression complète
IP Sprint : Tests non-régression · stabilisation · System Demo
```

## Pyramide d'automatisation

```
         /‾‾‾‾‾‾‾‾‾‾‾\
        /  E2E (10%)   \       Cypress — parcours critiques
       /‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\
      /  Intégration(20%)\     PHPUnit + Drupal Test API
     /‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\
    /   Unitaires (70%)    \   PHPUnit — modules Drupal custom
   /‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\
```

**Justification du ratio 70/20/10 :**
- **70% unitaires** : Les modules Drupal Commerce custom (`Company-Test_b2b`) contiennent la logique métier clé (SiretConstraint, AccountValidationService, PriceResolver). Les tests unitaires sont rapides (< 30s), stables, et s'intègrent nativement à PHPUnit + Drupal Test traits.
- **20% intégration** : Les flux critiques (inscription → validation → commande) impliquent plusieurs services et la base de données. Les tests d'intégration Drupal (`KernelTestBase`) testent ces interactions sans navigateur.
- **10% E2E** : Limités aux 3-4 parcours critiques (inscription compte, paiement 3DS, checkout bout en bout) via Cypress. Plus lents et plus fragiles — réservés aux happy paths les plus risqués.

> Pour un e-commerce B2B, les tests d'intégration sont plus importants que pour une app standard en raison des workflows d'état (commande, compte B2B). Si la dette technique augmente, basculer vers 60/30/10.

## Effort tests — Budget par sprint

| Sprint | US testées | SP développement | SP tests (estimé) | Ratio tests/dev |
|--------|-----------|-----------------|------------------|----------------|
| S1 | 5 US | 13 SP | 3 SP | 23% |
| S2 | 7 US | 12 SP | 3 SP | 25% |
| S3 | 5 US | 11 SP | 3 SP | 27% |
| S4 | 6 US | 13 SP | 3 SP | 23% |
| IP | 4 US | 10 SP | 3 SP | 30% |
| **Total PI** | **27 US** | **59 SP** | **15 SP** | **25%** |

> Règle de base : prévoir ~1 SP de tests pour 3-4 SP de développement Drupal. Augmenter à 1/3 pour les US de paiement et sécurité.

## Types de tests par feature

| Feature | Unitaires | Intégration | E2E | Perf | Sécu |
|---------|-----------|-------------|-----|------|------|
| FEAT-001 Catalogue | ✅ | ✅ | ✅ | ✅ k6 (load catalogue 100 VU) | — |
| FEAT-002 Comptes B2B | ✅ | ✅ | ✅ | — | ✅ Brute force login · injection SIRET |
| FEAT-003 Commande | ✅ | ✅ | ✅ | ✅ k6 (checkout 50 VU simultanés) | — |
| FEAT-004 Back-office | ✅ | ✅ | ✅ | — | ✅ RBAC · access control admin |
| FEAT-005 Paiement | ✅ | ✅ | ✅ | ✅ Stripe webhook latence < 2s | ✅ PCI-DSS · 3DS2 · HMAC webhook |
| FEAT-006 Livraisons | ✅ | ✅ | — | ✅ API Chronopost timeout fallback | — |
| FEAT-007 Onboarding | ✅ | — | — | — | — |

**Perf — seuils cibles (k6 IP Sprint) :**
- Page catalogue (100 produits) : < 1,5s (P95)
- Checkout complet (panier → confirmation) : < 3s (P95)
- Webhook Stripe (3DS callback) : < 2s (P99)

**Sécu — périmètre V1 :**
- FEAT-002 : test injection SQL sur champ SIRET, brute force sur `/user/login` (flood_control)
- FEAT-004 : vérification accès back-office sans rôle `Company-Test_admin` (403 attendu)
- FEAT-005 : validation signature HMAC webhook Stripe, test replay d'événement webhook

## Environnements de test

| Environnement | Usage | Stack | URL |
|--------------|-------|-------|-----|
| Local (DDEV) | Développement + tests unitaires | Drupal 10 + MySQL + Redis | `https://company-test-b2b.ddev.site` |
| CI (GitHub Actions) | PHPUnit + Behat automatisés à chaque PR | SQLite (unit) · MySQL (intégration) | Pipeline CI — `feature/*` branches |
| Staging | Recette PO + smoke tests + E2E Cypress | Identique prod — données anonymisées | `https://staging.company-test-b2b.example` |
| Production | Monitoring post-déploiement + smoke test | — | `https://b2b.company-test.example` |

## Outils
- Tests unitaires : **PHPUnit 10** + Drupal Test traits (`UnitTestCase`, `KernelTestBase`, `BrowserTestBase`)
- Tests BDD : **Behat 3.x** + Gherkin (scénarios dans `../bdd_gherkin/`)
- Tests E2E : **Cypress** (parcours critiques — inscription, commande, paiement)
- Tests de charge : **k6** (IP Sprint — plan de charge dans `../../03_dev/sprint_ip/taches_dev_ip_sprint.md`)
- Gestion anomalies : `../anomalies/registre_anomalies.md`
- CI/CD : **GitHub Actions** — pipeline `phpunit → behat → cypress` sur chaque PR

## DoD Qualité
Voir `../dod_qualite/dod_qualite.md`
