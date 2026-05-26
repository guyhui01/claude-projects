# Sprint 1 — Fondations Catalogue & Comptes B2B

## Informations
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 1 |
| Période | Semaines 1-2 du PI-2026-Q3 |
| Vélocité cible | 18 pts |
| Équipe | 4 dev Drupal · 1 PO · 1 SM |

## Sprint Goal
> *"À la fin du sprint, un acheteur B2B peut créer un compte, le faire valider par Company-Test, se connecter et consulter le catalogue avec les fiches produits."*

## User Stories planifiées (18 pts)
| ID | Titre | SP | Statut | Feature BDD |
|----|-------|-----|--------|-------------|
| US-001 | Navigation catalogue par catégorie | 3 | À faire | `bdd_gherkin/US-001.feature` |
| US-002 | Fiche produit complète + tarif B2B | 5 | À faire | `bdd_gherkin/US-002.feature` |
| US-005 | Création compte professionnel B2B | 5 | À faire | `bdd_gherkin/US-005.feature` |
| US-006 | Connexion acheteur B2B | 2 | À faire | `bdd_gherkin/US-006.feature` |
| US-007 | Validation manuelle compte (admin) | 3 | À faire | `bdd_gherkin/US-007.feature` |
| SPIKE | Évaluation PSP Stripe / PayPlug | timebox 1j | À faire | — |

> **Planning Poker (2026-05-20)** : SPIKE requalifié en timebox 1 jour (non comptabilisé en SP). Vélocité Sprint 1 = 18 SP. US-005 : validation SIRET limitée au regex 14 chiffres — API INSEE hors scope V1 (voir `US-005.md`).

## Milestone M1
Compte B2B activé + catalogue navigable — démo interne Direction Commerciale.

## BDD / Scénarios d'acceptation
- **25 scénarios** rédigés (Shift-Left QA — avant démarrage dev)
- Plan de tests détaillé : `02_qa_agile/plans_tests/plan_sprint_01.md`
- Automatisation Behat prévue en Iteration 2 pour les scénarios Manuel + Behat

## Dépendances à lever avant démarrage
- [ ] Arborescence catalogue validée PO
- [ ] Wireframes catalogue + fiche produit disponibles
- [ ] Rôles Drupal (acheteur B2B, admin Company-Test) configurés
- [ ] Template email confirmation disponible (SendGrid)
