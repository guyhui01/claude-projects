# Plan IP Sprint — PI-2026-Q3

## Informations
| Champ | Valeur |
|-------|--------|
| PI | PI-2026-Q3 — Company-Test e-Commerce B2B |
| IP Sprint | Semaines 9-10 du PI — 2026-06-29 au 2026-07-11 |
| Durée | 2 semaines |
| Périmètre | 13 SP : US-004 (2) · US-020 (3) · US-022 (2) · US-023 (2) · Stabilisation (4 SP) |
| Objectif | Recette UAT clients pilotes + System Demo ART + PI Review + Inspect & Adapt |

---

## Planning IP Sprint — Semaine par semaine

### Semaine 9 — 2026-06-29 au 2026-07-04

| Jour | Activité | Responsable | Durée | Participants |
|------|----------|-------------|-------|-------------|
| Lun 29/06 | IP Sprint Planning — priorisation US + objectif recette | PO + SM | 2h | PO · SM · 4 Dev |
| Lun 29/06 | Démarrage dev US-022 (notif email demande compte) + US-023 (email bienvenue) | Dev3 · Dev4 | J1 | Dev3 · Dev4 |
| Mar 30/06 | Démarrage dev US-004 (téléchargement fiche technique PDF) | Dev1 | J1 | Dev1 |
| Mar 30/06 | Démarrage dev US-020 (adresses livraison multiples) | Dev2 | J1 | Dev2 |
| Mer 01/07 | Session recette interne — smoke test flux Sprint 1 à 4 | QA + SM | 4h | QA · Dev1 · Dev2 |
| Mer 01/07 | Refinement — revue backlog Phase 2 (orientations) | PO + SM | 1h | PO · SM |
| Jeu 02/07 | UAT clients pilotes Company-Test (Session 1 — 3 acheteurs B2B) | PO + Dev1 | 3h | PO · Dev1 · 3 acheteurs pilotes |
| Jeu 02/07 | Correction bugs UAT Session 1 | Dev2 · Dev3 | J1 | Dev2 · Dev3 |
| Ven 03/07 | Livraison US-022 + US-023 — tests BDD complets | Dev3 · Dev4 | ½j | Dev3 · Dev4 · QA |
| Ven 03/07 | Daily retrospective semaine 9 (SM — 30 min) | SM | 30 min | Équipe |

### Semaine 10 — 2026-07-07 au 2026-07-11

| Jour | Activité | Responsable | Durée | Participants |
|------|----------|-------------|-------|-------------|
| Lun 07/07 | Livraison US-004 + US-020 — revue PO | PO + Dev1 · Dev2 | 2h | PO · Dev1 · Dev2 |
| Lun 07/07 | Stabilisation : corrections bugs Sprint 1-4 identifiés en UAT | Dev3 · Dev4 | J1 | Dev3 · Dev4 |
| Mar 08/07 | UAT clients pilotes Company-Test (Session 2 — validation finale) | PO + SM | 3h | PO · SM · 3 acheteurs pilotes · Rémi D. |
| Mar 08/07 | Préparation System Demo ART — répétition scénario | PO + Dev1 | 2h | PO · Dev1 · SM |
| Mer 09/07 | **System Demo ART** | PO (animateur) | 2h | Équipe + Stakeholders + ART |
| Mer 09/07 | **PI Review** — bilan PI-2026-Q3 | PO | 1h | PO · SM · Direction |
| Jeu 10/07 | **Inspect & Adapt Workshop** | SM (facilitateur) | 3h | Équipe + PO + SM |
| Jeu 10/07 | **Rétrospective PI** | SM (facilitateur) | 2h | Équipe + PO + SM |
| Ven 11/07 | Clôture IP Sprint — mise en staging finale + doc Go-Live | Dev4 · PO | 3h | Dev4 · PO · DSI |

---

## System Demo — Préparation

### Objectif
Démontrer le canal e-commerce B2B Company-Test complet à l'ART et aux parties prenantes dans un scénario de bout en bout réaliste.

### Scénario de démo — "Thomas commande sur le canal B2B Company-Test"

| Étape | Description | US démontrée | Acteur |
|-------|-------------|-------------|--------|
| 1 | Thomas accède au catalogue FTTH, filtre par type de fibre monomode | US-001 + US-003 | PO (animation) |
| 2 | Thomas consulte la fiche produit — son tarif négocié s'affiche | US-002 + US-008 | PO |
| 3 | Thomas télécharge la fiche technique PDF du produit | US-004 | PO |
| 4 | Thomas crée son compte professionnel (SIRET) | US-005 | PO |
| 5 | Thomas reçoit l'email de confirmation de demande de compte | US-022 | Démontré en live |
| 6 | Admin Company-Test valide le compte B2B en back-office | US-007 | Dev1 |
| 7 | Thomas reçoit l'email de bienvenue + guide démarrage | US-023 | Démontré en live |
| 8 | Thomas se connecte, ajoute au panier, saisit N° BC | US-006 + US-009 + US-010 | PO |
| 9 | Thomas choisit son adresse de livraison parmi ses adresses enregistrées | US-020 | PO |
| 10 | Frais de livraison calculés automatiquement (Chronopost) | US-019 | PO |
| 11 | Paiement CB 3D Secure — Stripe PaymentIntent | US-016 | PO |
| 12 | Email confirmation commande + facture PDF reçus | US-011 + US-018 | Démontré en live |
| 13 | Admin change statut à "Expédiée" avec N° Chronopost | US-014 + US-021 | Dev1 |
| 14 | Thomas reçoit l'email de suivi avec lien tracking | US-021 | Démontré en live |
| 15 | Thomas consulte son historique de commandes + télécharge sa facture | US-012 | PO |

