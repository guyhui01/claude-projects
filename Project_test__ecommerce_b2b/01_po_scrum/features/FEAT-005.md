# FEAT-005 — Paiement & facturation B2B

## Lien Epic
EPIC-001 — `../epics/EPIC-001.md`

## MoSCoW
Should Have

## Description
Permettre aux acheteurs B2B de payer par CB sécurisée (3D Secure) et de recevoir automatiquement leur facture PDF par email.

## User Stories associées
| ID | Titre | MoSCoW | SP | Sprint |
|----|-------|---------|-----|--------|
| [US-016](../user_stories/FEAT-005/US-016.md) | Paiement CB 3D Secure (Stripe) | **Must Have** ⬆️ | 8 | S3 |
| [US-017](../user_stories/FEAT-005/US-017.md) | Paiement différé 30j fin de mois | Could → **Phase 2** | 5 | Phase 2 |
| [US-018](../user_stories/FEAT-005/US-018.md) | Génération facture PDF par email | Should | 3 | S3 |

> **Note décision** : US-016 promue **Must Have** après Spike Sprint 1 (Stripe retenu, 3DS2 obligatoire pour conformité PSD2). Décision actée le 2026-05-20 — voir D6 dans `../../story_mapping/cr_story_mapping.md`.

## Dépendance
✅ Spike PSP réalisé — **Stripe retenu** (2026-05-20). Critères : module Drupal Commerce mature, support 3DS2 natif, frais transaction compétitifs vs PayPlug.

## Statut
- [x] Feature rédigée
- [x] US créées
- [x] Spike PSP réalisé — Stripe SDK PHP 13.x sélectionné
