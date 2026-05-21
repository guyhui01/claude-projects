# Cas de Test — FEAT-006 Livraisons

## Référence
| Champ | Valeur |
|-------|--------|
| Feature | FEAT-006 — Livraisons |
| Sprint | Sprint 4 |
| US couvertes | US-019 · US-021 |
| Fichiers BDD | `bdd_gherkin/US-019.feature` · `bdd_gherkin/US-021.feature` |
| Rédacteur | QA Agile |
| Date | 2026-05-20 |

---

## US-019 — Calcul automatique des frais de livraison Chronopost / Colissimo

### TC-FEAT006-001 — Calcul des frais Chronopost — France métropolitaine 5 kg

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT006-001 |
| BDD ref | US-019.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté avec le rôle `b2b_buyer`
- Panier pesant 5 kg au total
- Adresse de livraison : "75001 Paris" (France métropolitaine)

**Étapes**
1. Atteindre l'étape "Livraison" du checkout
2. Observer les frais proposés

**Résultat attendu**
- Frais de livraison Chronopost calculés et affichés
- Montant conforme à la grille tarifaire Chronopost pour 5 kg France métropolitaine

---

### TC-FEAT006-002 — Proposition Colissimo pour une livraison légère

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT006-002 |
| BDD ref | US-019.feature — Scénario 2 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Panier pesant 0,5 kg
- Adresse de livraison : "69001 Lyon"

**Étapes**
1. Atteindre l'étape "Livraison" du checkout

**Résultat attendu**
- Option Colissimo proposée avec ses frais
- Option Chronopost également disponible
- L'acheteur peut choisir son transporteur préféré

---

### TC-FEAT006-003 — Frais de livraison inclus dans le récapitulatif de commande

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT006-003 |
| BDD ref | US-019.feature — Scénario 4 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Frais de livraison calculés à 12,50 €
- Acheteur sur la page récapitulatif de commande

**Étapes**
1. Consulter le récapitulatif de commande avant de valider

**Résultat attendu**
- Ligne "Livraison : 12,50 €" affichée séparément
- Total TTC inclut les frais de livraison
- Aucune ligne cachée ou imprévue dans le récapitulatif

---

### TC-FEAT006-004 — Absence de calcul si adresse incomplète

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT006-004 |
| BDD ref | US-019.feature — Scénario 5 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur à l'étape "Livraison" du checkout
- Adresse de livraison sans code postal

**Étapes**
1. Tenter de passer à l'étape suivante sans code postal renseigné

**Résultat attendu**
- Message "Veuillez renseigner une adresse de livraison complète pour calculer les frais" affiché
- Bouton "Continuer vers le paiement" désactivé
- Aucun frais ne s'affiche

---

### TC-FEAT006-005 — Variation des frais selon le poids (Scénario Plan)

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT006-005 |
| BDD ref | US-019.feature — Scénario Plan |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté
- Différents paniers avec poids variés

**Étapes**
1. Créer un panier de 1 kg — adresse 75001 — vérifier les frais Colissimo
2. Créer un panier de 5 kg — adresse 75001 — vérifier les frais Chronopost
3. Créer un panier de 10 kg — adresse 13001 — vérifier les frais Chronopost
4. Créer un panier de 30 kg — adresse 33000 — vérifier les frais Chronopost

**Résultat attendu**
- Chaque combinaison poids/CP propose des frais cohérents avec la grille tarifaire du transporteur concerné
- Les frais augmentent proportionnellement avec le poids

---

## US-021 — Envoi du numéro de suivi transporteur au client

### TC-FEAT006-006 — Envoi automatique du numéro de suivi lors du passage au statut "Expédiée"

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT006-006 |
| BDD ref | US-021.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Administratrice Company-Test connectée
- Commande "CMD-2026-0042" au statut "En cours de traitement"
- Boîte email de recette de "thomas.mercier@client.fr" disponible

**Étapes**
1. Accéder au détail de "CMD-2026-0042"
2. Saisir le numéro de suivi "CP123456789FR"
3. Cliquer sur "Marquer comme expédiée"
4. Vérifier la boîte email de "thomas.mercier@client.fr"