### Logistique System Demo

| Élément | Détail |
|---------|--------|
| Durée totale | 60 min (45 min démo + 15 min Q&A) |
| Environnement | Staging Drupal — données de recette |
| Animateur | PO Guy H. |
| Support technique | Dev1 (backup live) |
| Participants attendus | Équipe Scrum · Direction Commerciale · DSI · Direction Financière · ART Manager |
| Backup scénario | Vidéo d'enregistrement du scénario complet en cas de problème technique |

### US démontrées (résumé)
5 US majeures mises en avant : US-002 (tarifs B2B), US-005+007 (création + validation compte), US-010 (N° BC), US-016 (paiement 3DS), US-021 (tracking transporteur)

---

## PI Review — Agenda

### Objectif
Présenter les résultats du PI-2026-Q3 aux parties prenantes et valider l'atteinte des objectifs PI.

| # | Sujet | Durée | Animateur |
|---|-------|-------|-----------|
| 1 | Rappel des objectifs PI-2026-Q3 | 5 min | PO |
| 2 | Tableau de bord PI : SP livrés vs cible | 5 min | PO |
| 3 | Démonstration System Demo (voir section ci-dessus) | 45 min | PO |
| 4 | Revue des objectifs PI par feature | 10 min | PO |
| 5 | Bilan risques et impediments PI | 5 min | SM |
| 6 | Questions / réponses stakeholders | 15 min | PO + SM |
| 7 | Décisions et orientations Phase 2 | 10 min | Direction |

### Tableau de bord PI — Objectifs atteints

| Objectif PI | SP planifiés | SP livrés | Atteint |
|------------|-------------|-----------|---------|
| Catalogue B2B navigable | 10 SP | 10 SP | ✅ 100 % |
| Comptes B2B (création + validation) | 12 SP | 12 SP | ✅ 100 % |
| Flux commande complet | 13 SP | 13 SP | ✅ 100 % |
| Paiement CB 3DS | 8 SP | 8 SP | ✅ 100 % |
| Facturation + historique | 6 SP | 6 SP | ✅ 100 % |
| Livraison + tracking | 8 SP | 8 SP | ✅ 100 % |
| IP Sprint (US-004, US-020, US-022, US-023) | 9 SP | 9 SP | ✅ 100 % |
| Stabilisation | 4 SP | 4 SP | ✅ 100 % |
| **Total PI** | **70 SP** | **68 SP** | **✅ 97 %** |

> **Note PO** : 68/70 SP livrés = 97 % des objectifs PI atteints. Les 2 SP non livrés correspondent à des optimisations UX déprioritisées (enrichissement US-010 N° BC pré-rempli — reporté Phase 2). Tous les Must Have du PI sont livrés à 100 %.

---

## Inspect & Adapt — Sujets

### Format Problem-Solving Workshop (3h)

| # | Sujet | Type | Priorité |
|---|-------|------|---------|
| I1 | Dépendances données métier externes reçues tardivement (grille transporteur J-3) | Processus | 🔴 Haute |
| I2 | Couverture de test insuffisante sur les US paiement (incident 3DS Visa) | Qualité | 🔴 Haute |
| I3 | Estimation des US avec export/import de données (US-015 sous-estimée) | Estimation | 🟡 Moyenne |
| I4 | Setup environnement staging trop tardif en Sprint 1 | Infrastructure | 🟡 Moyenne |
| I5 | Backlog Phase 2 à construire : orientations headless, marketplace, ERP | Stratégie produit | 🟢 Normale |

### Agenda Inspect & Adapt

| Étape | Durée | Description |
|-------|-------|-------------|
| Présentation métriques PI | 30 min | PO présente le tableau de bord PI |
| Identification problèmes (dot voting) | 30 min | Équipe vote sur les problèmes prioritaires |
| Problem-Solving Workshop (top 3) | 90 min | Groupes de travail par problème — root cause + solutions |
| Restitution et priorisation actions | 30 min | Chaque groupe présente ses solutions |

---

## Rétrospective PI

### Format : Start / Stop / Continue au niveau PI

### ✅ CONTINUE — Succès à conserver au PI suivant

