# Rétrospective PI — PI-2026-Q3

## Informations
| Champ | Valeur |
|-------|--------|
| PI | PI-2026-Q3 — Company-Test e-Commerce B2B |
| Date | 2026-07-10 |
| Durée | 2h |
| Format | Inspect & Adapt SAFe — PI Retrospective |
| Facilitateur | Scrum Master |
| Participants | PO Guy H. · SM · Dev1 · Dev2 · Dev3 · Dev4 · Rémi D. (Direction Commerciale) · Marc T. (DSI) |
| Période couverte | 2026-04-28 au 2026-07-11 — 10 semaines |

---

## Métriques PI (PI Metrics)

### Vélocité par sprint

| Sprint | SP Planifiés | SP Livrés | Taux | Statut |
|--------|-------------|-----------|------|--------|
| Sprint 1 | 18 | 16 | 88,9 % | 🟡 Légèrement en dessous |
| Sprint 2 | 16 | 15 | 93,8 % | 🟡 Très proche |
| Sprint 3 | 14 | 14 | 100 % | ✅ Parfait |
| Sprint 4 | 16 | 16 | 100 % | ✅ Parfait |
| IP Sprint | 13 | 13 | 100 % | ✅ Parfait |
| **Total PI** | **77** | **74** | **96 %** | ✅ **Objectif PI atteint** |

> **Note** : Les 74 SP livrés dépassent la cible initiale de 70 SP (cible ajustée PI Planning). 3 SP non livrés correspondent à des optimisations UX déprioritisées en cours de PI (enrichissement US-010, autocomplétion filtres). Tous les Must Have sont livrés à 100 %.

### Métriques qualité

| Indicateur | Valeur | Cible | Statut |
|-----------|--------|-------|--------|
| Bugs critiques en production | 0 | 0 | ✅ |
| Bugs majeurs résolus en sprint | 2 | ≤ 3 | ✅ |
| Incidents recette bloquants | 1 (3DS Visa — hotfix 1j) | 0 | ⚠️ |
| Couverture BDD (Must Have) | 100 % | 100 % | ✅ |
| Couverture tests E2E Behat | 85 % flux critiques | ≥ 80 % | ✅ |
| US reportées d'un sprint à l'autre | 2 (US-007 S1→S2 · US-015 S2→S3) | ≤ 2/PI | ✅ |
| Sprint Goal atteint | 4/4 sprints + IP | 4/4 | ✅ |
| Milestones validés | M3 (DSI+DF) · M4 (System Demo) | 2/2 | ✅ |

### Métriques équipe

| Indicateur | Valeur |
|-----------|--------|
| Vélocité S1 | 16 SP |
| Vélocité S2 | 15 SP |
| Vélocité S3 | 14 SP |
| Vélocité S4 | 16 SP |
| Vélocité IP Sprint | 13 SP |
| **Total effectif** | **74 SP** |
| Absentéisme | 0 jour sur 10 semaines |
| Turnover équipe | 0 |
| Satisfaction équipe (moyenne PI) | 4,2/5 |

---

## Problem-Solving Workshop

### Problème 1 — Dépendances données métier externes non contractualisées

| Élément | Détail |
|---------|--------|
| Problème | La grille tarifaire Chronopost (US-019) a été reçue à J-3 avant la fin du Sprint 4. Dev3 a dû interrompre US-003 pour traiter l'import urgent. Risque quasi-matérialisé. |
| Root Cause | Aucun accord formel avec les partenaires sur les dates de livraison des données. Pas de DoR au niveau PI pour les dépendances externes. |
| Impact | Désorganisation équipe J-3, risque de glissement US-003, stress équipe inutile. |
| Solutions identifiées | 1. Règle J-14 : toute donnée externe doit être reçue et validée J-14 avant le sprint. 2. Risk Board ART dès le PI Planning avec propriétaire + date par dépendance. 3. Clause contractuelle avec les partenaires API/data. |
| Décision | ✅ Règle J-14 intégrée au DoR PI suivant. Risk Board ART instauré. |

---

### Problème 2 — Couverture de test insuffisante sur les US paiement

| Élément | Détail |
|---------|--------|
| Problème | US-016 (Paiement 3DS) testée uniquement avec cartes Mastercard. Incident recette avec carte Visa Crédit Agricole (erreur 403 Stripe Radar). Hotfix 1j requis. |
| Root Cause | Pas de matrice de test carte × banque dans les critères d'acceptation. Chaque dev utilisait ses propres cartes de test sandbox sans coordination ni revue PO. |
| Impact | Incident en recette, hotfix non planifié (1j), stress équipe, risque dépassé en production si non détecté. |
| Solutions identifiées | 1. Matrice de test carte × banque obligatoire dans les critères d'acceptation de toute US paiement. 2. Cartes sandbox Stripe documentées dans le wiki projet. 3. Revue de la matrice par QA + PO avant livraison US paiement. |
| Décision | ✅ Matrice instaurée dès Sprint 3 — 0 incident paiement Sprint 4. Pratique confirmée pour le PI suivant. |

---

### Problème 3 — Dette technique non tracée et non visible

