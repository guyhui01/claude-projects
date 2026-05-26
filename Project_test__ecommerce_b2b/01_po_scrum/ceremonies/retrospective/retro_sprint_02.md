# Rétrospective — Sprint 2

## Informations
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 2 — Commande B2B Complète |
| Date | 2026-05-27 |
| Durée | 1h30 |
| Facilitateur | Scrum Master |
| Participants | PO · SM · Dev1 · Dev2 · Dev3 · Dev4 |
| Format | Start / Stop / Continue + Actions |

---

## Résultat Sprint 2

| Indicateur | Valeur |
|-----------|--------|
| SP planifiés | 16 |
| SP livrés | 15 |
| Sprint Goal atteint | ✅ Oui — acheteur B2B validé peut passer commande complète |
| Vélocité mesurée | 15 pts |
| US livrées | US-007 · US-009 · US-010 · US-011 · US-013 · US-014 |
| US non livrées | US-015 (export CSV — glissée Sprint 3) |
| Dette QA identifiée | Checkout multi-pane livré sans test intégration bout-en-bout à J-2 |

---

## Format : Start / Stop / Continue

### ✅ CONTINUE — Ce qui a bien fonctionné

| # | Observation | Voté par |
|---|-------------|----------|
| C1 | **BDD Shift-Left** : scénarios Gherkin écrits avant le dev. Tous les devs confirment la valeur sur la clarté des US. 0 question de compréhension en cours de dev sur les US couvertes. | Équipe |
| C2 | **Gate DoR strict appliqué** : toutes les US du Sprint 2 avaient wireframes validés au Sprint Planning. Aucune US bloquée pour cause de DoR incomplète — amélioration directe vs Sprint 1. | PO · SM · Dev1 |
| C3 | **Staging opérationnel J+1** : Dev4 a monté l'environnement staging avant le premier jour du sprint. Aucune perte de temps en début de sprint. | Dev4 · Dev2 |
| C4 | **Refinement mid-sprint** : la session organisée à mi-Sprint 2 a permis de préparer les US-016 et US-018 pour le Sprint 3. Planning Sprint 3 plus fluide et rapide. | Dev3 · Dev4 · PO |

---

### 🛑 STOP — Ce qu'on arrête

| # | Observation | Voté par |
|---|-------------|----------|
| S1 | **Checkout multi-pane livré sans test intégration bout-en-bout à J-2** : le flux complet panier → N° BC → confirmation n'a pas été testé de façon end-to-end avant la Sprint Review. Un bug de persistance du N° BC a été détecté lors de la démo. Corrigé en live mais ça n'aurait pas dû arriver. | Dev1 · Dev2 · SM |
| S2 | **Estimation à la louche pour US-015** : l'export CSV a été estimé à 3 SP sans analyse détaillée des exigences de format client. En cours de sprint, le scope réel était de ~5 SP. Glissement prévisible si on avait fait une vraie analyse. | Dev3 · PO |

---

### 🚀 START — Ce qu'on démarre

| # | Proposition | Voté par |
|---|-------------|----------|
| T1 | **Tests E2E Behat sur le flux commande complet** : instaurer des tests automatisés Behat couvrant le flux bout-en-bout (panier → checkout → confirmation email). Scénarios écrits par QA avec le PO avant le dev. | Dev1 · Dev2 · QA · SM |
| T2 | **Pré-remplissage N° BC depuis l'historique** (enrichissement US-010) : la suggestion de Thomas M. (UAT) est une vraie valeur UX. Ajouter au backlog comme amélioration de US-010 à prioriser en IP Sprint ou Phase 2. | PO · Dev4 |
| T3 | **Analyse des exigences format avant estimation** : pour toute US impliquant un export/import de données, faire une session d'analyse de 30 min avec le PO avant le Planning Poker. | SM · Dev3 · PO |

---

## Actions décidées

| ID | Action | Responsable | Échéance | Statut |
|----|--------|-------------|----------|--------|
| A1 | Écrire les scénarios Behat E2E pour le flux commande complet (panier → checkout → email) | QA + Dev1 | 2026-06-03 | À faire |
| A2 | Intégrer les tests Behat E2E dans la CI du Sprint 3 (exécution automatique sur merge) | Dev2 | 2026-06-05 | À faire |
| A3 | Documenter les exigences format de US-015 (CSV) pour finalisation Sprint 3 | PO + Dev3 | 2026-05-29 | À faire |
| A4 | Ajouter au backlog : enrichissement US-010 (pré-remplissage N° BC) — estimation à faire en refinement | PO | 2026-06-01 | À faire |

---

## Vélocité & capacité

| Métrique | Sprint 2 | Projection Sprint 3 |
|----------|----------|---------------------|
| SP livrés | 15 | 14 (planifiés) + US-015 (3 SP glissés) |
| US reportées | 1 (US-015) | À embarquer priorité 2 |
| Absentéisme | 0 | 0 prévu |
| Capacité | 4 dev × 2 semaines | identique |
| Dette QA | 1 item identifié | Couvert par A1-A2 Behat |

> **Note PO** : la vélocité de 15 SP est stable et satisfaisante. La glisse de US-015 est liée à une mauvaise estimation, pas à un problème de capacité ou de clarté. L'instauration des tests E2E Behat dès Sprint 3 est la priorité qualité de cette rétrospective.

---

## Satisfaction équipe

| Critère | Note /5 | Commentaire |
|---------|---------|-------------|
| Clarté des US | 5/5 | Gate DoR appliqué — très nette amélioration vs S1 |
| Qualité des livrables | 4/5 | US-015 non livrée mais sprint goal atteint |
| Collaboration équipe | 4/5 | Bonne dynamique, refinement mid-sprint efficace |
| Confiance Sprint 3 | 4/5 | US-016 (3DS) = milestone critique — bonne préparation |

---

## Décisions actées

1. **Tests E2E Behat instaurés dès Sprint 3** — couverture du flux commande complet obligatoire avant livraison.
2. **US-015 embarquée en Sprint 3** — documentation exigences format complétée avant Sprint 3 Planning.
3. **US-010 enrichissement (N° BC pré-rempli)** — ajoutée au backlog, priorisée en IP Sprint.
4. **Règle d'analyse format données** avant estimation des US export/import — acté dans le process de refinement.
