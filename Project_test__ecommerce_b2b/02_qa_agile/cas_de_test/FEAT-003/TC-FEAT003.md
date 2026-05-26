# Cas de Test — FEAT-003 Panier & Commande

## Référence
| Champ | Valeur |
|-------|--------|
| Feature | FEAT-003 — Panier & Commande |
| Sprint | Sprint 2 |
| US couvertes | US-009 · US-010 · US-011 |
| Fichiers BDD | `bdd_gherkin/US-009.feature` · `bdd_gherkin/US-010.feature` · `bdd_gherkin/US-011.feature` |
| Rédacteur | QA Agile |
| Date | 2026-05-20 |

---

## US-009 — Ajout de produits au panier B2B

### TC-FEAT003-001 — Ajout d'un produit au panier par un acheteur B2B connecté

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-001 |
| BDD ref | US-009.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté avec le rôle `b2b_buyer`
- Produit "Câble FTTH 4FO G657A2" disponible en catalogue (tarif : 12,50 €/m)

**Étapes**
1. Naviguer sur la fiche du produit "Câble FTTH 4FO G657A2"
2. Saisir la quantité "100" dans le champ quantité
3. Cliquer sur "Ajouter au panier"

**Résultat attendu**
- Message "Produit ajouté au panier" affiché
- Compteur du panier dans le header affiche "1 article"
- Total HT du panier = 1 250,00 €

---

### TC-FEAT003-002 — Accès au panier bloqué pour un visiteur non connecté

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-002 |
| BDD ref | US-009.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Visiteur non connecté (session anonyme)

**Étapes**
1. Tenter d'accéder directement à la page "/cart"

**Résultat attendu**
- Redirection vers la page de connexion
- Message "Veuillez vous connecter pour accéder au panier" affiché
- Aucun panier créé en base

---

### TC-FEAT003-003 — Contrôle d'accès CartAccessSubscriber — rôle non autorisé

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-003 |
| BDD ref | US-009.feature — Scénario 3 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Utilisateur connecté sans rôle `b2b_buyer` (ex. compte enregistré non validé)

**Étapes**
1. Se connecter avec un compte sans rôle `b2b_buyer`
2. Tenter d'ajouter un produit au panier

**Résultat attendu**
- Réponse HTTP 403
- Message "Accès réservé aux acheteurs B2B validés" affiché
- Aucun article ajouté en base

---

### TC-FEAT003-004 — Modification de la quantité dans le panier

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-004 |
| BDD ref | US-009.feature — Scénario 4 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté avec le rôle `b2b_buyer`
- Panier contenant "Câble FTTH 4FO G657A2" en quantité 50

**Étapes**
1. Accéder au panier
2. Modifier la quantité de "50" à "200"
3. Cliquer sur "Mettre à jour le panier"

**Résultat attendu**
- Quantité affichée = 200
- Total HT recalculé = 2 500,00 €

---

### TC-FEAT003-005 — Suppression d'un article du panier

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-005 |
| BDD ref | US-009.feature — Scénario 5 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté avec le rôle `b2b_buyer`
- Panier contenant "Câble FTTH 4FO G657A2" en quantité 100

**Étapes**
1. Accéder au panier
2. Cliquer sur l'icône de suppression de l'article

**Résultat attendu**
- Article retiré du panier
- Message "Votre panier est vide" affiché
- Compteur du header affiche "0 article"

---

## US-010 — Saisie du numéro de bon de commande au checkout

### TC-FEAT003-006 — Soumission du checkout sans numéro de BC — blocage

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-006 |
| BDD ref | US-010.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté avec le rôle `b2b_buyer`
- Panier non vide
- À l'étape "Informations de commande" du checkout (PurchaseOrderPane)

**Étapes**
1. Laisser le champ "Numéro de bon de commande" vide
2. Cliquer sur "Continuer vers le paiement"

**Résultat attendu**
- Message d'erreur "Le numéro de bon de commande est obligatoire" affiché
- Progression vers l'étape suivante bloquée
- Aucune commande créée en base

---

### TC-FEAT003-007 — Soumission checkout avec numéro de BC valide

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-007 |
| BDD ref | US-010.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté avec le rôle `b2b_buyer`
- Panier non vide
- À l'étape "Informations de commande" du checkout

**Étapes**
1. Saisir "BC-2026-00145" dans le champ "Numéro de bon de commande"
2. Cliquer sur "Continuer vers le paiement"

**Résultat attendu**
- Redirection vers l'étape de paiement
- La valeur "BC-2026-00145" est bien stockée dans le champ `purchase_order_number` de la commande

---

### TC-FEAT003-008 — Numéro de BC visible dans le récapitulatif de commande

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-008 |
| BDD ref | US-010.feature — Scénario 5 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté
- A saisi "BC-2026-00145" lors du checkout

**Étapes**
1. Valider la commande jusqu'à la page de confirmation

**Résultat attendu**
- Page de confirmation affiche "Réf. BC : BC-2026-00145"
- La commande en base contient `purchase_order_number = "BC-2026-00145"`

