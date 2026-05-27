# EPIC-001 — Ouverture du canal e-commerce B2B — Drupal Company-Test

## User Story Epic
En tant que **Direction Commerciale Company-Test**,
Je veux **ouvrir un canal de vente en ligne sur notre site Drupal existant**,
Afin de **digitaliser notre activité de vente de câbles FTTH et boîtiers fibres** auprès de nos clients B2B (installateurs, opérateurs, distributeurs).

## Valeur métier
- Nouveau canal de revenus direct
- Réduction des coûts de traitement des commandes (18€ → 4€/commande)
- Disponibilité 24/7

## Périmètre V1
- Câbles FTTH + Boîtiers fibres — marché France B2B

## Hors périmètre V1
- Marketplace · B2C · connecteurs ERP/SAP (phase 2)

## KPIs de succès
| KPI | Cible fin PI |
|-----|-------------|
| Canal e-commerce opérationnel | ✅ Oui |
| Comptes B2B activés (pilote) | ≥ 10 comptes |
| Taux commandes digitalisées | ≥ 15% |
| Coût traitement commande | ≤ 8€ |
| NPS acheteurs B2B pilote | ≥ 7/10 |

## Features associées

> Priorisation WSJF (SAFe) — CoD = BV + TC + RR/OE · WSJF = CoD / Size · cotation relative, plus petit = 1 par colonne · Fibonacci : 1·2·3·5·8·13·20

| ID | Feature | BV | TC | RR/OE | CoD | Size | WSJF | Rang |
|----|---------|----|----|-------|-----|------|------|------|
| FEAT-003 | Panier & processus de commande | 20 | 8 | 3 | 31 | 2 | **15,5** | #1 |
| FEAT-001 | Catalogue produits B2B | 13 | 20 | 8 | 41 | 5 | **8,2** | #2 |
| FEAT-004 | Back-office gestion commandes | 3 | 5 | 5 | 13 | 2 | **6,5** | #3 |
| FEAT-002 | Gestion des comptes & accès B2B | 8 | 13 | 20 | 41 | 8 | **5,1** | #4 |
| FEAT-007 | Onboarding & validation client B2B | 1 | 1 | 1 | 3 | 1 | **3,0** | #5 |
| FEAT-006 | Gestion des livraisons | 2 | 2 | 2 | 6 | 3 | **2,0** | #6 |
| FEAT-005 | Paiement & facturation B2B | 5 | 3 | 13 | 21 | 13 | **1,6** | #7 |

> **FEAT-005 #7** malgré un fort RR/OE (conformité PSD2/3DS) : c'est le plus gros Job Size (13). Réponse SAFe = **splitter** — déjà amorcé (US-017 paiement différé → Phase 2). Le séquencement réel intègre aussi les dépendances (Program Board), distinctes du WSJF.

## PI associé
PI-2026-Q3 — voir `../pi_planning/PI-2026-Q3.md`

## Statut
- [x] Epic rédigée
- [x] Features décomposées
- [x] User Stories créées
- [x] PI Planning réalisé
- [ ] Sprint 1 démarré
