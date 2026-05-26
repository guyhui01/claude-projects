# START — Projet Company-Test e-Commerce B2B
> Lire `CLAUDE.md` avant toute action sur ce projet.
> Dernière mise à jour : 2026-05-21 · PI-2026-Q3 **TERMINÉ** · 74/70 SP livrés

---

## Contexte projet

| Champ | Valeur |
|-------|--------|
| Client | Company-Test — fabricant câbles FTTH + boîtiers fibres |
| Périmètre V1 | e-Commerce B2B France — installateurs, opérateurs, distributeurs |
| Stack | Drupal 10.3 + Commerce 2.x · PHP 8.2 · MySQL 8.0 · Redis 7.x · Stripe · SendGrid · Chronopost |
| PI | PI-2026-Q3 — 10 semaines — 4 Sprints + IP Sprint |
| Équipe | 4 dev Drupal · 1 PO (Guy H.) · 1 SM |
| Vélocité finale | S1=16 · S2=15 · S3=14 · S4=16 · IP=13 → **74 SP** |
| Must Have | 100% livrés ✅ |

---

## Activation agents — commandes d'amorçage

### Agent PO Scrum
```
Lis C:\Users\Guy HUIBONHOA\ClaudeCode\AGENT-PO-SCRUM.md et adopte ce rôle.
Projet actif : Company-Test B2B · Lire START.md + CLAUDE.md
```

### Agent QA Agile
```
Lis C:\Users\Guy HUIBONHOA\ClaudeCode\AGENT-QA-AGILE.md et adopte ce rôle.
Projet actif : Company-Test B2B · BDD Gherkin 23 US couvertes · Lire START.md
```

### Agent Dev Drupal PHP
```
Lis C:\Users\Guy HUIBONHOA\ClaudeCode\AGENT-DEV-DRUPAL-PHP.md et adopte ce rôle.
Stack : Drupal 10 + Commerce 2.x · PHP 8.2 · Stripe · SendGrid · Chronopost
Code Level 2 — illustrative snippets · Lire START.md + architecture_technique.md
```

### Agent UX/UI Designer
```
Lis C:\Users\Guy HUIBONHOA\ClaudeCode\AGENT-UX-DESIGNER.md et adopte ce rôle.
Persona : Thomas Mercier (acheteur B2B) + Isabelle Royer (admin)
Fidélité : Lo-fi ASCII · Breakpoints : 1280px + 375px · Lire START.md
```

### Agent Business Analyst
```
Lis C:\Users\Guy HUIBONHOA\ClaudeCode\AGENT-BUSINESS-ANALYST.md et adopte ce rôle.
Projet actif : Company-Test B2B · BPMN/UML · Process diagrams · Lire START.md
```

### Agent DevOps Cloud
```
Lis C:\Users\Guy HUIBONHOA\ClaudeCode\AGENT-DEVOPS-CLOUD.md et adopte ce rôle.
Projet actif : Company-Test B2B · CI/CD · Infra Drupal · Lire START.md
```

---

## Structure du projet