| Élément | Détail |
|---------|--------|
| Problème | La dette QA identifiée en Sprint 2 (checkout non testé bout-en-bout) n'était pas visible dans le backlog Jira. Elle a été traitée en rétro mais jamais formalisée comme US technique. |
| Root Cause | Pas de backlog de dette technique dédié. La dette est identifiée en rétrospective mais ne remonte pas en Sprint Planning. |
| Impact | Dette invisible pour les parties prenantes. Risque de régression non mesuré. Pas de priorisation possible par le PO. |
| Solutions identifiées | 1. Créer un Epic "Dette Technique" dans Jira — visible en Sprint Review. 2. Règle : 1 US technique minimum par sprint (capacité dédiée ~2 SP). 3. Dette reportée en backlog product = US normale avec critères d'acceptation. |
| Décision | ✅ Epic "Dette Technique" créé dans Jira. Règle 2 SP/sprint pour le PI suivant. |

---

## Actions PI suivant

| ID | Action | Responsable | Priorité | Périmètre |
|----|--------|-------------|---------|-----------|
| API-01 | Intégrer la règle J-14 (données métier) dans le DoR du PI suivant — présentée au PI Planning | PO + SM | 🔴 Haute | DoR PI-2026-Q4 |
| API-02 | Mettre en place le Risk Board ART dès le PI Planning — dépendances externes avec propriétaire et date | SM | 🔴 Haute | PI Planning Q4 |
| API-03 | Créer l'Epic "Dette Technique" dans Jira + règle 2 SP minimum par sprint | PO | 🔴 Haute | Sprint 1 Q4 |
| API-04 | Initier l'Architecture Decision Record (ADR) pour la Phase 2 Headless Next.js | PO + Dev1 | 🟡 Moyenne | IP Sprint / PI Planning Q4 |
| API-05 | Formaliser le programme de formation équipe Phase 2 (Next.js, GraphQL, Drupal headless) | SM + Dev1 | 🟡 Moyenne | PI Planning Q4 |

---

## Bilan Start / Stop / Continue — niveau PI

### ✅ CONTINUE — Pratiques à conserver

| # | Pratique PI | Résultat mesuré |
|---|------------|-----------------|
| C1 | **BDD Shift-Left (Gherkin avant dev)** | 0 question de compréhension US en cours de dev (Sprint 2 à IP Sprint). Couverture BDD 100 % Must Have. |
| C2 | **Gate DoR strict au Sprint Planning** | 0 US hors DoR embarquée après Sprint 1. 0 blocage en cours de sprint lié à une DoR incomplète. |
| C3 | **Tests E2E Behat en CI** | 3 régressions détectées avant merge Sprint 3-4. 0 régression atteint Sprint Review depuis Sprint 3. |
| C4 | **Refinement mid-sprint** | Sprint Planning de 30-45 min vs 2h Sprint 1. US prêtes à DoR complète. |
| C5 | **Checklist Go-Live DSI** | Mise en production préparée sans incident. Validation DSI sans réserve. |

### 🛑 STOP — Ce qu'on arrête au PI suivant

| # | Pratique à arrêter | Remplacement |
|---|-------------------|-------------|
| S1 | **Données métier reçues sans date contractuelle** | Règle J-14 dans le DoR PI |
| S2 | **Tests paiement sur une seule référence carte** | Matrice test carte × banque obligatoire |
| S3 | **Dette technique invisible en backlog** | Epic "Dette Technique" Jira + 2 SP/sprint |

### 🚀 START — Ce qu'on démarre au PI suivant

| # | Pratique à démarrer | Objectif |
|---|---------------------|--------|
| T1 | **Risk Board ART dès PI Planning** | Visibilité dépendances externes — éviter les surprises J-3 |
| T2 | **Architecture Decision Record (ADR) Phase 2** | Formaliser les choix techniques Headless Next.js |
| T3 | **Formation équipe Phase 2** | Next.js, GraphQL, Drupal JSON:API — montée en compétence planifiée |
| T4 | **Backlog Phase 2 initial** | Headless, marketplace, connecteur ERP — priorisation Direction |
| T5 | **KPI e-Commerce dashboard** | Analytics commandes, CA en ligne, taux conversion — demande Direction Commerciale |

---

## Synthèse PI — Message PO

> Le PI-2026-Q3 a été un succès : 74 SP livrés sur 70 planifiés, 4 Sprint Goals atteints, 0 bug critique en production, 2 milestones validés par la DSI et la Direction Financière. L'équipe a progressé en maturité tout au long du PI, passant d'un Sprint 1 à 88 % à trois sprints consécutifs à 100 %.
>
> Les deux incidents identifiés (report US-007 Sprint 1 et 3DS Visa Sprint 3) ont été traités rapidement et ont chacun généré des pratiques qui ont prévenu tout incident similaire pour le reste du PI.
>
> Le canal e-commerce B2B Company-Test est prêt pour la mise en production. La Phase 2 (Headless Next.js, marketplace, connecteur ERP) peut démarrer avec une équipe mature et des processus éprouvés.

**PO — Guy H. — 2026-07-10**

---

## Satisfaction globale PI

| Critère | Note /5 | Commentaire |
|---------|---------|-------------|
| Atteinte des objectifs PI | 5/5 | 97 % SP livrés, 100 % Must Have |
| Qualité des livrables | 4.5/5 | 1 incident recette résolu en hotfix |
| Collaboration équipe | 4.5/5 | Montée en maturité progressive et visible |
| Processus Scrum/SAFe | 4.5/5 | BDD, Behat, DoR, Checklist Go-Live — pratiques solides |
| Satisfaction parties prenantes | 5/5 | Feedback très positif Direction Commerciale + DSI + DF |
| **Moyenne PI** | **4,7/5** | ✅ Excellent |
