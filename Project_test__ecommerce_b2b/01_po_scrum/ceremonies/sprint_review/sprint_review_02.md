# Sprint Review — Sprint 2

## Informations
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 2 — Commande B2B Complète |
| Date | 2026-05-26 |
| Durée | 2h |
| Animateur | PO — Guy H. |
| Participants | PO Guy H. · SM · Dev1 · Dev2 · Dev3 · Dev4 · Rémi D. (Direction Commerciale) · Thomas M. (UAT acheteur B2B) |
| Sprint Goal | "Un acheteur B2B validé peut passer une commande complète avec N° BC" |
| Statut Sprint Goal | ✅ ATTEINT |

---

## Sprint Goal

> "Un acheteur B2B validé peut passer une commande complète avec N° BC."

✅ **Sprint Goal atteint** — Le flux de validation de compte admin est en place, l'acheteur peut ajouter des produits au panier, saisir son numéro de bon de commande, passer commande et recevoir une confirmation par email. Le back-office commandes est opérationnel pour les admins.

---

## Démo produit

| US | Titre | Fonctionnalité démontrée | Acceptée PO | Remarques |
|----|-------|--------------------------|-------------|-----------|
| US-007 | Validation manuelle compte B2B | Interface admin : liste comptes en attente, action Valider/Refuser, notification email déclenchée | ✅ Oui | Reportée S1, livrée S2 — délai rattrapé |
| US-009 | Ajout produits au panier B2B | Ajout depuis fiche produit et liste catalogue, gestion des quantités, unités de commande | ✅ Oui | Unités PCE/Km correctement gérées |
| US-010 | Saisie N° bon de commande | Champ obligatoire au checkout, validation côté client + serveur, message d'erreur explicite | ✅ Oui | Thomas M. : friction attendue mais UX à améliorer (voir feedback) |
| US-011 | Email confirmation commande | Email SendGrid déclenché à la validation commande, template B2B avec récap produits + N° BC | ✅ Oui | Délai de réception < 30 sec en recette |
| US-013 | Dashboard back-office commandes | Liste commandes avec filtres statut/date/client, détail commande, lien vers fiche client | ✅ Oui | Direction Commerciale très satisfaite |
| US-014 | MAJ statut commande + notif client | Workflow statut (Reçue → Préparée → Expédiée → Livrée), email client à chaque changement | ✅ Oui | Transitions testées bout-en-bout |
| US-015 | Export commandes CSV | — | 🔴 Non démontrée | Estimée trop large — glisse en Sprint 3 (scope insuffisant pour finir en 2 sprints) |

---

## Résultats du sprint

| Indicateur | Valeur |
|-----------|--------|
| SP planifiés | 16 |
| SP livrés | 15 |
| Taux de complétion | 93,8 % |
| US livrées | US-007 · US-009 · US-010 · US-011 · US-013 · US-014 |
| US non livrées | US-015 (export CSV — glisse Sprint 3) |
| Cause du report | US-015 sous-estimée lors du planning : intégration filtres + format CSV client plus complexe que prévu |

> ⚠️ **US-015 repoussée Sprint 3** : la fonctionnalité d'export CSV des commandes (admin) a été démarrée mais non finalisée. La mise en forme du CSV selon les exigences client (colonnes spécifiques, encoding UTF-8, filtres avancés) s'est révélée plus complexe. Elle est intégrée au backlog Sprint 3 avec US-012.

---

## Feedback parties prenantes

### Rémi D. — Direction Commerciale
> "Le dashboard back-office des commandes est exactement ce qu'on attendait. On peut enfin voir toutes les commandes en temps réel avec le statut. C'est un vrai gain pour notre équipe ADV."

- Satisfaction : 🟢 Très élevée sur US-013 (dashboard) et US-014 (suivi statut)
- Demande : anticiper un export rapide depuis le dashboard (US-015 — prioritaire pour Sprint 3)
- Point positif : le workflow de statut commande couvre bien le process interne ADV

### Thomas M. — Responsable Achats (UAT acheteur B2B)
> "Le champ numéro de bon de commande, on s'y attendait, c'est notre process interne. Mais le message d'erreur quand on oublie de le remplir pourrait être plus visible. En mobile c'est facile de le rater."

- Satisfaction : 🟡 Mitigée sur US-010 (champ N° BC)
- Friction identifiée : champ N° BC peu visible sur mobile — amélioration UX à prévoir (enrichissement US-010 ou nouvelle US)
- Point positif : le flux de commande complet est fluide une fois le compte validé
- Suggestion : pré-remplissage du N° BC depuis le dernier bon de commande (mémorisé) → reportée comme amélioration US-010

### SM
- Gate DoR appliqué strictement : toutes les US du Sprint 2 avaient wireframes validés
- Amélioration notable vs Sprint 1 sur la qualité de la DoR
- Point d'attention : test intégration bout-en-bout du checkout non réalisé à J-2 (dette QA identifiée en rétro)

---

## Décisions prises

| # | Décision | Impact |
|---|----------|--------|
| D1 | **US-015 (Export CSV) embarquée en Sprint 3** | S'ajoute à US-016 + US-018 + US-012 — charge Sprint 3 à surveiller (budget +3 SP) |
| D2 | **Email de suivi expédition prioritaire pour Sprint 3** | US-021 (numéro de suivi transporteur) confirmée prioritaire — valeur forte pour acheteurs B2B |
| D3 | **Enrichissement UX US-010** documenté en backlog | Amélioration visibilité champ N° BC sur mobile — à traiter en IP Sprint ou Phase 2 |
| D4 | **Tests E2E Behat à instaurer dès Sprint 3** | Suite à la dette QA identifiée sur le checkout — action rétro Sprint 2 |

---

## Vélocité & projection PI

| Indicateur | Sprint 1 | Sprint 2 | Projection PI |
|-----------|----------|----------|---------------|
| SP livrés | 16 | 15 | — |
| Cumul SP livrés | 16 | 31 | — |
| Vélocité moyenne | — | 15,5 | — |
| Projection SP restants (S3+S4+IP) | — | — | 39 SP à livrer |
| Cible PI-2026-Q3 | — | — | 70 SP |
| Statut PI | — | 🟡 Légèrement en retard | Rattrapable si S3 = 14 SP + |

> **Note PO** : la projection PI reste atteignable. Le Sprint 3 contient 14 SP planifiés + 3 SP (US-015 glissée) = ajustement nécessaire au planning. US-016 (paiement) est le milestone critique du PI — aucun retard acceptable.

---

## Prochaines étapes

- ✅ Sprint 3 Planning — semaine suivante
- ✅ US-015 intégrée au Sprint 3 (avec US-016, US-018, US-012)
- ✅ Tests E2E Behat à mettre en place dès Sprint 3 (action rétro)
- ✅ Refinement mid-sprint planifié
- ✅ Milestone M3 : paiement CB 3DS (US-016) — livrable critique Sprint 3