```
Project_test__ecommerce_b2b/
├── CLAUDE.md                          ← Contexte projet permanent
├── START.md                           ← Ce fichier — point d'entrée
│
├── 01_po_scrum/
│   ├── backlog/
│   │   └── product_backlog.md         ← 23 US · MoSCoW · vélocité PI
│   ├── epics/
│   │   └── EPIC-001.md
│   ├── features/
│   │   └── FEAT-001 à FEAT-007.md
│   ├── user_stories/
│   │   └── FEAT-xxx/ US-001 à US-023.md
│   ├── pi_planning/
│   │   └── PI-2026-Q3.md
│   ├── sprint_planning/
│   │   ├── sprint_01.md  sprint_02.md  sprint_03.md  sprint_04.md  ip_sprint.md
│   ├── story_mapping/
│   │   ├── cr_story_mapping.md        ← CR réunion PO/BA/UX/DEV
│   │   ├── story_map.md               ← ASCII swimlanes
│   │   ├── story_map.html             ← Rendu visuel navigateur
│   │   └── story_map_Company-Test_b2b.pptx ← Export PowerPoint A3
│   └── ceremonies/
│       ├── retrospective/
│       │   ├── retro_sprint_01.md  …02  …03  …04  retro_pi.md
│       ├── sprint_review/
│       │   ├── sprint_review_01.md  …02  …03  …04
│       └── ip_sprint/
│           └── plan_ip_sprint.md
│
├── 02_qa_agile/
│   ├── strategie/
│   │   └── strategie_tests.md
│   ├── dod_qualite/
│   │   └── dod_qualite.md
│   ├── bdd_gherkin/
│   │   └── US-001 à US-023.feature    ← 23 fichiers · 100% US couvertes
│   ├── cas_de_test/
│   │   ├── FEAT-001/TC-FEAT001.md     ← 8 TC  (US-001, US-002)
│   │   ├── FEAT-002/TC-FEAT002.md     ← 17 TC (US-005, US-006, US-007)
│   │   ├── FEAT-003/TC-FEAT003.md     ← 13 TC (US-009, US-010, US-011)
│   │   ├── FEAT-004/TC-FEAT004.md     ← 12 TC (US-013, US-014, US-015)
│   │   ├── FEAT-005/TC-FEAT005.md     ← 14 TC (US-016, US-018, US-012)
│   │   ├── FEAT-006/TC-FEAT006.md     ← 10 TC (US-019, US-021)
│   │   └── FEAT-007/TC-FEAT007.md     ← 10 TC (US-003, US-008, US-020)
│   ├── plans_tests/
│   │   ├── plan_sprint_01.md  …02  …03  …04
│   ├── anomalies/
│   │   └── registre_anomalies.md
│   └── reporting/
│       └── reporting_qualite.md
│
├── 03_dev/
│   ├── architecture_technique.md      ← Stack · modules · entités · Phase 2 headless
│   ├── conventions_dev.md             ← Git flow · PSR-12 · CMI · DoD dev
│   ├── sprint_01/taches_dev_sprint_01.md  ← US-001/002/005/006 + SPIKE Stripe
│   ├── sprint_02/taches_dev_sprint_02.md  ← US-007/009/010/011/013/014
│   ├── sprint_03/taches_dev_sprint_03.md  ← US-016 Stripe 3DS · US-018 PDF · US-012
│   ├── sprint_04/taches_dev_sprint_04.md  ← US-019/021/003/008 · checklist Go-Live
│   ├── sprint_ip/taches_dev_ip_sprint.md  ← Stabilisation · k6 · script deploy_production.sh
│   └── process_diagrams/
│       └── business_process_diagrams.html ← 8 flux Mermaid rendus (BP-001 à BP-008)
│
└── 04_ux_design/
    ├── personas/
    │   └── persona_acheteur_b2b.md    ← Thomas Mercier + JTBD + Isabelle Royer
    ├── journey_map/
    │   └── journey_map_acheteur_b2b.md ← 7 phases · courbe émotion · MoT
    ├── wireframes/
    │   ├── sprint_01/
    │   │   ├── WF-001_catalogue_categories.md
    │   │   ├── WF-002_fiche_produit_b2b.md
    │   │   ├── WF-005_inscription_b2b.md
    │   │   └── WF-006_connexion_b2b.md
    │   ├── sprint_02/
    │   │   ├── WF-007_validation_compte_admin.md
    │   │   ├── WF-009_panier_b2b.md
    │   │   ├── WF-010_checkout_commande.md
    │   │   ├── WF-011_confirmation_commande.md
    │   │   ├── WF-013_dashboard_backoffice.md
    │   │   └── WF-014_suivi_commande.md
    │   └── sprint_03/
    │       ├── WF-012_historique_commandes.md
    │       ├── WF-015_export_csv_backoffice.md
    │       ├── WF-016_paiement_stripe_3ds.md
    │       ├── WF-017_succes_paiement.md
    │       └── WF-018_facture_pdf.md
    ├── wireframes/
    │   └── sprint_04/
    │       ├── WF-003_filtres_catalogue.md
    │       ├── WF-008_tarifs_negocies.md
    │       ├── WF-019_frais_livraison.md
    │       └── WF-021_suivi_transporteur.md
    │   └── sprint_ip/
    │       ├── WF-004_fiche_technique_pdf.md
    │       └── WF-020_adresses_multiples.md
    └── design_handoff/
        ├── wireframes_sprint_01.html  ← Rendu visuel interactif navigateur
        ├── wireframes_sprint_02.html  ← Design Handoff S2 (WF-007/009/010/013/014)
        ├── wireframes_sprint_03.html  ← Design Handoff S3 (WF-012/015/016/018)
        └── wireframes_sprint_04.html  ← Design Handoff S4 (WF-003/008/019/021)
```

---

## Tableau des livrables PI — Vue complète

### 01 — PO Scrum

