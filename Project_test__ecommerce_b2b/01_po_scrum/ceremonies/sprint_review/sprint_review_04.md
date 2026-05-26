# Sprint Review — Sprint 4

## Informations
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 4 — Canal e-Commerce B2B Complet |
| Date | 2026-06-23 |
| Durée | 2h |
| Animateur | PO — Guy H. |
| Participants | PO Guy H. · SM · Dev1 · Dev2 · Dev3 · Dev4 · Rémi D. (Direction Commerciale) · Marc T. (DSI) · Sophie L. (Direction Financière) · Thomas M. (UAT acheteur B2B) |
| Sprint Goal | "Le canal e-commerce B2B est complet : frais de livraison calculés, tracking transporteur, filtres catalogue et tarifs négociés disponibles" |
| Statut Sprint Goal | ✅ ATTEINT |

---

## Sprint Goal

> "Le canal e-commerce B2B est complet : frais de livraison calculés, tracking transporteur, filtres catalogue et tarifs négociés disponibles."

✅ **Sprint Goal atteint** — Le calcul automatique des frais de livraison via Chronopost/Colissimo est opérationnel. Le numéro de suivi transporteur est envoyé au client. Les filtres catalogue (référence, type fibre) sont disponibles. Les tarifs négociés par client B2B sont implémentés. Le canal e-commerce est prêt pour la recette finale.

---

## Démo produit

| US | Titre | Fonctionnalité démontrée | Acceptée PO | Remarques |
|----|-------|--------------------------|-------------|-----------|
| US-019 | Calcul frais livraison automatique | Calcul temps réel des frais Chronopost/Colissimo au checkout selon poids/destination, affichage avant paiement | ✅ Oui | API transporteur intégrée — grille tarifaire reçue J-3 (risque quasi-matérialisé) |
| US-021 | Envoi numéro suivi transporteur | Email automatique avec numéro de tracking Chronopost + lien de suivi, déclenché à l'expédition | ✅ Oui | Thomas M. : "C'est ce que nos clients attendent — ça réduit les appels SAV" |
| US-003 | Filtres catalogue (référence, type fibre) | Filtres latéraux sur le catalogue : par référence produit, par type de fibre (monomode/multimode), par gaine | ✅ Oui | Temps de réponse < 500ms avec 200 produits en recette |
| US-008 | Tarifs négociés spécifiques par client B2B | Affichage du tarif négocié à la fiche produit et au panier, gestion de la grille tarifaire en back-office | ✅ Oui | Direction Commerciale : "C'est la valeur majeure du projet pour nous" |

---

## Résultats du sprint

| Indicateur | Valeur |
|-----------|--------|
| SP planifiés | 16 |
| SP livrés | 16 |
| Taux de complétion | 100 % |
| US livrées | US-019 · US-021 · US-003 · US-008 |
| US non livrées | Aucune ✅ |
| Incidents en recette | 0 critique · 0 majeur |
| Checklist Go-Live DSI | ✅ Validée |

> ✅ **Sprint 100 % livré** — deuxième sprint consécutif à 100 % de complétion. La checklist Go-Live DSI instaurée au Sprint 4 a été validée sans réserve majeure.

---

## Milestone M4 — System Demo ART

✅ **Milestone M4 atteint** — System Demo présentée à l'ART (Agile Release Train) Company-Test.

### Scénario de démo System Demo

Le scénario complet "Thomas commande sur le canal B2B" a été déroulé de bout en bout :

1. Thomas navigue dans le catalogue FTTH et filtre par type de fibre monomode
2. Thomas consulte la fiche produit — son tarif négocié s'affiche (US-008)
3. Thomas ajoute au panier, saisit son N° BC, valide la commande
4. Paiement CB 3DS via Stripe — succès confirmé
5. Email de confirmation + facture PDF reçus (SendGrid)
6. Admin Company-Test change le statut à "Expédiée" avec N° Chronopost
7. Thomas reçoit l'email de suivi avec lien de tracking

