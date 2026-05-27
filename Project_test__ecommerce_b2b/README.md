# Company-Test — e-Commerce B2B Drupal · PI-2026-Q3 ✅ TERMINÉ

> Projet fictif showcase · Généré avec Claude Code · Agents : PO-SCRUM · QA-AGILE · DEV-DRUPAL-PHP · UX-DESIGNER · BUSINESS-ANALYST

## Contexte

| Champ | Valeur |
|-------|--------|
| Client fictif | Company-Test — fabricant câbles FTTH + boîtiers fibres |
| Marché | B2B France — installateurs, opérateurs, distributeurs |
| Périmètre V1 | Catalogue + Comptes B2B + Commandes + Back-office + Paiement + Livraison |
| Hors périmètre V1 | Marketplace · B2C · connecteurs ERP/SAP · Paiement différé 30j (US-017) |

## Stack technique

| Couche | Technologie |
|--------|------------|
| CMS | Drupal 10.3 + Drupal Commerce 2.x |
| Langage | PHP 8.2 |
| Base de données | MySQL 8.0 · Redis 7.x (cache) |
| Paiement | Stripe (3DS2 confirmé Sprint 1) |
| Email transactionnel | SendGrid |
| Transporteurs | API Chronopost / Colissimo |
| Export | CSV manuel (pas d'ERP/SAP en V1) |

## Équipe & cadre agile

- **Cadre** : SAFe · PI-2026-Q3 · 10 semaines · 4 Sprints + IP Sprint
- **Équipe** : 4 dev Drupal · 1 PO (Guy H.) · 1 SM
- **Vélocité finale** : S1=16 · S2=15 · S3=14 · S4=16 · IP=13 → **74 SP livrés / 70 planifiés (106%)**

## Métriques PI finales

| Indicateur | Valeur |
|------------|--------|
| US Must Have livrées | 12/12 — **100%** |
| US Should Have livrées | 5/6 — 83% |
| US Could Have livrées | 3/5 — 60% |
| SP livrés / planifiés | 74 / 70 — **106%** |
| Couverture BDD Gherkin | 22/23 US (US-017 → Phase 2) |
| Cas de test | **84 TC** (FEAT-001 à 007) |
| Scénarios BDD | **~119 scénarios** |
| Wireframes lo-fi | **21 WF** (S1→S4 + IP) |
| Process diagrams | **8 flux** (BP-001 à BP-008) |
| Bugs critiques prod | **0** |
| Bugs majeurs résolus | 2 (incident 3DS Visa · grille tarifaire S4) |

## Structure du repo

```
Project_test__ecommerce_b2b/
├── CLAUDE.md                    ← Contexte projet permanent
├── START.md                     ← Point d'entrée & activation agents
│
├── 01_po_scrum/                 ← Backlog · EPIC · Features · US · Planning · Cérémonies
│   ├── backlog/                 ← product_backlog.md
│   ├── epics/                   ← EPIC-001.md
│   ├── features/                ← FEAT-001 à FEAT-007.md
│   ├── user_stories/            ← 23 US organisées par Feature
│   ├── pi_planning/             ← PI-2026-Q3.md
│   ├── sprint_planning/         ← sprint_01 à sprint_04 + ip_sprint
│   ├── story_mapping/           ← story_map.md · story_map.html · cr_story_mapping.md
│   └── ceremonies/              ← 4 rétrospectives · 4 sprint reviews · IP sprint · rétro PI
│
├── 02_qa_agile/                 ← Stratégie · BDD Gherkin · Cas de test · Plans · Reporting
│   ├── strategie/               ← strategie_tests.md (Shift-Left · ISTQB)
│   ├── dod_qualite/             ← dod_qualite.md
│   ├── bdd_gherkin/             ← 22 fichiers .feature (US-001 à US-023, US-017 hors scope V1)
│   ├── cas_de_test/             ← TC-FEAT001 à TC-FEAT007 (84 TC)
│   ├── plans_tests/             ← plan_sprint_01 à plan_sprint_04 (~119 scénarios)
│   ├── anomalies/               ← registre_anomalies.md
│   └── reporting/               ← reporting_qualite.md
│
├── 03_dev/                      ← Architecture · Conventions · Tâches par sprint
│   ├── architecture_technique.md
│   ├── conventions_dev.md       ← Git flow · PSR-12 · CMI · DoD dev
│   ├── sprint_01/ à sprint_04/  ← taches_dev_sprint_XX.md
│   ├── sprint_ip/               ← Stabilisation · k6 · Lighthouse · deploy_production.sh
│   └── process_diagrams/        ← business_process_diagrams.html (8 flux Mermaid)
│
└── 04_ux_design/                ← Personas · Journey Map · Wireframes · Design Handoff
    ├── personas/                ← persona_acheteur_b2b.md (Thomas Mercier + Isabelle Royer)
    ├── journey_map/             ← journey_map_acheteur_b2b.md (7 phases · courbe émotion)
    ├── wireframes/              ← 21 WF lo-fi ASCII (sprint_01 à sprint_ip)
    └── design_handoff/          ← wireframes_sprint_01/04.html (rendu visuel navigateur)
```

## Features & User Stories

| Feature | Libellé | WSJF | Rang | US | Statut |
|---------|---------|------|------|----|--------|
| FEAT-004 | Back-office gestion commandes | **4,8** | #1 | US-013 à US-015 | ✅ |
| FEAT-002 | Gestion des comptes & accès B2B | **4,3** | #2 | US-005 à US-008 | ✅ |
| FEAT-003 | Panier & processus de commande | **3,3** | #3 | US-009 à US-012 | ✅ |
| FEAT-005 | Paiement & facturation B2B | **2,6** | #4 | US-016, US-017², US-018 | ✅ (US-017 → P2) |
| FEAT-001 | Catalogue produits B2B | **2,4** | #5 | US-001 à US-004 | ✅ |
| FEAT-006 | Gestion des livraisons | **2,2** | #6 | US-019 à US-021 | ✅ |
| FEAT-007 | Onboarding & validation client B2B | **2,0** | #7 | US-022 à US-023 | ✅ |

> ² US-017 — Paiement différé 30j fin de mois : complexité juridique → reporté en Phase 2

## Points de qualité

| # | Constat initial | Correction appliquée | Statut |
|---|----------------|----------------------|--------|
| Q1 | `bdd_gherkin/US-017.feature` absent | Fichier créé — spec Phase 2 taggée `@phase2 @hors-scope-v1` | ✅ Résolu |
| Q2 | Design Handoff S2/S3 HTML statut 🔲 | Statut mis à jour — fichiers HTML avec contenu vérifié | ✅ Résolu |
| Q3 | WF-004, WF-011, WF-017 manquants | 3 wireframes créés : fiche technique PDF · confirmation commande · succès paiement 3DS | ✅ Résolu |

## Activation des agents

```
# Agent PO Scrum
Lis AGENT-PO-SCRUM.md et adopte ce rôle.
Projet actif : Company-Test B2B · Lire START.md + CLAUDE.md

# Agent QA Agile
Lis AGENT-QA-AGILE.md et adopte ce rôle.
Projet actif : Company-Test B2B · BDD Gherkin 22 US couvertes

# Agent Dev Drupal PHP
Lis AGENT-DEV-DRUPAL-PHP.md et adopte ce rôle.
Stack : Drupal 10 + Commerce 2.x · PHP 8.2 · Stripe · SendGrid · Chronopost

# Agent UX Designer
Lis AGENT-UX-DESIGNER.md et adopte ce rôle.
Persona : Thomas Mercier (acheteur B2B) + Isabelle Royer (admin)

# Agent Business Analyst
Lis AGENT-BUSINESS-ANALYST.md et adopte ce rôle.
Projet actif : Company-Test B2B · BPMN/UML · 8 process diagrams
```

## Roadmap Phase 2

| Axe | Description |
|-----|-------------|
| Headless | Migration Twig → Next.js + JSON:API Drupal |
| Marketplace | Multi-vendeurs distributeurs |
| Connecteur ERP | SAP/Sage — intégration commandes |
| Paiement différé | US-017 — 30j fin de mois (complexité juridique) |

---
*Projet showcase fictif · Claude Code · PI-2026-Q3 TERMINÉ · 2026-05-21*