| Livrable | Fichier | Sprint | Statut |
|----------|---------|--------|--------|
| Product Backlog | `backlog/product_backlog.md` | PI | ✅ |
| EPIC-001 | `epics/EPIC-001.md` | PI | ✅ |
| FEAT-001 à 007 | `features/FEAT-xxx.md` | PI | ✅ |
| US-001 à US-023 | `user_stories/FEAT-xxx/US-xxx.md` | PI | ✅ |
| PI Planning | `pi_planning/PI-2026-Q3.md` | PI | ✅ |
| Story Map (MD) | `story_mapping/story_map.md` | Upstream | ✅ |
| Story Map (HTML) | `story_mapping/story_map.html` | Upstream | ✅ |
| Story Map (PPTX) | `story_mapping/story_map_Company-Test_b2b.pptx` | Upstream | ✅ |
| CR Story Mapping | `story_mapping/cr_story_mapping.md` | Upstream | ✅ |
| Sprint Planning S1 | `sprint_planning/sprint_01.md` | S1 | ✅ |
| Sprint Planning S2 | `sprint_planning/sprint_02.md` | S2 | ✅ |
| Sprint Planning S3 | `sprint_planning/sprint_03.md` | S3 | ✅ |
| Sprint Planning S4 | `sprint_planning/sprint_04.md` | S4 | ✅ |
| Sprint Planning IP | `sprint_planning/ip_sprint.md` | IP | ✅ |
| Sprint Review S1 | `ceremonies/sprint_review/sprint_review_01.md` | S1 | ✅ |
| Sprint Review S2 | `ceremonies/sprint_review/sprint_review_02.md` | S2 | ✅ |
| Sprint Review S3 | `ceremonies/sprint_review/sprint_review_03.md` | S3 | ✅ |
| Sprint Review S4 | `ceremonies/sprint_review/sprint_review_04.md` | S4 | ✅ |
| Rétro Sprint 1 | `ceremonies/retrospective/retro_sprint_01.md` | S1 | ✅ |
| Rétro Sprint 2 | `ceremonies/retrospective/retro_sprint_02.md` | S2 | ✅ |
| Rétro Sprint 3 | `ceremonies/retrospective/retro_sprint_03.md` | S3 | ✅ |
| Rétro Sprint 4 | `ceremonies/retrospective/retro_sprint_04.md` | S4 | ✅ |
| Rétro PI | `ceremonies/retrospective/retro_pi.md` | IP | ✅ |
| Plan IP Sprint | `ceremonies/ip_sprint/plan_ip_sprint.md` | IP | ✅ |

### 02 — QA Agile

