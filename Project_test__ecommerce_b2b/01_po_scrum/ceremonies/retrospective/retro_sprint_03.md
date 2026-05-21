# Rétrospective — Sprint 3

## Informations
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 3 — Canal Autonome Financièrement |
| Date | 2026-06-10 |
| Durée | 1h30 |
| Facilitateur | Scrum Master |
| Participants | PO · SM · Dev1 · Dev2 · Dev3 · Dev4 |
| Format | Start / Stop / Continue + Actions |

---

## Résultat Sprint 3

| Indicateur | Valeur |
|-----------|--------|
| SP planifiés | 14 (+3 SP US-015 glissée) |
| SP livrés | 14 |
| Sprint Goal atteint | ✅ Oui — canal autonome financièrement |
| Vélocité mesurée | 14 pts |
| US livrées | US-016 · US-018 · US-012 · US-015 |
| US non livrées | Aucune ✅ |
| Incidents recette | 1 incident 3DS Visa — résolu en hotfix avant Sprint Review |
| Milestone M3 | ✅ Validé DSI + Direction Financière |

---

## Format : Start / Stop / Continue

### ✅ CONTINUE — Ce qui a bien fonctionné

| # | Observation | Voté par |
|---|-------------|----------|
| C1 | **Tests E2E Behat instaurés** : les scénarios Behat sur le flux commande complet ont permis de détecter une régression sur la persistance du panier 48h avant la Sprint Review. Corrigé sans impact. La CI les exécute automatiquement à chaque merge. | Dev1 · Dev2 · QA |
| C2 | **Templates PDF contrôlés avant livraison** : Dev3 a soumis le template facture PDF au PO et à la Direction Financière (Sophie L.) pour validation 3j avant la fin du sprint. Aucun correctif demandé en Sprint Review. | Dev3 · PO · SM |
| C3 | **Gate DoR strict** : les US-016 et US-018 avaient leurs critères d'acceptation complets et les jeux de données Stripe sandbox prêts au Sprint Planning. 0 question de compréhension en cours de sprint. | PO · Dev1 |
| C4 | **Refinement mid-sprint** : la session de mi-sprint a préparé les US Sprint 4 (US-019, US-008). Dev4 a pu anticiper l'intégration API Chronopost. | Dev4 · PO |

---

### 🛑 STOP — Ce qu'on arrête

| # | Observation | Voté par |
|---|-------------|----------|
| S1 | **Livraison US-016 sans test 3DS sur carte Visa** : le flux 3DS n'a été testé qu'avec des cartes Mastercard en sandbox. Lors de la recette avec une carte Visa Crédit Agricole, la redirection 3DS retournait une erreur 403. L'incident a nécessité un hotfix en urgence (1j Dev1 + Dev2). Cause : Stripe Radar a des règles différentes selon le réseau carte. | Dev1 · Dev2 · QA |
| S2 | **Jeux de données Stripe sandbox non formalisés** : les cartes de test Stripe sandbox utilisées n'étaient pas documentées dans les critères d'acceptation. Chaque dev utilisait ses propres cartes de test sans coordination. | Dev3 · SM |

---

### 🚀 START — Ce qu'on démarre

| # | Proposition | Voté par |
|---|-------------|----------|
| T1 | **Matrice de test carte × banque pour les US paiement** : documenter les combinaisons à tester obligatoirement (Visa, Mastercard, CB, 3DS v1, 3DS v2, échec paiement, carte expirée). Intégrée aux critères d'acceptation de toute US paiement. | Dev1 · Dev2 · QA · PO |
| T2 | **Checklist Go-Live DSI dès Sprint 4** : la mise en production approche. Instaurée dans le DoD Sprint 4 : HTTPS, RGPD, logs applicatifs, monitoring, sauvegarde BDD, certificat SSL. Validation DSI obligatoire. | SM · PO · Dev4 |
| T3 | **Cartes de test Stripe documentées dans le wiki projet** : liste des cartes sandbox Stripe (succès, échec, 3DS, Visa, Mastercard) accessible à toute l'équipe dans Confluence. | Dev2 |

---

## Actions décidées

| ID | Action | Responsable | Échéance | Statut |
|----|--------|-------------|----------|--------|
| A1 | Livrer le hotfix 3DS Visa en recette et valider avec la matrice complète (Visa + Mastercard + CB) | Dev1 + Dev2 | 2026-06-11 | En cours |
| A2 | Créer la matrice de test carte × banque et l'intégrer aux critères d'acceptation US-016 | QA + PO | 2026-06-13 | À faire |
| A3 | Ajouter Checklist Go-Live DSI au DoD Sprint 4 (document partagé avec Marc T.) | SM + PO | Avant Sprint 4 Planning | À faire |
| A4 | Documenter les cartes Stripe sandbox dans le wiki projet (Confluence) | Dev2 | 2026-06-15 | À faire |

---

## Vélocité & capacité

| Métrique | Sprint 3 | Projection Sprint 4 |
|----------|----------|---------------------|
| SP livrés | 14 | 16 (planifiés) |
| US reportées | 0 | — |
| Absentéisme | 0 | 0 prévu |
| Capacité | 4 dev × 2 semaines | identique |
| Incidents recette | 1 (hotfix 3DS Visa) | Couvert par A1-A2 |

> **Note PO** : la vélocité de 14 SP est liée au périmètre planifié, pas à un problème de capacité. Le Sprint 3 est le premier sprint à 0 report. L'incident 3DS Visa est un signal fort sur la couverture de test — la matrice carte × banque est non négociable pour Sprint 4.

---

## Satisfaction équipe

| Critère | Note /5 | Commentaire |
|---------|---------|-------------|
| Clarté des US | 5/5 | DoR parfaite, BDD bien maîtrisée |
| Qualité des livrables | 4/5 | Incident 3DS Visa en recette — non détecté avant |
| Collaboration équipe | 4.5/5 | Réactivité exemplaire sur le hotfix (1j) |
| Confiance Sprint 4 | 4.5/5 | Tarifs négociés US-008 très attendus |

---

## Décisions actées

1. **Matrice de test carte × banque** instaurée — obligatoire pour toute US paiement à partir de Sprint 4.
2. **Checklist Go-Live DSI** ajoutée au DoD Sprint 4 — validation Marc T. (DSI) requise avant Sprint Review 4.
3. **Hotfix 3DS Visa** validé en recette avant Sprint 4 Planning — clôture de l'incident.
4. **Cartes Stripe sandbox documentées** dans le wiki — disponibles pour toute l'équipe dès Sprint 4.
