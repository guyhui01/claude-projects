# Cas de Test — FEAT-002 Gestion des comptes & accès B2B

## Référence
| Champ | Valeur |
|-------|--------|
| Feature | FEAT-002 — Gestion des comptes & accès B2B |
| Sprint | Sprint 1 |
| US couvertes | US-005 · US-006 · US-007 |
| Fichiers BDD | `bdd_gherkin/US-005.feature` · `bdd_gherkin/US-006.feature` · `bdd_gherkin/US-007.feature` |
| Rédacteur | QA Agile |
| Date | 2026-05-20 |

---

## US-005 — Création compte professionnel B2B

> **Descope Planning Poker 2026-05-20** : validation SIRET = regex 14 chiffres uniquement. API INSEE hors scope V1.

### TC-FEAT002-001 — Création de compte réussie

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-001 |
| BDD ref | US-005.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Page d'inscription B2B accessible
- Email "jean.dupont@dt.fr" non enregistré en base

**Étapes**
1. Accéder à la page d'inscription B2B
2. Renseigner : Raison sociale "Dupont Télécom SARL", SIRET "12345678901234", Prénom "Jean", Nom "Dupont", Email "jean.dupont@dt.fr", Téléphone "0612345678", Mot de passe "MonMotDePasse2026!"
3. Valider le formulaire

**Résultat attendu**
- Compte créé avec statut "En attente de validation"
- Email de confirmation envoyé à "jean.dupont@dt.fr" (vérifier boîte recette)
- Redirection vers page "Votre demande est en cours de traitement"

---

### TC-FEAT002-002 — SIRET invalide — pas 14 chiffres

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-002 |
| BDD ref | US-005.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Page d'inscription B2B accessible

**Étapes**
1. Accéder à la page d'inscription B2B
2. Saisir SIRET "1234567" (7 chiffres)
3. Tenter de valider le formulaire

**Résultat attendu**
- Message d'erreur "Le SIRET doit contenir exactement 14 chiffres" affiché sur le champ SIRET
- Soumission bloquée
- Aucun compte créé en base

---

### TC-FEAT002-003 — SIRET invalide — contient des lettres

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-003 |
| BDD ref | US-005.feature — Scénario 3 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Page d'inscription B2B accessible

**Étapes**
1. Saisir SIRET "1234567890ABCD"
2. Tenter de valider le formulaire

**Résultat attendu**
- Message d'erreur "Le SIRET doit contenir exactement 14 chiffres" affiché
- Soumission bloquée
- Aucun compte créé

---

### TC-FEAT002-004 — Email professionnel déjà enregistré

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-004 |
| BDD ref | US-005.feature — Scénario 4 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Un compte existe déjà avec l'email "jean.dupont@dt.fr"

**Étapes**
1. Accéder à la page d'inscription B2B
2. Saisir l'email "jean.dupont@dt.fr"
3. Renseigner les autres champs obligatoires valides
4. Valider le formulaire

**Résultat attendu**
- Message "Un compte existe déjà avec cet email" affiché
- Aucun nouveau compte créé

---

### TC-FEAT002-005 — Champ obligatoire manquant (Raison sociale)

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-005 |
| BDD ref | US-005.feature — Scénario 5 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Page d'inscription B2B accessible

**Étapes**
1. Laisser le champ "Raison sociale" vide
2. Renseigner tous les autres champs obligatoires
3. Valider le formulaire

**Résultat attendu**
- Message "Ce champ est obligatoire" affiché sur le champ Raison sociale
- Soumission bloquée

---

### TC-FEAT002-006 — Mot de passe trop faible

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-006 |
| BDD ref | US-005.feature — Scénario 6 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Page d'inscription B2B accessible

**Étapes**
1. Saisir le mot de passe "123456" (6 chiffres, pas de majuscule)
2. Observer le retour de validation (peut être inline ou à la soumission)

**Résultat attendu**
- Message "Le mot de passe doit contenir au moins 8 caractères, une majuscule et un chiffre" affiché
- Soumission bloquée

---

## US-006 — Connexion acheteur B2B