| Livrable | Fichier | US couvertes | Scénarios | Statut |
|----------|---------|-------------|-----------|--------|
| Stratégie tests | `strategie/strategie_tests.md` | PI | — | ✅ |
| DoD Qualité | `dod_qualite/dod_qualite.md` | PI | — | ✅ |
| BDD US-001 | `bdd_gherkin/US-001.feature` | Catalogue | 5 | ✅ |
| BDD US-002 | `bdd_gherkin/US-002.feature` | Fiche produit | 5 | ✅ |
| BDD US-003 | `bdd_gherkin/US-003.feature` | Filtres catalogue | 7 | ✅ |
| BDD US-004 | `bdd_gherkin/US-004.feature` | PDF fiche technique | 5 | ✅ |
| BDD US-005 | `bdd_gherkin/US-005.feature` | Inscription B2B | 6 | ✅ |
| BDD US-006 | `bdd_gherkin/US-006.feature` | Connexion B2B | 5 | ✅ |
| BDD US-007 | `bdd_gherkin/US-007.feature` | Validation compte | 5 | ✅ |
| BDD US-008 | `bdd_gherkin/US-008.feature` | Tarifs négociés | 6 | ✅ |
| BDD US-009 | `bdd_gherkin/US-009.feature` | Panier B2B | 6 | ✅ |
| BDD US-010 | `bdd_gherkin/US-010.feature` | Bon de commande | 5 | ✅ |
| BDD US-011 | `bdd_gherkin/US-011.feature` | Email confirmation | 5 | ✅ |
| BDD US-012 | `bdd_gherkin/US-012.feature` | Historique commandes | 6 | ✅ |
| BDD US-013 | `bdd_gherkin/US-013.feature` | Dashboard back-office | 6 | ✅ |
| BDD US-014 | `bdd_gherkin/US-014.feature` | Statut + notif | 6 | ✅ |
| BDD US-015 | `bdd_gherkin/US-015.feature` | Export CSV | 6 | ✅ |
| BDD US-016 | `bdd_gherkin/US-016.feature` | Paiement 3DS Stripe | 6 | ✅ |
| BDD US-017 | `bdd_gherkin/US-017.feature` | Paiement différé 30j | 5 | 📋 Phase 2 spec |
| BDD US-018 | `bdd_gherkin/US-018.feature` | Facture PDF | 5 | ✅ |
| BDD US-019 | `bdd_gherkin/US-019.feature` | Frais livraison | 5 | ✅ |
| BDD US-020 | `bdd_gherkin/US-020.feature` | Adresses multiples | 6 | ✅ |
| BDD US-021 | `bdd_gherkin/US-021.feature` | Suivi transporteur | 5 | ✅ |
| BDD US-022 | `bdd_gherkin/US-022.feature` | Email accusé réception | 5 | ✅ |
| BDD US-023 | `bdd_gherkin/US-023.feature` | Email bienvenue | 5 | ✅ |
| TC FEAT-001 | `cas_de_test/FEAT-001/TC-FEAT001.md` | US-001/002 | 8 TC | ✅ |
| TC FEAT-002 | `cas_de_test/FEAT-002/TC-FEAT002.md` | US-005/006/007 | 17 TC | ✅ |
| TC FEAT-003 | `cas_de_test/FEAT-003/TC-FEAT003.md` | US-009/010/011 | 13 TC | ✅ |
| TC FEAT-004 | `cas_de_test/FEAT-004/TC-FEAT004.md` | US-013/014/015 | 12 TC | ✅ |
| TC FEAT-005 | `cas_de_test/FEAT-005/TC-FEAT005.md` | US-016/018/012 | 14 TC | ✅ |
| TC FEAT-006 | `cas_de_test/FEAT-006/TC-FEAT006.md` | US-019/021 | 10 TC | ✅ |
| TC FEAT-007 | `cas_de_test/FEAT-007/TC-FEAT007.md` | US-003/008/020 | 10 TC | ✅ |
| Plan tests S1 | `plans_tests/plan_sprint_01.md` | S1 | 25 scénarios | ✅ |
| Plan tests S2 | `plans_tests/plan_sprint_02.md` | S2 | 27 scénarios | ✅ |
| Plan tests S3 | `plans_tests/plan_sprint_03.md` | S3 | 23 scénarios | ✅ |
| Plan tests S4+IP | `plans_tests/plan_sprint_04.md` | S4+IP | 44 scénarios | ✅ |
| Registre anomalies | `anomalies/registre_anomalies.md` | PI | — | ✅ |
| Reporting qualité | `reporting/reporting_qualite.md` | PI | — | ✅ |

### 03 — Développement Drupal

| Livrable | Fichier | Contenu clé | Statut |
|----------|---------|-------------|--------|
| Architecture technique | `architecture_technique.md` | Stack · modules · entités · Phase 2 headless | ✅ |
| Conventions dev | `conventions_dev.md` | Git flow · PSR-12 · CMI · DoD | ✅ |
| Tâches dev S1 | `sprint_01/taches_dev_sprint_01.md` | US-001/002/005/006 · SPIKE Stripe | ✅ |
| Tâches dev S2 | `sprint_02/taches_dev_sprint_02.md` | US-007/009/010/011/013/014 | ✅ |
| Tâches dev S3 | `sprint_03/taches_dev_sprint_03.md` | Stripe 3DS · webhook HMAC · PDF mPDF · historique Views | ✅ |
| Tâches dev S4 | `sprint_04/taches_dev_sprint_04.md` | Livraison · tracking · filtres AJAX · tarifs négociés · Go-Live 20pts | ✅ |
| Tâches dev IP | `sprint_ip/taches_dev_ip_sprint.md` | Stabilisation · k6 · Lighthouse · deploy_production.sh | ✅ |
| Process Diagrams | `process_diagrams/business_process_diagrams.html` | 8 flux Mermaid — BP-001 à BP-008 | ✅ |

### 04 — UX Design

