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
    /   Unitaires (70%)    \   PHPUnit — modules Drupal
   /‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\
```

## Types de tests par feature

| Feature | Unitaires | Intégration | E2E | Perf | Sécu |
|---------|-----------|-------------|-----|------|------|
| FEAT-001 Catalogue | ✅ | ✅ | ✅ | — | — |
| FEAT-002 Comptes B2B | ✅ | ✅ | ✅ | — | ✅ |
| FEAT-003 Commande | ✅ | ✅ | ✅ | — | — |
| FEAT-004 Back-office | ✅ | ✅ | ✅ | — | ✅ |
| FEAT-005 Paiement | ✅ | ✅ | ✅ | — | ✅ |
| FEAT-006 Livraisons | ✅ | ✅ | — | — | — |
| FEAT-007 Onboarding | ✅ | — | — | — | — |

## Outils
- Tests unitaires : PHPUnit 10 + Drupal Test traits
- Tests BDD : Behat + Gherkin (scénarios dans `../bdd_gherkin/`)
- Tests E2E : Cypress
- Gestion anomalies : `../anomalies/registre_anomalies.md`

## DoD Qualité
Voir `../dod_qualite/dod_qualite.md`