### TC-FEAT002-007 — Connexion réussie avec compte actif

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-007 |
| BDD ref | US-006.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Compte "actif@dupont.fr" existe avec statut Actif

**Étapes**
1. Accéder à la page de connexion
2. Saisir email "actif@dupont.fr" et mot de passe correct
3. Cliquer sur "Se connecter"

**Résultat attendu**
- Redirection vers le tableau de bord B2B
- Tarifs B2B visibles sur les fiches produits
- Nom de l'acheteur affiché dans le menu de navigation

---

### TC-FEAT002-008 — Connexion avec compte en attente

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-008 |
| BDD ref | US-006.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Compte "attente@dupont.fr" existe avec statut "En attente"

**Étapes**
1. Accéder à la page de connexion
2. Saisir email "attente@dupont.fr" et mot de passe correct
3. Cliquer sur "Se connecter"

**Résultat attendu**
- Message "Votre compte est en cours de validation (délai 24h)" affiché
- L'utilisateur n'est pas connecté
- Lien "Contacter Company-Test" proposé

---

### TC-FEAT002-009 — Connexion avec compte refusé

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-009 |
| BDD ref | US-006.feature — Scénario 3 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Compte "refuse@dupont.fr" existe avec statut "Refusé"

**Étapes**
1. Accéder à la page de connexion
2. Saisir email "refuse@dupont.fr" et mot de passe correct

**Résultat attendu**
- Message "Votre demande de compte a été refusée. Contactez-nous pour plus d'informations." affiché
- L'utilisateur n'est pas connecté

---

### TC-FEAT002-010 — Identifiants incorrects

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-010 |
| BDD ref | US-006.feature — Scénario 4 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Compte "actif@dupont.fr" existe avec statut Actif

**Étapes**
1. Accéder à la page de connexion
2. Saisir email "actif@dupont.fr" et un mot de passe **incorrect**
3. Cliquer sur "Se connecter"

**Résultat attendu**
- Message "Email ou mot de passe incorrect" affiché
- L'utilisateur n'est pas connecté
- Compteur de tentatives incrémenté (vérifiable en base ou log)

---

### TC-FEAT002-011 — Blocage après 5 tentatives échouées

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-011 |
| BDD ref | US-006.feature — Scénario 5 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Compte "actif@dupont.fr" a déjà 4 tentatives échouées enregistrées

**Étapes**
1. Accéder à la page de connexion
2. Saisir email "actif@dupont.fr" et un mot de passe incorrect (5e tentative)

**Résultat attendu**
- Message "Compte temporairement bloqué — réessayez dans 15 minutes" affiché
- Toute tentative de connexion bloquée pendant 15 minutes (vérifier avec une 6e tentative immédiate)

---

### TC-FEAT002-012 — Déconnexion

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-012 |
| BDD ref | US-006.feature — Scénario 6 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté (compte Actif)

**Étapes**
1. Cliquer sur "Se déconnecter" dans le menu de navigation

**Résultat attendu**
- Redirection vers la page d'accueil publique
- Tarifs B2B ne sont plus visibles
- Session utilisateur détruite (vérifier cookie/session)

---

## US-007 — Validation manuelle des comptes B2B (admin)

### TC-FEAT002-013 — Validation d'un compte B2B

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-013 |
| BDD ref | US-007.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Administrateur Company-Test connecté au back-office
- Demande de "jean@dupont.fr" (Dupont Télécom SARL, SIRET 12345678901234) en attente

**Étapes**
1. Accéder à la demande de "jean@dupont.fr" dans le back-office
2. Cliquer sur "Valider"

**Résultat attendu**
- Compte de "jean@dupont.fr" passe au statut "Actif"
- Email "Votre compte Company-Test est activé — vous pouvez vous connecter" envoyé à "jean@dupont.fr"
- La demande disparaît de la liste "En attente"

---

### TC-FEAT002-014 — Rejet d'un compte B2B avec motif

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-014 |
| BDD ref | US-007.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Administrateur Company-Test connecté au back-office
- Demande de "marc@martin.fr" (Martin Réseau SAS) en attente

**Étapes**
1. Accéder à la demande de "marc@martin.fr" dans le back-office
2. Cliquer sur "Rejeter"
3. Saisir le motif "Activité non éligible à notre catalogue B2B"
4. Confirmer le rejet

