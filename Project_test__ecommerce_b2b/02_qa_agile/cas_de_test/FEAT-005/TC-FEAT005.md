# Cas de Test — FEAT-005 Paiement & Facturation

## Référence
| Champ | Valeur |
|-------|--------|
| Feature | FEAT-005 — Paiement & Facturation |
| Sprint | Sprint 3 |
| US couvertes | US-016 · US-018 · US-012 |
| Fichiers BDD | `bdd_gherkin/US-016.feature` · `bdd_gherkin/US-018.feature` · `bdd_gherkin/US-012.feature` |
| Rédacteur | QA Agile |
| Date | 2026-05-20 |

---

## US-016 — Paiement CB 3D Secure via Stripe PaymentIntent

### TC-FEAT005-001 — Paiement Visa réussi avec authentification 3D Secure

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-001 |
| BDD ref | US-016.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté avec le rôle `b2b_buyer`
- Panier contenant des articles pour 1 500,00 € TTC
- Numéro de BC "BC-2026-00145" saisi
- Environnement de test Stripe configuré

**Étapes**
1. Atteindre l'étape de paiement du checkout
2. Saisir la carte Visa de test "4000000000003220"
3. Compléter l'authentification 3D Secure dans la fenêtre popup

**Résultat attendu**
- Paiement confirmé par Stripe (status: `succeeded`)
- Commande passe au statut "En cours de traitement"
- Redirection vers la page de confirmation de commande

---

### TC-FEAT005-002 — Paiement Mastercard réussi avec 3D Secure

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-002 |
| BDD ref | US-016.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Même contexte que TC-FEAT005-001

**Étapes**
1. Atteindre l'étape de paiement
2. Saisir la carte Mastercard de test "5200828282828210"
3. Compléter l'authentification 3D Secure

**Résultat attendu**
- Paiement confirmé par Stripe
- Commande passe au statut "En cours de traitement"

---

### TC-FEAT005-003 — Paiement refusé — carte déclinée

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-003 |
| BDD ref | US-016.feature — Scénario 3 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur à l'étape de paiement

**Étapes**
1. Saisir la carte de test "4000000000000002" (carte déclinée Stripe)
2. Tenter de valider le paiement

**Résultat attendu**
- Stripe retourne `card_declined`
- Message "Votre carte bancaire a été refusée. Veuillez vérifier vos coordonnées ou utiliser une autre carte." affiché
- Commande reste au statut "En attente de paiement"
- Aucun débit effectué

---

### TC-FEAT005-004 — Annulation de l'authentification 3D Secure

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-004 |
| BDD ref | US-016.feature — Scénario 4 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur à l'étape de paiement avec la carte "4000000000003220"

**Étapes**
1. Saisir la carte "4000000000003220"
2. Dans la fenêtre popup 3D Secure, cliquer sur "Annuler"

**Résultat attendu**
- Paiement annulé
- Message "Authentification annulée. Veuillez réessayer." affiché
- Commande reste au statut "En attente de paiement"

---

### TC-FEAT005-005 — Idempotence webhook Stripe — double traitement impossible

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-005 |
| BDD ref | US-016.feature — Scénario 5 |
| Priorité | Critique |
| Type | Technique |
| Statut | À faire |

**Préconditions**
- Commande "CMD-2026-0042" au statut "En attente de paiement"
- Endpoint webhook Stripe configuré sur l'environnement de test

**Étapes**
1. Simuler la réception d'un webhook `payment_intent.succeeded` pour "CMD-2026-0042"
2. Simuler le rejoué du même webhook (second appel identique)
3. Vérifier l'état de la commande en base

**Résultat attendu**
- La commande est traitée une seule fois
- Statut = "En cours de traitement" (pas de doublon)
- Le second webhook retourne HTTP 200 sans effet de bord (idempotence garantie)

---

### TC-FEAT005-006 — Paiement avec fonds insuffisants

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-006 |
| BDD ref | US-016.feature — Scénario 6 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur à l'étape de paiement

**Étapes**
1. Saisir la carte de test "4000000000009995" (fonds insuffisants)

**Résultat attendu**
- Stripe retourne `insufficient_funds`
- Message "Fonds insuffisants. Veuillez contacter votre banque ou utiliser une autre carte." affiché
- Commande reste au statut "En attente de paiement"

---

## US-018 — Génération et envoi facture PDF post-commande

### TC-FEAT005-007 — Génération et envoi automatique de la facture après paiement

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-007 |
| BDD ref | US-018.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Commande "CMD-2026-0042" avec paiement confirmé par Stripe
- Module PDF actif, SendGrid opérationnel

**Étapes**
1. Confirmer le paiement Stripe pour "CMD-2026-0042"
2. Vérifier la boîte email de "thomas.mercier@client.fr"

**Résultat attendu**
- Facture PDF générée automatiquement
- Email envoyé à "thomas.mercier@client.fr" via SendGrid
- Objet : "Votre facture Company-Test — Commande CMD-2026-0042"

---

### TC-FEAT005-008 — Contenu obligatoire de la facture PDF

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-008 |
| BDD ref | US-018.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Facture PDF de "CMD-2026-0042" générée et reçue par email

**Étapes**
1. Ouvrir le fichier PDF attaché à l'email
2. Vérifier chaque élément obligatoire