| Étape | US démontrée | Résultat |
|-------|-------------|---------|
| Navigation + filtres | US-001 + US-003 | ✅ |
| Fiche produit + tarif négocié | US-002 + US-008 | ✅ |
| Panier + N° BC | US-009 + US-010 | ✅ |
| Paiement 3DS | US-016 | ✅ |
| Email confirmation + facture | US-011 + US-018 | ✅ |
| Calcul frais livraison | US-019 | ✅ |
| Email tracking Chronopost | US-021 | ✅ |

---

## Feedback parties prenantes

### Rémi D. — Direction Commerciale
> "Les tarifs négociés par client, c'est la valeur majeure du projet pour nous. On peut maintenant récompenser les gros acheteurs sans passer par un commercial. C'est un vrai levier de fidélisation. Bravo à toute l'équipe."

- Satisfaction : 🟢 Très élevée — particulièrement sur US-008
- Point positif : le flux de commande complet est fluide et crédible commercialement
- Hâte de passer en recette UAT complète avec les premiers clients pilotes

### Marc T. — DSI
- Checklist Go-Live validée sans réserve majeure
- Points vérifiés : HTTPS, RGPD, logs applicatifs, monitoring (Uptime Robot), sauvegarde BDD quotidienne
- ✅ Feu vert DSI pour passer en recette finale (IP Sprint)

### Thomas M. — Responsable Achats (UAT acheteur B2B)
> "L'email de suivi de colis avec le lien Chronopost, c'est exactement ce que nos clients attendent. Ça réduit les appels SAV. Et le calcul automatique des frais de port avant de payer, c'est rassurant."

- Satisfaction : 🟢 Élevée sur US-019 (frais livraison) et US-021 (tracking)
- Note sur les filtres : utiles mais le filtre par référence pourrait être amélioré (autocomplétion) — à prévoir Phase 2

### Sophie L. — Direction Financière
- Satisfaite de la cohérence entre tarifs négociés (US-008) et factures PDF (US-018)
- Demande de vérification : TVA correctement calculée sur les tarifs négociés — ✅ confirmé Dev2

---

## Décisions prises

| # | Décision | Impact |
|---|----------|--------|
| D1 | **Feu vert pour la recette finale** en IP Sprint | UAT avec 3 clients pilotes Company-Test planifiée semaine 9 |
| D2 | **Contractualisation données métier J-14** instaurée pour le PI suivant | Action suite au risque grille tarifaire transporteur reçue J-3 (quasi-matérialisé) |
| D3 | **Phase 2 orientations validées en principe** | Headless Next.js, marketplace, connecteur ERP — sujets Inspect & Adapt |
| D4 | **IP Sprint confirmé** : US-004, US-020, US-022, US-023 + stabilisation (13 SP) | Périmètre IP Sprint verrouillé |

---

## Vélocité & projection PI

| Indicateur | Sprint 1 | Sprint 2 | Sprint 3 | Sprint 4 | Total |
|-----------|----------|----------|----------|----------|-------|
| SP livrés | 16 | 15 | 14 | 16 | 61 |
| Cumul SP livrés | 16 | 31 | 45 | 61 | — |
| Cible PI (hors IP) | — | — | — | — | 64 (planifiés) |
| Statut | — | — | — | — | 🟢 95 % |

> **Note PO** : 61 SP livrés sur les 4 sprints. IP Sprint planifié à 13 SP, dont 9 US + 4 SP stabilisation. Objectif PI total = 74 SP effectifs si IP Sprint est livré à 100 % (cible PI = 70 SP). En avance sur la cible initiale.

---

## Prochaines étapes

- ✅ IP Sprint démarré — semaine 9-10 du PI
- ✅ UAT acheteurs pilotes planifiée (3 clients Company-Test)
- ✅ Checklist Go-Live DSI : opérations restantes (monitoring prod, DNS, certificat SSL prod)
- ✅ PI Review et Inspect & Adapt en fin IP Sprint
- ✅ Rétrospective PI — bilan sur 10 semaines