**Résultat attendu**
- Compte de "marc@martin.fr" passe au statut "Refusé"
- Email de refus contenant le motif "Activité non éligible à notre catalogue B2B" envoyé à "marc@martin.fr"

---

### TC-FEAT002-015 — Rejet sans motif — formulaire bloqué

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-015 |
| BDD ref | US-007.feature — Scénario 3 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Administrateur Company-Test connecté au back-office
- Une demande en attente existe

**Étapes**
1. Accéder à une demande en attente
2. Cliquer sur "Rejeter" sans saisir de motif
3. Tenter de confirmer le rejet

**Résultat attendu**
- Message "Veuillez indiquer un motif de refus" affiché
- Le rejet n'est pas enregistré
- La demande reste en statut "En attente"

---

### TC-FEAT002-016 — Notification email admin pour nouvelle demande

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-016 |
| BDD ref | US-007.feature — Scénario 4 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Administrateur Company-Test possède une boîte email de recette configurée
- Aucune demande en attente

**Étapes**
1. Un nouvel acheteur soumet une demande de compte B2B (via TC-FEAT002-001)
2. Vérifier la boîte email de l'administrateur Company-Test

**Résultat attendu**
- Email reçu avec :
  - Sujet : "Nouvelle demande de compte B2B Company-Test"
  - Raison sociale de l'acheteur présente dans le corps
  - SIRET présent dans le corps
  - Lien direct vers la demande dans le back-office
- La demande apparaît dans la liste "En attente" du back-office

---

### TC-FEAT002-017 — Badge compteur demandes en attente

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT002-017 |
| BDD ref | US-007.feature — Scénario 5 |
| Priorité | Moyenne |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Administrateur Company-Test connecté au back-office
- 3 demandes en attente de validation

**Étapes**
1. Accéder au back-office

**Résultat attendu**
- Badge "3" affiché sur le menu "Demandes en attente"
- Les demandes sont triées par date de soumission (plus ancienne en premier)

---

## Synthèse FEAT-002

| TC ID | US | Titre | Priorité | Type | Statut |
|-------|----|-------|----------|------|--------|
| TC-FEAT002-001 | US-005 | Création de compte réussie | Critique | Manuel+Behat | À faire |
| TC-FEAT002-002 | US-005 | SIRET invalide — pas 14 chiffres | Critique | Manuel | À faire |
| TC-FEAT002-003 | US-005 | SIRET invalide — lettres | Haute | Manuel | À faire |
| TC-FEAT002-004 | US-005 | Email déjà enregistré | Critique | Manuel | À faire |
| TC-FEAT002-005 | US-005 | Champ obligatoire manquant | Haute | Manuel | À faire |
| TC-FEAT002-006 | US-005 | Mot de passe trop faible | Haute | Manuel | À faire |
| TC-FEAT002-007 | US-006 | Connexion réussie | Critique | Manuel+Behat | À faire |
| TC-FEAT002-008 | US-006 | Compte en attente | Critique | Manuel | À faire |
| TC-FEAT002-009 | US-006 | Compte refusé | Haute | Manuel | À faire |
| TC-FEAT002-010 | US-006 | Identifiants incorrects | Critique | Manuel | À faire |
| TC-FEAT002-011 | US-006 | Blocage 5 tentatives | Haute | Manuel | À faire |
| TC-FEAT002-012 | US-006 | Déconnexion | Haute | Manuel | À faire |
| TC-FEAT002-013 | US-007 | Validation compte admin | Critique | Manuel+Behat | À faire |
| TC-FEAT002-014 | US-007 | Rejet avec motif | Critique | Manuel | À faire |
| TC-FEAT002-015 | US-007 | Rejet sans motif bloqué | Haute | Manuel | À faire |
| TC-FEAT002-016 | US-007 | Notification email admin | Haute | Manuel | À faire |
| TC-FEAT002-017 | US-007 | Badge compteur demandes | Moyenne | Manuel | À faire |

**Total : 17 cas de test — 7 Critique · 8 Haute · 2 Moyenne**
