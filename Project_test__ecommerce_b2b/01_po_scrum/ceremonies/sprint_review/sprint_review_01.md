# Sprint Review — Sprint 1

## Informations
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 1 — Fondations Catalogue & Comptes B2B |
| Date | 2026-05-12 |
| Durée | 2h |
| Animateur | PO — Guy H. |
| Participants | PO Guy H. · SM · Dev1 · Dev2 · Dev3 · Dev4 · Rémi D. (Direction Commerciale) |
| Sprint Goal | "À la fin du sprint, un acheteur B2B peut découvrir le catalogue, s'inscrire et se connecter" |
| Statut Sprint Goal | ✅ ATTEINT |

---

## Sprint Goal

> "À la fin du sprint, un acheteur B2B peut découvrir le catalogue, s'inscrire et se connecter."

✅ **Sprint Goal atteint** — Le catalogue est navigable par catégorie, la fiche produit affiche les tarifs B2B, la création de compte avec SIRET est fonctionnelle et la connexion acheteur avec flood control est opérationnelle.

---

## Démo produit

| US | Titre | Fonctionnalité démontrée | Acceptée PO | Remarques |
|----|-------|--------------------------|-------------|-----------|
| US-001 | Navigation catalogue par catégorie | Parcours catalogue > catégorie Câbles FTTH > sous-catégorie > liste produits avec filtres de base | ✅ Oui | Navigation fluide, arborescence 3 niveaux validée |
| US-002 | Fiche produit B2B + tarif B2B | Fiche produit avec prix HT B2B, unité de commande (PCE/Km), référence technique | ✅ Oui | Rémi D. : "Les tarifs B2B en liste catalogue = différenciateur fort" |
| US-005 | Création compte professionnel B2B | Formulaire SIRET, raison sociale, nom acheteur, validation format SIRET | ✅ Oui | Appel API INSEE descoped — validation format local en place |
| US-006 | Connexion acheteur B2B | Login email/mot de passe, flood control 5 tentatives, états compte (actif/en attente/bloqué) | ✅ Oui | SM : "Flood control bien reçu par la Sécurité" |
| SPIKE Stripe | Choix PSP | Comparatif Stripe vs Adyen — démonstration sandbox Stripe PaymentIntent 3DS | ✅ Oui | Décision : Stripe retenu — US-016 confirmée en scope |
| US-007 | Validation manuelle compte B2B | — | 🔴 Non démontrée | Reportée Sprint 2 — DoR incomplète à J-3 (maquettes back-office manquantes) |

---

## Résultats du sprint

| Indicateur | Valeur |
|-----------|--------|
| SP planifiés | 18 |
| SP livrés | 16 |
| Taux de complétion | 88,9 % |
| US livrées | US-001 · US-002 · US-005 · US-006 · SPIKE |
| US non livrées | US-007 (reportée Sprint 2) |
| Cause du report | DoR incomplète à J-3 : maquettes back-office non validées par le PO |

> ⚠️ **US-007 reportée** : la fonctionnalité de validation manuelle du compte B2B par l'admin n'a pas pu démarrer. Les wireframes de l'interface d'administration n'étaient pas validés à J-3 avant la fin du sprint. US-007 passe en priorité 1 du Sprint 2 backlog.

---

## Feedback parties prenantes

### Rémi D. — Direction Commerciale
> "Les tarifs B2B en liste catalogue, c'est un vrai différenciateur fort face à nos concurrents. Les acheteurs voient immédiatement leur prix négocié sans avoir à appeler un commercial. C'est exactement ce qu'on voulait."

- Satisfaction : 🟢 Élevée sur US-002 (tarifs B2B visibles)
- Demande complémentaire : anticiper l'affichage des tarifs négociés par client (déjà prévue en US-008, Sprint 4)
- Point d'attention : validation du compte B2B indisponible = frein au test utilisateur complet

### SM
> "Le flood control sur la connexion a été très bien reçu par l'équipe Sécurité d'Company-Test. C'est une exigence de conformité et elle est déjà en place dès le Sprint 1."

- Satisfaction : 🟢 Positive sur US-006
- Observation : DoR insuffisante sur US-007 — action corrective déjà actée en rétro

### Dev Team
- Retour globalement positif sur la BDD Shift-Left (scénarios Gherkin écrits en amont)
- Frustration sur le setup tardif de l'environnement staging (A3 actée en rétro)

---

## Décisions prises

| # | Décision | Impact |
|---|---------- |--------|
| D1 | **Stripe retenu comme PSP** suite au SPIKE | US-016 (Paiement CB 3DS) confirmée en scope Sprint 3 — Adyen écarté |
| D2 | **US-007 embarquée en priorité 1 du Sprint 2** avec US-009 | Débloque la validation des comptes B2B et l'accès au panier |
| D3 | **Gate DoR strict appliqué dès Sprint 2** : toute US sans wireframe validé est bloquée au Sprint Planning | Évite un nouveau report — PO s'engage à valider les maquettes Sprint 2 avant le Planning |
| D4 | **Vélocité de référence = 16 SP** pour le Sprint 2 Planning | Projection PI ajustée : 64 SP sur 10 semaines (cible 70 SP) — surveillance nécessaire |

---

## Vélocité & projection PI

| Indicateur | Valeur |
|-----------|--------|
| Vélocité Sprint 1 | 16 SP |
| Projection PI (4 sprints × 16) | 64 SP |
| Cible PI-2026-Q3 | 70 SP |
| Écart projection / cible | -6 SP (⚠️ à surveiller) |
| Action corrective | Amélioration DoR + stabilisation setup → hausse vélocité Sprint 2-3 attendue |

> **Note PO** : la projection à 64 SP est en dessous de la cible PI de 70 SP. L'amélioration attendue sur les processus (DoR, staging, BDD) devrait permettre d'atteindre 16-18 SP/sprint à partir du Sprint 2. Suivi à la Sprint Review suivante.

---

## Prochaines étapes

- ✅ Sprint 2 Planning — semaine suivante
- ✅ US-007 en tête de backlog Sprint 2
- ✅ Refinement mid-sprint planifié à mi-Sprint 2
- ✅ Staging Sprint 2 opérationnel avant J+1 (Dev4)