---

### TC-FEAT003-009 — Validation des formats du numéro de BC (Scénario Plan)

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-009 |
| BDD ref | US-010.feature — Scénario Plan |
| Priorité | Moyenne |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté, à l'étape PurchaseOrderPane

**Étapes**
1. Saisir successivement les valeurs : "BC-2026-00145", "PO/26/00145", "2026145", ""
2. Tenter de valider le formulaire pour chaque valeur

**Résultat attendu**
- "BC-2026-00145" → passage autorisé
- "PO/26/00145" → passage autorisé
- "2026145" → passage autorisé
- "" (vide) → erreur "Le numéro de bon de commande est obligatoire"

---

## US-011 — Email de confirmation de commande via SendGrid

### TC-FEAT003-010 — Réception de l'email de confirmation après validation commande

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-010 |
| BDD ref | US-011.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Commande "CMD-2026-0042" validée par l'acheteur "thomas.mercier@client.fr"
- Service SendGrid opérationnel
- Boîte email de recette configurée

**Étapes**
1. Valider une commande en tant qu'acheteur B2B
2. Vérifier la boîte email de recette de "thomas.mercier@client.fr"

**Résultat attendu**
- Email reçu dans un délai de 2 minutes
- Objet : "Confirmation de votre commande Company-Test n° CMD-2026-0042"
- Expéditeur : adresse Company-Test configurée dans SendGrid

---

### TC-FEAT003-011 — Contenu de l'email de confirmation — éléments obligatoires

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-011 |
| BDD ref | US-011.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Email de confirmation de "CMD-2026-0042" reçu dans la boîte de recette

**Étapes**
1. Ouvrir l'email de confirmation reçu
2. Vérifier chaque élément obligatoire

**Résultat attendu**
- Numéro de commande "CMD-2026-0042" présent
- Numéro de BC "BC-2026-00145" présent
- Liste des articles avec quantités et prix HT
- Total HT, TVA (20%) et total TTC affichés
- Adresse de livraison présente
- Lien "Suivre ma commande" fonctionnel (HTTP 200)

---

### TC-FEAT003-012 — Email de confirmation non dupliqué en cas de double-clic

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-012 |
| BDD ref | US-011.feature — Scénario 3 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B à l'étape finale de validation de commande

**Étapes**
1. Cliquer deux fois rapidement sur "Valider la commande"
2. Vérifier la boîte email de "thomas.mercier@client.fr"
3. Vérifier la base de données (table `commerce_order`)

**Résultat attendu**
- Une seule commande créée en base
- Un seul email de confirmation reçu
- Pas de doublon de commande ni d'email

---

### TC-FEAT003-013 — Échec SendGrid — commande non bloquée

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT003-013 |
| BDD ref | US-011.feature — Scénario 5 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Service SendGrid simulé comme indisponible (stub / mock)
- Acheteur B2B à l'étape de validation commande

**Étapes**
1. Valider la commande avec SendGrid indisponible
2. Vérifier les logs Drupal

**Résultat attendu**
- Commande créée avec le statut "En attente de paiement" (non bloquée)
- Erreur d'envoi email journalisée dans les logs Drupal
- L'acheteur est redirigé vers la page de confirmation sans message d'erreur bloquant

---

## Synthèse FEAT-003

| TC ID | US | Titre | Priorité | Type | Statut |
|-------|----|-------|----------|------|--------|
| TC-FEAT003-001 | US-009 | Ajout produit au panier B2B | Critique | Manuel+Behat | À faire |
| TC-FEAT003-002 | US-009 | Accès panier bloqué visiteur | Critique | Manuel | À faire |
| TC-FEAT003-003 | US-009 | CartAccessSubscriber rôle non autorisé | Critique | Manuel | À faire |
| TC-FEAT003-004 | US-009 | Modification quantité panier | Haute | Manuel | À faire |
| TC-FEAT003-005 | US-009 | Suppression article panier | Haute | Manuel | À faire |
| TC-FEAT003-006 | US-010 | Checkout sans numéro BC — blocage | Critique | Manuel+Behat | À faire |
| TC-FEAT003-007 | US-010 | Checkout avec numéro BC valide | Critique | Manuel+Behat | À faire |
| TC-FEAT003-008 | US-010 | Numéro BC dans récapitulatif | Haute | Manuel | À faire |
| TC-FEAT003-009 | US-010 | Formats numéro BC (Scénario Plan) | Moyenne | Manuel | À faire |
| TC-FEAT003-010 | US-011 | Réception email confirmation | Critique | Manuel | À faire |
| TC-FEAT003-011 | US-011 | Contenu email confirmation | Critique | Manuel | À faire |
| TC-FEAT003-012 | US-011 | Email non dupliqué double-clic | Haute | Manuel | À faire |
| TC-FEAT003-013 | US-011 | Échec SendGrid — commande non bloquée | Haute | Manuel | À faire |

**Total : 13 cas de test — 7 Critique · 5 Haute · 1 Moyenne**