**Résultat attendu**
- Logo Company-Test présent
- Numéro de facture unique présent
- Date d'émission présente
- Numéro de commande "CMD-2026-0042" présent
- Numéro de BC client "BC-2026-00145" présent
- Coordonnées Company-Test (SIRET, adresse, TVA intracommunautaire) présentes
- Coordonnées du client (raison sociale, adresse facturation) présentes
- Lignes produit avec désignation, quantité, prix unitaire HT
- Total HT, TVA 20%, total TTC affichés

---

### TC-FEAT005-009 — Facture téléchargeable depuis l'espace commandes

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-009 |
| BDD ref | US-018.feature — Scénario 3 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté
- Commande "CMD-2026-0042" au statut "Terminée" avec facture générée

**Étapes**
1. Accéder au détail de "CMD-2026-0042" dans "Mes commandes"
2. Cliquer sur "Télécharger la facture PDF"

**Résultat attendu**
- Téléchargement du fichier PDF déclenché
- Nom du fichier : "facture_CMD-2026-0042.pdf"

---

### TC-FEAT005-010 — Idempotence génération facture (webhook rejoué)

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-010 |
| BDD ref | US-018.feature — Scénario 5 |
| Priorité | Haute |
| Type | Technique |
| Statut | À faire |

**Préconditions**
- Facture "FAC-2026-0042" déjà générée pour "CMD-2026-0042"

**Étapes**
1. Déclencher à nouveau le processus de génération (ex. webhook rejoué)
2. Vérifier la base de données et la boîte email

**Résultat attendu**
- Aucune nouvelle facture créée en base
- Aucun email supplémentaire envoyé au client

---

## US-012 — Historique des commandes acheteur B2B

### TC-FEAT005-011 — Accès et affichage de la liste des commandes

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-011 |
| BDD ref | US-012.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Acheteur B2B "thomas.mercier@client.fr" connecté
- Compte possède 5 commandes passées dans différents statuts

**Étapes**
1. Accéder à "Mon espace > Mes commandes"

**Résultat attendu**
- Seules les commandes du compte connecté sont affichées
- Chaque commande affiche : numéro, date, total TTC, statut
- Commandes triées par date décroissante

---

### TC-FEAT005-012 — Filtrage de l'historique par statut

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-012 |
| BDD ref | US-012.feature — Scénario 3 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté sur "Mes commandes"
- Historique contient des commandes à différents statuts

**Étapes**
1. Sélectionner le filtre "Statut = Expédiée"

**Résultat attendu**
- Seules les commandes au statut "Expédiée" sont affichées
- Les commandes à d'autres statuts ne sont plus visibles

---

### TC-FEAT005-013 — Isolation de l'historique entre clients B2B

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-013 |
| BDD ref | US-012.feature — Scénario 5 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Client "autre.client@entreprise.fr" possède la commande "CMD-2026-0099"
- Acheteur "thomas.mercier@client.fr" est connecté

**Étapes**
1. Accéder à "Mon espace > Mes commandes" avec le compte de "thomas.mercier@client.fr"

**Résultat attendu**
- La commande "CMD-2026-0099" n'apparaît pas dans l'historique
- Seules les commandes de "thomas.mercier@client.fr" sont visibles

---

### TC-FEAT005-014 — Accès au détail d'une commande depuis l'historique

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT005-014 |
| BDD ref | US-012.feature — Scénario 4 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté sur "Mes commandes"
- Commande "CMD-2026-0042" présente dans l'historique

**Étapes**
1. Cliquer sur "CMD-2026-0042" dans l'historique

**Résultat attendu**
- Redirection vers la page de détail de "CMD-2026-0042"
- Articles commandés, quantités, prix et statut actuel visibles

---

## Synthèse FEAT-005

| TC ID | US | Titre | Priorité | Type | Statut |
|-------|----|-------|----------|------|--------|
| TC-FEAT005-001 | US-016 | Paiement Visa 3D Secure réussi | Critique | Manuel+Behat | À faire |
| TC-FEAT005-002 | US-016 | Paiement Mastercard 3D Secure réussi | Critique | Manuel | À faire |
| TC-FEAT005-003 | US-016 | Carte déclinée | Critique | Manuel | À faire |
| TC-FEAT005-004 | US-016 | Annulation authentification 3DS | Haute | Manuel | À faire |
| TC-FEAT005-005 | US-016 | Idempotence webhook Stripe | Critique | Technique | À faire |
| TC-FEAT005-006 | US-016 | Fonds insuffisants | Haute | Manuel | À faire |
| TC-FEAT005-007 | US-018 | Génération et envoi facture PDF | Critique | Manuel | À faire |
| TC-FEAT005-008 | US-018 | Contenu obligatoire facture PDF | Critique | Manuel | À faire |
| TC-FEAT005-009 | US-018 | Facture téléchargeable espace client | Haute | Manuel | À faire |
| TC-FEAT005-010 | US-018 | Idempotence génération facture | Haute | Technique | À faire |
| TC-FEAT005-011 | US-012 | Accès et affichage historique commandes | Critique | Manuel+Behat | À faire |
| TC-FEAT005-012 | US-012 | Filtrage historique par statut | Haute | Manuel | À faire |
| TC-FEAT005-013 | US-012 | Isolation historique entre clients | Critique | Manuel | À faire |
| TC-FEAT005-014 | US-012 | Accès détail depuis historique | Haute | Manuel | À faire |

**Total : 14 cas de test — 8 Critique · 6 Haute**