| Livrable | Fichier | Sprint | Statut |
|----------|---------|--------|--------|
| Persona acheteur B2B | `personas/persona_acheteur_b2b.md` | Upstream | ✅ |
| Journey Map | `journey_map/journey_map_acheteur_b2b.md` | Upstream | ✅ |
| WF-001 Catalogue catégories | `wireframes/sprint_01/WF-001_catalogue_categories.md` | S1 | ✅ |
| WF-002 Fiche produit B2B | `wireframes/sprint_01/WF-002_fiche_produit_b2b.md` | S1 | ✅ |
| WF-005 Inscription B2B | `wireframes/sprint_01/WF-005_inscription_b2b.md` | S1 | ✅ |
| WF-006 Connexion B2B | `wireframes/sprint_01/WF-006_connexion_b2b.md` | S1 | ✅ |
| WF-007 Validation compte admin | `wireframes/sprint_02/WF-007_validation_compte_admin.md` | S2 | ✅ |
| WF-009 Panier B2B | `wireframes/sprint_02/WF-009_panier_b2b.md` | S2 | ✅ |
| WF-010 Checkout 3 étapes | `wireframes/sprint_02/WF-010_checkout_commande.md` | S2 | ✅ |
| WF-011 Confirmation commande | `wireframes/sprint_02/WF-011_confirmation_commande.md` | S2 | ✅ |
| WF-013 Dashboard back-office | `wireframes/sprint_02/WF-013_dashboard_backoffice.md` | S2 | ✅ |
| WF-014 Suivi commande | `wireframes/sprint_02/WF-014_suivi_commande.md` | S2 | ✅ |
| WF-012 Historique commandes | `wireframes/sprint_03/WF-012_historique_commandes.md` | S3 | ✅ |
| WF-015 Export CSV back-office | `wireframes/sprint_03/WF-015_export_csv_backoffice.md` | S3 | ✅ |
| WF-016 Paiement Stripe 3DS | `wireframes/sprint_03/WF-016_paiement_stripe_3ds.md` | S3 | ✅ |
| WF-017 Succès paiement 3DS | `wireframes/sprint_03/WF-017_succes_paiement.md` | S3 | ✅ |
| WF-018 Facture PDF | `wireframes/sprint_03/WF-018_facture_pdf.md` | S3 | ✅ |
| WF-003 Filtres catalogue AJAX | `wireframes/sprint_04/WF-003_filtres_catalogue.md` | S4 | ✅ |
| WF-008 Tarifs négociés | `wireframes/sprint_04/WF-008_tarifs_negocies.md` | S4 | ✅ |
| WF-019 Frais livraison | `wireframes/sprint_04/WF-019_frais_livraison.md` | S4 | ✅ |
| WF-021 Suivi transporteur | `wireframes/sprint_04/WF-021_suivi_transporteur.md` | S4 | ✅ |
| WF-004 Fiche technique PDF | `wireframes/sprint_ip/WF-004_fiche_technique_pdf.md` | IP | ✅ |
| WF-020 Adresses multiples | `wireframes/sprint_ip/WF-020_adresses_multiples.md` | IP | ✅ |
| Design Handoff S1 (HTML) | `design_handoff/wireframes_sprint_01.html` | S1 | ✅ |
| Design Handoff S2 (HTML) | `design_handoff/wireframes_sprint_02.html` | S2 | ✅ |
| Design Handoff S3 (HTML) | `design_handoff/wireframes_sprint_03.html` | S3 | ✅ |
| Design Handoff S4 (HTML) | `design_handoff/wireframes_sprint_04.html` | S4 | ✅ |

---

## Métriques PI finales

| Indicateur | Valeur |
|------------|--------|
| US Must Have livrées | 12/12 — **100%** |
| US Should Have livrées | 5/6 — 83% |
| US Could Have livrées | 3/5 — 60% |
| SP livrés / planifiés | 74 / 70 — **106%** |
| Couverture BDD | 22/23 US — US-017 → Phase 2 |
| Cas de test produits | **84 TC** (FEAT-001 à 007) |
| Scénarios BDD | **~119 scénarios** |
| Wireframes lo-fi | **21 WF** (S1→S4 + IP) |
| Process diagrams | **8 BP** (architecture globale + 7 flux) |
| Bugs critiques prod | **0** |
| Bugs majeurs résolus | 2 (incident 3DS Visa + Sprint 4 grille tarifaire) |

---

## Roadmap Phase 2 (rappel)

| Axe | Description | Décision |
|-----|-------------|---------|
| Headless | Migration Twig → Next.js + JSON:API Drupal | Décision triggers dans architecture_technique.md |
| Marketplace | Multi-vendeurs distributeurs | Hors V1 |
| Connecteur ERP | SAP/Sage intégration commandes | Hors V1 |
| Paiement différé | 30j fin de mois (US-017) | Complexité juridique — Phase 2 |

---

*Projet généré avec Claude Code · Agents activés : AGENT-PO-SCRUM · AGENT-QA-AGILE · AGENT-DEV-DRUPAL-PHP · AGENT-UX-DESIGNER · AGENT-BUSINESS-ANALYST*