| # | Pratique | Impact observé |
|---|---------|----------------|
| C1 | **BDD Shift-Left (Gherkin avant dev)** : pratique instaurée Sprint 1 et maintenue 4 sprints. Résultat : 0 question de compréhension US en cours de dev à partir du Sprint 2. Couverture BDD 100 % Must Have. | Qualité · Vélocité |
| C2 | **Gate DoR strict au Sprint Planning** : aucune US hors DoR embarquée après Sprint 1. Résultat : 0 blocage en cours de sprint lié à une US mal préparée. | Prédictibilité |
| C3 | **Tests E2E Behat en CI** : instaurés Sprint 3, ont détecté 3 régressions avant merge. Aucune régression n'a atteint la Sprint Review après Sprint 3. | Qualité · Confiance |
| C4 | **Refinement mid-sprint** : pratique régulière qui a permis de préparer chaque sprint suivant avec des US à DoR complète. Zéro surprise au Sprint Planning à partir du Sprint 3. | Vélocité |

### 🛑 STOP — Ce qu'on arrête au PI suivant

| # | Problème | Root Cause | Impact PI |
|---|---------- |----------|-----------|
| S1 | **Dépendances données externes sans date contractuelle** | Pas de formalisation J-14 dans le DoR — données reçues au bon vouloir des partenaires | Risque quasi-matérialisé Sprint 4 (grille Chronopost J-3) |
| S2 | **US paiement testées sur une seule référence carte** | Pas de matrice de test carte × banque dans les critères d'acceptation | Incident 3DS Visa en recette Sprint 3 — hotfix 1j |
| S3 | **Dette technique non tracée** (dette QA checkout Sprint 2) | Pas de backlog de dette dédié dans Jira | Dette identifiée en rétro mais non visible en Sprint Review |

### 🚀 START — Ce qu'on démarre au PI suivant

| # | Action | Périmètre |
|---|--------|---------|
| T1 | **Contractualiser les données métier J-14** dans le DoR PI suivant | Toutes les dépendances transporteurs, API, configs partenaires |
| T2 | **Backlog technique dédié** dans Jira : US de dette technique visibles en Sprint Review | Sprint Planning systématique : 1 US technique / sprint minimum |
| T3 | **Risk Board ART** dès le PI Planning : dépendances externes avec propriétaire + date | Company-Test + partenaires API (Chronopost, Stripe, SendGrid) |
| T4 | **Phase 2 — Headless Next.js** : initier l'architecture decision record dès le PI Planning | Frontend Next.js + Drupal headless API-first |
| T5 | **Programme de formation équipe** sur les nouvelles technos Phase 2 (Next.js, GraphQL) | Dev1 · Dev2 · Dev3 · Dev4 |

---

## Backlog PI suivant — Premières orientations

> Ces orientations seront affinées lors du PI Planning du PI-2026-Q4. Elles sont issues du feedback parties prenantes, de l'Inspect & Adapt et des demandes de la Direction Commerciale Company-Test.

| Thème | Description | Priorité estimée |
|-------|-------------|-----------------|
| **Phase 2 — Frontend Headless Next.js** | Migration du frontend Drupal vers une application Next.js consommant les APIs Drupal en headless. Performance, SEO, expérience mobile optimisée. | 🔴 Haute |
| **Marketplace Company-Test** | Extension du catalogue à des produits tiers (partenaires distributeurs). Gestion multi-vendeur, commissions, facturation partenaires. | 🟡 Moyenne |
| **Connecteur ERP/SAP** | Intégration bidirectionnelle avec SAP : synchronisation stocks en temps réel, import commandes dans SAP, export factures. Hors scope V1. | 🟡 Moyenne |
| **Enrichissement UX commande** | Pré-remplissage N° BC (US-010 enrichi), adresse livraison favorite, réapprovisionnement rapide depuis historique. | 🟢 Normale |
| **Portail client self-service** | Espace "Mon compte" enrichi : gestion des contacts acheteurs, consultation des tarifs négociés, téléchargement des documents commerciaux. | 🟢 Normale |
| **Analytics e-Commerce** | Tableau de bord KPI Direction Commerciale : CA en ligne, taux de conversion, panier moyen, top produits B2B. | 🟢 Normale |

---

## Indicateurs de réussite IP Sprint

| Critère | Cible | Statut |
|---------|-------|--------|
| SP livrés IP Sprint | 13/13 | 🟡 En cours |
| UAT clients pilotes validée | ✅ Oui | 🟡 Planifiée |
| Checklist Go-Live prod complète | ✅ 100 % | 🟡 En cours |
| 0 bug critique en recette finale | ✅ Oui | 🟡 En cours |
| System Demo ART réussie | ✅ Oui | 🟡 Planifiée |
| PI Review parties prenantes | ✅ Oui | 🟡 Planifiée |
| Inspect & Adapt actions documentées | ≥ 5 actions | 🟡 Planifiée |
