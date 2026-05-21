# Rétrospective — Sprint 1

## Informations
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 1 — Fondations Catalogue & Comptes B2B |
| Date | 2026-05-20 |
| Durée | 1h30 |
| Facilitateur | Scrum Master |
| Participants | PO · SM · Dev1 · Dev2 · Dev3 · Dev4 |
| Format | Start / Stop / Continue + Actions |

---

## Résultat Sprint 1

| Indicateur | Valeur |
|-----------|--------|
| SP planifiés | 18 |
| SP livrés | 16 |
| Sprint Goal atteint | ✅ Oui — catalogue navigable + compte B2B activable |
| Vélocité mesurée | 16 pts |
| US livrées | US-001 · US-002 · US-005 · US-006 |
| US non livrées | US-007 (repoussée Sprint 2 — dépendance back-office non prête) |
| Spike PSP | ✅ Terminé — décision : Stripe retenu |

---

## Format : Start / Stop / Continue

### ✅ CONTINUE — Ce qui a bien fonctionné

| # | Observation | Voté par |
|---|-------------|----------|
| C1 | **BDD Shift-Left** : scénarios Gherkin écrits avant le dev. Dev2 et Dev3 ont validé que c'était un gain de temps réel sur la compréhension des US. | Dev2 · Dev3 · QA |
| C2 | **Planning Poker** : l'exercice a permis d'identifier tôt la complexité API INSEE et de la descoper. Évité un dépassement estimé à +3 SP. | Équipe |
| C3 | **Timebox SPIKE** : requalifier le SPIKE en 1 jour timebox (hors SP) a clarifié les attentes et protégé la vélocité. | PO · Dev1 |
| C4 | **CLAUDE.md projet** : avoir le contexte stack + conventions dans un fichier chargé à chaque session a évité les questions répétées. | PO · Dev4 |

---

### 🛑 STOP — Ce qu'on arrête

| # | Observation | Voté par |
|---|-------------|----------|
| S1 | **Lancer un sprint sans DoR complète** : les wireframes catalogue et les templates email n'étaient pas prêts au démarrage. Dev1 a perdu ~0.5j à attendre la validation des maquettes. | Dev1 · Dev2 |
| S2 | **Estimer les SPIKEs en story points** : un SPIKE n'est pas une US livrable. La confusion a faussé la vélocité initiale du planning. | SM · Dev3 |
| S3 | **Rôles Drupal configurés trop tard** : les rôles "acheteur B2B" et "admin Company-Test" n'étaient pas en place à J+1. Dev3 a dû attendre Dev4 avant de commencer US-006. | Dev3 |

---

### 🚀 START — Ce qu'on démarre

| # | Proposition | Voté par |
|---|-------------|----------|
| T1 | **Appliquer le gate DoR strictement** : au Sprint Planning, chaque US doit avoir wireframe validé + données de test identifiées. Sinon, elle n'entre pas dans le sprint. | PO · SM |
| T2 | **Refinement mid-sprint** : organiser 1 session de refinement à mi-sprint pour préparer les US du sprint suivant et éviter les surprises au Planning. | Dev2 · Dev4 · PO |
| T3 | **Environnement staging opérationnel J+1** : Dev4 monte le staging Drupal avant le premier jour du sprint (pas pendant). | Dev4 |
| T4 | **Définir les jeux de données de test en amont** : QA prépare les comptes et produits de test pendant le sprint précédent, pas en cours de sprint. | QA · Dev1 |

---

## Actions décidées

| ID | Action | Responsable | Échéance | Statut |
|----|--------|-------------|----------|--------|
| A1 | Appliquer gate DoR au Sprint 2 Planning — bloquer toute US sans wireframe validé | PO + SM | Avant Sprint 2 Planning | À faire |
| A2 | Organiser session refinement Sprint 2 à mi-Sprint 1 (déjà en retard — à planifier d'urgence) | SM | 2026-05-22 | À faire |
| A3 | Dev4 monte staging Sprint 2 avant le jour 1 | Dev4 | Veille Sprint 2 | À faire |
| A4 | QA prépare jeux de données Sprint 2 (comptes, produits, commandes) | QA | Avant Sprint 2 Planning | À faire |
| A5 | Créer règle d'équipe : SPIKEs = timebox (jours), jamais en SP | SM | Mise à jour DoD — immédiat | À faire |

---

## Vélocité & capacité

| Métrique | Sprint 1 | Projection Sprint 2 |
|----------|----------|---------------------|
| SP livrés | 16 | 16-18 (hausse si A1-A4 appliqués) |
| US reportées | 1 (US-007) | À embarquer en priorité |
| Absentéisme | 0 | 0 prévu |
| Capacité | 4 dev × 2 semaines | identique |

> **Note PO** : US-007 (Validation manuelle compte admin) reportée Sprint 2 car l'interface back-office Drupal n'était pas configurée. Elle est **Must Have** et passe en tête du Sprint 2 backlog avec US-009 (Ajout panier).

---

## Satisfaction équipe

| Critère | Note /5 | Commentaire |
|---------|---------|-------------|
| Clarté des US | 4/5 | BDD Gherkin très utile |
| Qualité des livrables | 4/5 | US-007 reportée mais les 4 autres validées |
| Collaboration équipe | 4/5 | Bonne dynamique malgré les retards setup |
| Confiance Sprint 2 | 3.5/5 | Dépend de la résolution DoR |

---

## Décisions actées

1. **Stripe retenu comme PSP** — Spike terminé, décision validée par PO. US-016 (Paiement CB 3D Secure Stripe) confirmée en scope V1.
2. **US-007 embarquée en Sprint 2** — priorité 1 avec US-009.
3. **Vélocité de référence = 16 SP** — utilisée pour le Sprint 2 Planning.
4. **Règle SPIKE = timebox jours** — acté dans le DoD à partir du Sprint 2.
