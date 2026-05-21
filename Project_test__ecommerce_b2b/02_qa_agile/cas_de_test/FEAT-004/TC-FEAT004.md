# Cas de Test — FEAT-004 Back-office Commandes

## Référence
| Champ | Valeur |
|-------|--------|
| Feature | FEAT-004 — Back-office Commandes |
| Sprint | Sprint 2 |
| US couvertes | US-013 · US-014 · US-015 |
| Fichiers BDD | `bdd_gherkin/US-013.feature` · `bdd_gherkin/US-014.feature` · `bdd_gherkin/US-015.feature` |
| Rédacteur | QA Agile |
| Date | 2026-05-20 |

---

## US-013 — Dashboard back-office commandes

### TC-FEAT004-001 — Accès au dashboard et affichage de la liste des commandes

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-001 |
| BDD ref | US-013.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Administratrice Company-Test connectée avec le rôle `Company-Test_admin`
- Base de données contient ≥ 3 commandes dans différents statuts

**Étapes**
1. Accéder au menu "Commerce > Commandes" du back-office

**Résultat attendu**
- Liste des commandes affichée
- Chaque ligne contient : numéro de commande, client, date, total TTC, statut
- Commandes triées par date décroissante (plus récente en premier)

---

### TC-FEAT004-002 — Filtrage des commandes par statut

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-002 |
| BDD ref | US-013.feature — Scénario 2 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Administratrice Company-Test connectée
- Base contient des commandes à différents statuts dont "En attente de paiement"

**Étapes**
1. Accéder à "Commerce > Commandes"
2. Sélectionner le filtre "Statut = En attente de paiement"
3. Cliquer sur "Appliquer"

**Résultat attendu**
- Seules les commandes "En attente de paiement" sont affichées
- Compteur de résultats mis à jour
- Aucune commande d'un autre statut visible

---

### TC-FEAT004-003 — Accès au détail d'une commande depuis la liste

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-003 |
| BDD ref | US-013.feature — Scénario 4 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Administratrice Company-Test connectée
- Commande "CMD-2026-0042" présente dans la liste

**Étapes**
1. Cliquer sur le numéro "CMD-2026-0042" dans la liste

**Résultat attendu**
- Redirection vers la page de détail de la commande "CMD-2026-0042"
- Page affiche : client, adresse de livraison, articles commandés, numéro BC client, total TTC, statut actuel

---

### TC-FEAT004-004 — Accès dashboard refusé pour un acheteur B2B

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-004 |
| BDD ref | US-013.feature — Scénario 6 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté avec le rôle `b2b_buyer`

**Étapes**
1. Tenter d'accéder à "/admin/commerce/orders"

**Résultat attendu**
- Réponse HTTP 403
- Redirection vers la page d'accueil de l'acheteur
- Aucune donnée de commande d'autres clients visible

---

## US-014 — Mise à jour statut commande + notification email client

### TC-FEAT004-005 — Transition pending → processing avec email client

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-005 |
| BDD ref | US-014.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Administratrice Company-Test connectée
- Commande "CMD-2026-0042" au statut "En attente de paiement"
- Boîte email de recette de "thomas.mercier@client.fr" disponible

**Étapes**
1. Accéder au détail de "CMD-2026-0042"
2. Cliquer sur "Passer en traitement"
3. Vérifier la boîte email de "thomas.mercier@client.fr"

**Résultat attendu**
- Statut de la commande = "En cours de traitement"
- Email envoyé à "thomas.mercier@client.fr"
- Objet de l'email : "Votre commande CMD-2026-0042 est en cours de traitement"

---

### TC-FEAT004-006 — Transition processing → shipped avec email client

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-006 |
| BDD ref | US-014.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Commande "CMD-2026-0042" au statut "En cours de traitement"

**Étapes**
1. Accéder au détail de "CMD-2026-0042"
2. Cliquer sur "Marquer comme expédiée"
3. Vérifier la boîte email de "thomas.mercier@client.fr"

**Résultat attendu**
- Statut de la commande = "Expédiée"
- Email envoyé à "thomas.mercier@client.fr" avec le statut "Expédiée"
- Lien vers l'espace commandes du client présent dans l'email

---

### TC-FEAT004-007 — Transition shipped → completed avec email client

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-007 |
| BDD ref | US-014.feature — Scénario 3 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Commande "CMD-2026-0042" au statut "Expédiée"

**Étapes**
1. Accéder au détail de "CMD-2026-0042"
2. Cliquer sur "Marquer comme terminée"

