# Sprint Review — Sprint 3

## Informations
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 3 — Canal Autonome Financièrement |
| Date | 2026-06-09 |
| Durée | 2h |
| Animateur | PO — Guy H. |
| Participants | PO Guy H. · SM · Dev1 · Dev2 · Dev3 · Dev4 · Rémi D. (Direction Commerciale) · Marc T. (DSI) · Sophie L. (Direction Financière) |
| Sprint Goal | "Le canal e-commerce est autonome financièrement : paiement CB 3DS opérationnel, facture générée" |
| Statut Sprint Goal | ✅ ATTEINT |

---

## Sprint Goal

> "Le canal e-commerce est autonome financièrement : paiement CB 3DS opérationnel, facture générée."

✅ **Sprint Goal atteint** — Le paiement par carte bancaire avec authentification 3D Secure est opérationnel via Stripe PaymentIntent. La facture PDF est générée et envoyée automatiquement par email post-commande. L'historique des commandes est accessible à l'acheteur B2B.

---

## Démo produit

| US | Titre | Fonctionnalité démontrée | Acceptée PO | Remarques |
|----|-------|--------------------------|-------------|-----------|
| US-016 | Paiement CB 3D Secure via Stripe | Flux complet : saisie carte → redirection 3DS → confirmation → mise à jour statut commande | ✅ Oui | Validé en recette — incident Visa résolu en hotfix (voir notes) |
| US-018 | Génération facture PDF par email | Facture PDF générée à la validation paiement, envoi via SendGrid, template conforme CGV | ✅ Oui | Direction Financière : bien accueillie pour conformité comptable |
| US-012 | Historique commandes acheteur B2B | Interface "Mes commandes" : liste, statut, accès détail, téléchargement facture PDF | ✅ Oui | Testé avec 3 commandes en jeu de données |
| US-015 | Export commandes CSV (admin) | Export CSV depuis dashboard admin avec filtres date/statut/client, encoding UTF-8 | ✅ Oui | Glissée du Sprint 2 — livrée Sprint 3 |

---

## Résultats du sprint

| Indicateur | Valeur |
|-----------|--------|
| SP planifiés | 14 (+3 SP US-015 glissée) |
| SP livrés | 14 |
| Taux de complétion | 100 % |
| US livrées | US-016 · US-018 · US-012 · US-015 |
| US non livrées | Aucune ✅ |
| Incidents en recette | 1 incident majeur : 3DS Visa non testé (résolu en hotfix — voir notes) |

> ✅ **Sprint 100 % livré** — premier sprint à 100 % de complétion du PI. La stabilité de la DoR et les tests E2E Behat instaurés au Sprint 3 ont contribué à cette performance.

---

## Incident recette — US-016 3DS Visa

> ⚠️ **Incident identifié en recette** : le flux 3D Secure n'avait été testé qu'avec des cartes Mastercard. Lors de la recette fonctionnelle avec une carte Visa Crédit Agricole, la redirection 3DS retournait une erreur 403. Cause : configuration Stripe Radar spécifique Visa non gérée.

| Élément | Détail |
|---------|--------|
| Sévérité | 🔴 Critique (bloquant la mise en production) |
| Détecté | Recette — J-3 avant fin de sprint |
| Résolution | Hotfix livré en 1j — Dev1 + Dev2 |
| Statut | ✅ Résolu avant Sprint Review |
| Action corrective | Matrice de test carte × banque instaurée (voir rétro Sprint 3) |

---

## Milestone M3 — Validation DSI & Direction Financière

✅ **Milestone M3 validé** lors de cette Sprint Review.

| Critère de validation | Statut |
|----------------------|--------|
| Paiement CB 3DS opérationnel (Stripe PaymentIntent) | ✅ Validé |
| Gestion échec paiement + relance | ✅ Validé |
| Facture PDF conforme mentions légales | ✅ Validé |
| Envoi email facture via SendGrid | ✅ Validé |
| Historique commandes acheteur | ✅ Validé |
| Sécurité PCI-DSS : aucune donnée carte stockée | ✅ Confirmé par DSI |

---

## Feedback parties prenantes

### Marc T. — DSI
> "Le 3DS ajoute une friction acceptable. Ce qui compte, c'est que les données de carte ne transitent pas par nos serveurs. La conformité PCI-DSS est assurée par le widget Stripe. C'est ce qu'on voulait."

- Satisfaction : 🟢 Validé sur architecture sécurité
- Point d'attention : l'incident Visa en recette a mis en évidence un manque de couverture de test — action corrective bienvenue
- Milestone M3 : ✅ Validé par DSI

### Sophie L. — Direction Financière
> "La facture PDF est bien accueillie. Nos acheteurs B2B ont besoin d'une facture conforme pour leur comptabilité. Le fait qu'elle parte automatiquement après paiement, c'est exactement le process qu'on voulait automatiser."

- Satisfaction : 🟢 Très positive sur US-018
- Demande : vérifier que le format PDF respecte les mentions légales françaises (TVA, SIRET Company-Test, CGV) — ✅ confirmé par Dev3
- Milestone M3 : ✅ Validé par Direction Financière

### Rémi D. — Direction Commerciale
- Satisfait du flux commande complet désormais opérationnel de bout en bout
- Impatient de voir les tarifs négociés (US-008, Sprint 4) — valeur business majeure

---

## Décisions prises

| # | Décision | Impact |
|---|----------|--------|
| D1 | **Matrice de test carte × banque instaurée** pour toutes les US paiement | Couvre Visa, Mastercard, CB, cartes 3DS v1 et v2 — intégrée aux critères d'acceptation US-016 |
| D2 | **Checklist Go-Live DSI ajoutée au DoD Sprint 4** | Sécurité, RGPD, monitoring, backup — validation DSI obligatoire avant Sprint Review 4 |
| D3 | **Hotfix 3DS Visa documenté** dans le log technique | Capitalisation pour les prochains projets Stripe — ajouté à la base de connaissance projet |
| D4 | **Sprint 4 confirmé à 16 SP** avec US-019, US-021, US-003, US-008 | Canal e-commerce complet attendu en fin Sprint 4 — Milestone M4 System Demo ART |

---

## Vélocité & projection PI

| Indicateur | Sprint 1 | Sprint 2 | Sprint 3 | Projection PI |
|-----------|----------|----------|----------|---------------|
| SP livrés | 16 | 15 | 14 | — |
| Cumul SP livrés | 16 | 31 | 45 | — |
| Cible PI-2026-Q3 | — | — | — | 70 SP |
| SP restants à livrer | — | — | — | 25 SP (S4 + IP) |
| Statut PI | — | — | — | 🟢 Sur trajectoire |

> **Note PO** : avec 45 SP livrés sur 3 sprints, la trajectoire PI est bonne. Sprint 4 (16 SP) + IP Sprint (13 SP planifiés) = 29 SP. La cible de 70 SP est atteignable. Surveillance du risque transporteur (US-019) identifiée.

---

## Prochaines étapes

- ✅ Sprint 4 Planning — semaine suivante
- ✅ Checklist Go-Live DSI intégrée au DoD Sprint 4
- ✅ Matrice de test carte × banque disponible pour les équipes QA
- ✅ US-008 (tarifs négociés) — livrée Sprint 4 — valeur business majeure attendue
- ✅ Milestone M4 : System Demo ART en fin Sprint 4
