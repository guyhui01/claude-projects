# Sprint 2 — Validation compte, Commande & Back-office

## Informations
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 2 |
| Période | Semaines 3-4 du PI-2026-Q3 |
| Vélocité cible | 16 pts (mesurée Sprint 1) |
| Prérequis | Sprint 1 terminé ✅ — Rétrospective Sprint 1 tenue |

## Décisions issues de la Rétrospective Sprint 1
> - **US-007 reportée** depuis Sprint 1 (back-office non configuré) → embarquée en priorité 1
> - **Vélocité réelle = 16 SP** (remplace l'estimation initiale de 18)
> - **Stripe confirmé** comme PSP (spike terminé) — US-016 en scope V1
> - **Gate DoR obligatoire** : toute US sans wireframe validé est bloquée au Sprint Planning
> - Voir détail : `ceremonies/retrospective/retro_sprint_01.md`

## Sprint Goal
> *"À la fin du sprint, la validation des comptes B2B est opérationnelle et le canal commande fonctionne de bout en bout : panier → commande → confirmation → traitement back-office."*

## User Stories planifiées (16 pts)
| ID | Titre | SP | Statut | Origine |
|----|-------|-----|--------|---------|
| US-007 | Validation manuelle compte (admin) | 3 | À faire | ⚠️ Reporté Sprint 1 |
| US-009 | Ajout produits au panier | 3 | À faire | Sprint 2 |
| US-010 | Saisie N° bon de commande | 2 | À faire | Sprint 2 |
| US-011 | Email confirmation commande | 2 | À faire | Sprint 2 |
| US-013 | Dashboard back-office commandes | 3 | À faire | Sprint 2 — réduit (était 5) |
| US-014 | Mise à jour statut + notif client | 3 | À faire | Sprint 2 |

> **Note Planning** : US-013 réévaluée à 3 SP (back-office Drupal mieux connu après Sprint 1). US-015 (Export CSV — 2 SP) décalée en Sprint 3 pour tenir la vélocité.

## Milestone M2
Validation compte B2B + première commande de bout en bout — démo Direction Commerciale.

## Gate DoR Sprint 2 (obligatoire — retro A1)
- [ ] Wireframes back-office validation compte validés PO
- [ ] Wireframes panier + checkout validés PO
- [ ] Rôle "admin Company-Test" configuré en Drupal (Dev4 — action retro A3)
- [ ] Jeux de données test préparés par QA (comptes, produits, commandes — action retro A4)
- [ ] Staging Sprint 2 opérationnel veille J1 (Dev4 — action retro A3)
- [ ] Template email expédition disponible (SendGrid)