**Résultat attendu**
- Statut = "Terminée"
- Email reçu par "thomas.mercier@client.fr"
- Objet : "Votre commande CMD-2026-0042 a été livrée"

---

### TC-FEAT004-008 — Transition invalide — retour arrière non autorisé

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-008 |
| BDD ref | US-014.feature — Scénario 4 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Commande "CMD-2026-0042" au statut "Terminée"

**Étapes**
1. Tenter de repasser la commande au statut "En attente de paiement"

**Résultat attendu**
- Message "Cette transition de statut n'est pas autorisée" affiché
- Statut reste "Terminée"
- Aucun email envoyé au client

---

## US-015 — Export CSV commandes

### TC-FEAT004-009 — Export CSV toutes commandes sans filtre

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-009 |
| BDD ref | US-015.feature — Scénario 1 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Administratrice Company-Test connectée
- Base contient ≥ 5 commandes

**Étapes**
1. Accéder à "Commerce > Commandes > Exporter"
2. Cliquer sur "Exporter en CSV" sans filtre

**Résultat attendu**
- Fichier CSV téléchargé immédiatement
- Contient toutes les commandes existantes
- En-têtes : "Numéro commande", "Date", "Client", "Total HT", "Total TTC", "Statut", "N° BC client"

---

### TC-FEAT004-010 — Export CSV filtré par statut

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-010 |
| BDD ref | US-015.feature — Scénario 2 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Administratrice Company-Test connectée
- Base contient des commandes "Terminée" et d'autres statuts

**Étapes**
1. Sélectionner "Statut = Terminée"
2. Cliquer sur "Exporter en CSV"

**Résultat attendu**
- Le fichier CSV contient uniquement des commandes au statut "Terminée"
- Aucune commande d'un autre statut dans le fichier

---

### TC-FEAT004-011 — Export CSV avec filtre combiné date + statut

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-011 |
| BDD ref | US-015.feature — Scénario 4 |
| Priorité | Moyenne |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Administratrice Company-Test connectée
- Commandes présentes en mai 2026 avec statut "En cours de traitement"

**Étapes**
1. Renseigner date début "01/05/2026", date fin "20/05/2026"
2. Sélectionner "Statut = En cours de traitement"
3. Cliquer sur "Exporter en CSV"

**Résultat attendu**
- Le fichier CSV contient uniquement les commandes créées entre le 01/05/2026 et le 20/05/2026 avec le statut "En cours de traitement"

---

### TC-FEAT004-012 — Export CSV non accessible pour un acheteur B2B

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT004-012 |
| BDD ref | US-015.feature — Scénario 6 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté avec le rôle `b2b_buyer`

**Étapes**
1. Tenter d'accéder à la fonctionnalité d'export CSV commandes

**Résultat attendu**
- Accès refusé HTTP 403
- Aucun fichier CSV téléchargeable

---

## Synthèse FEAT-004

| TC ID | US | Titre | Priorité | Type | Statut |
|-------|----|-------|----------|------|--------|
| TC-FEAT004-001 | US-013 | Accès dashboard liste commandes | Critique | Manuel+Behat | À faire |
| TC-FEAT004-002 | US-013 | Filtrage par statut | Haute | Manuel | À faire |
| TC-FEAT004-003 | US-013 | Accès détail commande | Haute | Manuel | À faire |
| TC-FEAT004-004 | US-013 | Dashboard refusé acheteur B2B | Critique | Manuel | À faire |
| TC-FEAT004-005 | US-014 | Transition pending → processing + email | Critique | Manuel+Behat | À faire |
| TC-FEAT004-006 | US-014 | Transition processing → shipped + email | Critique | Manuel | À faire |
| TC-FEAT004-007 | US-014 | Transition shipped → completed + email | Haute | Manuel | À faire |
| TC-FEAT004-008 | US-014 | Transition invalide bloquée | Haute | Manuel | À faire |
| TC-FEAT004-009 | US-015 | Export CSV toutes commandes | Haute | Manuel | À faire |
| TC-FEAT004-010 | US-015 | Export CSV filtré par statut | Haute | Manuel | À faire |
| TC-FEAT004-011 | US-015 | Export CSV filtre combiné date + statut | Moyenne | Manuel | À faire |
| TC-FEAT004-012 | US-015 | Export CSV refusé acheteur B2B | Critique | Manuel | À faire |

**Total : 12 cas de test — 5 Critique · 6 Haute · 1 Moyenne**