**Résultat attendu**
- Email reçu par "thomas.mercier@client.fr"
- Objet : "Votre commande CMD-2026-0042 a été expédiée"
- Corps contient le numéro de suivi "CP123456789FR"
- Lien de suivi vers le site du transporteur présent

---

### TC-FEAT006-007 — Numéro de suivi visible dans l'espace commandes client

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT006-007 |
| BDD ref | US-021.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Commande "CMD-2026-0042" au statut "Expédiée" avec suivi "CP123456789FR"
- Acheteur "thomas.mercier@client.fr" connecté

**Étapes**
1. Accéder à "Mes commandes > CMD-2026-0042"

**Résultat attendu**
- Numéro de suivi "CP123456789FR" affiché
- Lien cliquable vers le site de suivi Chronopost présent
- Le lien s'ouvre dans un nouvel onglet

---

### TC-FEAT006-008 — Expédition sans numéro de suivi — champ obligatoire

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT006-008 |
| BDD ref | US-021.feature — Scénario 4 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Administratrice Company-Test connectée
- Commande "CMD-2026-0042" au statut "En cours de traitement"

**Étapes**
1. Accéder au détail de "CMD-2026-0042"
2. Laisser le champ "Numéro de suivi" vide
3. Cliquer sur "Marquer comme expédiée"

**Résultat attendu**
- Message "Le numéro de suivi est obligatoire pour expédier la commande" affiché
- Statut de la commande inchangé ("En cours de traitement")
- Aucun email envoyé au client

---

### TC-FEAT006-009 — Mise à jour du numéro de suivi

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT006-009 |
| BDD ref | US-021.feature — Scénario 3 |
| Priorité | Moyenne |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Commande "CMD-2026-0042" avec numéro de suivi "CP123456789FR"

**Étapes**
1. Accéder au détail de "CMD-2026-0042"
2. Modifier le numéro de suivi à "CP987654321FR"
3. Sauvegarder
4. Vérifier l'espace commandes du client et la boîte email

**Résultat attendu**
- Numéro mis à jour "CP987654321FR" visible dans l'espace client
- Email de mise à jour envoyé à "thomas.mercier@client.fr"

---

### TC-FEAT006-010 — Lien de suivi selon le transporteur (Chronopost vs Colissimo)

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT006-010 |
| BDD ref | US-021.feature — Scénario Plan |
| Priorité | Moyenne |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Commandes expédiées avec différents transporteurs

**Étapes**
1. Vérifier le lien de suivi pour une commande expédiée par Chronopost
2. Vérifier le lien de suivi pour une commande expédiée par Colissimo

**Résultat attendu**
- Chronopost → lien vers `https://www.chronopost.fr/tracking-no-cms`
- Colissimo → lien vers `https://www.laposte.fr/outils/suivre-vos-envois`
- Les deux liens sont fonctionnels (HTTP 200)

---

## Synthèse FEAT-006

| TC ID | US | Titre | Priorité | Type | Statut |
|-------|----|-------|----------|------|--------|
| TC-FEAT006-001 | US-019 | Frais Chronopost France 5 kg | Critique | Manuel+Behat | À faire |
| TC-FEAT006-002 | US-019 | Proposition Colissimo livraison légère | Haute | Manuel | À faire |
| TC-FEAT006-003 | US-019 | Frais dans récapitulatif commande | Critique | Manuel | À faire |
| TC-FEAT006-004 | US-019 | Absence calcul adresse incomplète | Haute | Manuel | À faire |
| TC-FEAT006-005 | US-019 | Variation frais selon poids (Plan) | Haute | Manuel | À faire |
| TC-FEAT006-006 | US-021 | Envoi numéro suivi lors expédition | Critique | Manuel+Behat | À faire |
| TC-FEAT006-007 | US-021 | Numéro suivi visible espace client | Critique | Manuel | À faire |
| TC-FEAT006-008 | US-021 | Expédition sans numéro suivi bloquée | Haute | Manuel | À faire |
| TC-FEAT006-009 | US-021 | Mise à jour numéro de suivi | Moyenne | Manuel | À faire |
| TC-FEAT006-010 | US-021 | Lien suivi selon transporteur | Moyenne | Manuel | À faire |

**Total : 10 cas de test — 4 Critique · 4 Haute · 2 Moyenne**
