# Cas de Test — FEAT-007 Features avancées

## Référence
| Champ | Valeur |
|-------|--------|
| Feature | FEAT-007 — Features avancées |
| Sprint | Sprint 4 |
| US couvertes | US-003 · US-008 · US-020 |
| Fichiers BDD | `bdd_gherkin/US-003.feature` · `bdd_gherkin/US-008.feature` · `bdd_gherkin/US-020.feature` |
| Rédacteur | QA Agile |
| Date | 2026-05-20 |

---

## US-003 — Filtres catalogue avancés

### TC-FEAT007-001 — Filtrage par référence produit (recherche exacte)

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT007-001 |
| BDD ref | US-003.feature — Scénario 1 |
| Priorité | Haute |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté avec le rôle `b2b_buyer`
- Produit "FTTH-4FO-G657A2-500" présent en catalogue

**Étapes**
1. Accéder au catalogue
2. Saisir "FTTH-4FO-G657A2-500" dans le champ "Référence produit"
3. Cliquer sur "Appliquer les filtres"

**Résultat attendu**
- Seul le produit avec la référence exacte "FTTH-4FO-G657A2-500" est affiché
- Tous les autres produits ont disparu de la liste

---

### TC-FEAT007-002 — Filtrage par type de fibre G657A1

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT007-002 |
| BDD ref | US-003.feature — Scénario 2 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté
- Catalogue contient des produits G657A1 et G657A2

**Étapes**
1. Sélectionner "Type de fibre = G657A1"
2. Cliquer sur "Appliquer les filtres"

**Résultat attendu**
- Seuls les produits G657A1 sont affichés
- Aucun produit G657A2 visible

---

### TC-FEAT007-003 — Combinaison de filtres type de fibre + conditionnement

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT007-003 |
| BDD ref | US-003.feature — Scénario 5 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté
- Catalogue contient des produits avec diverses combinaisons type/conditionnement

**Étapes**
1. Sélectionner "Type de fibre = G657A2"
2. Sélectionner "Conditionnement = Bobine 500 m"
3. Cliquer sur "Appliquer les filtres"

**Résultat attendu**
- Seuls les produits répondant aux DEUX critères sont affichés
- Le compteur de résultats est mis à jour
- Un produit G657A2 en "Bobine 1000 m" n'est pas visible

---

### TC-FEAT007-004 — Réinitialisation des filtres

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT007-004 |
| BDD ref | US-003.feature — Scénario 6 |
| Priorité | Moyenne |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Filtres actifs sur le catalogue (ex. G657A2 + Bobine 500 m)

**Étapes**
1. Cliquer sur "Réinitialiser les filtres"

**Résultat attendu**
- Tous les produits du catalogue sont à nouveau affichés
- Tous les champs de filtre sont vides ou réinitialisés

---

---

## US-008 — Tarifs négociés spécifiques par client B2B

### TC-FEAT007-005 — Affichage du tarif négocié pour le client concerné

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT007-005 |
| BDD ref | US-008.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Produit "Câble FTTH 4FO G657A2" : tarif standard 12,50 €/m
- Compte "thomas.mercier@client.fr" : tarif négocié 10,00 €/m renseigné en back-office

**Étapes**
1. Se connecter en tant que "thomas.mercier@client.fr"
2. Consulter la fiche du produit "Câble FTTH 4FO G657A2"

**Résultat attendu**
- Tarif affiché = "10,00 € HT/m" (tarif négocié)
- Aucun tarif standard (12,50 €) visible

---

### TC-FEAT007-006 — Affichage du tarif standard pour un client sans tarif négocié

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT007-006 |
| BDD ref | US-008.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Compte "autre.client@entreprise.fr" sans tarif négocié

**Étapes**
1. Se connecter en tant que "autre.client@entreprise.fr"
2. Consulter la fiche du produit "Câble FTTH 4FO G657A2"

**Résultat attendu**
- Tarif affiché = "12,50 € HT/m" (tarif standard)

---

### TC-FEAT007-007 — Tarif négocié appliqué dans le panier

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT007-007 |
| BDD ref | US-008.feature — Scénario 4 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur "thomas.mercier@client.fr" connecté (tarif négocié : 10,00 €/m)

**Étapes**
1. Ajouter "100 m" de "Câble FTTH 4FO G657A2" au panier
2. Consulter le panier

**Résultat attendu**
- Total HT = 1 000,00 € (et non 1 250,00 € au tarif standard)
- Prix unitaire HT affiché = 10,00 €/m

---

---

## US-020 — Adresses de livraison multiples

### TC-FEAT007-008 — Ajout d'une nouvelle adresse au carnet d'adresses

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT007-008 |
| BDD ref | US-020.feature — Scénario 1 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B "thomas.mercier@client.fr" connecté

**Étapes**
1. Accéder à "Mon espace > Carnet d'adresses"
2. Cliquer sur "Ajouter une adresse"
3. Renseigner : Nom "Site Paris", Adresse "10 rue de la Paix", CP "75001", Ville "Paris", Pays "France"
4. Cliquer sur "Enregistrer"

**Résultat attendu**
- L'adresse "Site Paris — 10 rue de la Paix, 75001 Paris" apparaît dans le carnet
- Pas d'erreur système

---

### TC-FEAT007-009 — Sélection d'une adresse de livraison existante au checkout

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT007-009 |
| BDD ref | US-020.feature — Scénario 2 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Carnet d'adresses contient "Site Paris" et "Site Lyon"
- Acheteur à l'étape de livraison du checkout

**Étapes**
1. Vérifier que les deux adresses sont proposées
2. Sélectionner "Site Lyon"

**Résultat attendu**
- "Site Lyon" est utilisée comme adresse de livraison de la commande
- Les frais de livraison sont recalculés selon cette adresse

---

### TC-FEAT007-010 — Adresse par défaut pré-sélectionnée au checkout

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT007-010 |
| BDD ref | US-020.feature — Scénario 5 |
| Priorité | Moyenne |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- "Site Paris" définie comme adresse par défaut dans le carnet
- Acheteur accède à l'étape de livraison du checkout

**Étapes**
1. Accéder à l'étape "Livraison" du checkout

**Résultat attendu**
- "Site Paris" est pré-sélectionnée automatiquement
- L'acheteur peut choisir une autre adresse s'il le souhaite

---

## Synthèse FEAT-007

| TC ID | US | Titre | Priorité | Type | Statut |
|-------|----|-------|----------|------|--------|
| TC-FEAT007-001 | US-003 | Filtrage par référence produit | Haute | Manuel+Behat | À faire |
| TC-FEAT007-002 | US-003 | Filtrage par type de fibre G657A1 | Haute | Manuel | À faire |
| TC-FEAT007-003 | US-003 | Combinaison filtres type + conditionnement | Haute | Manuel | À faire |
| TC-FEAT007-004 | US-003 | Réinitialisation des filtres | Moyenne | Manuel | À faire |
| TC-FEAT007-005 | US-008 | Tarif négocié client concerné | Critique | Manuel+Behat | À faire |
| TC-FEAT007-006 | US-008 | Tarif standard client sans négociation | Critique | Manuel | À faire |
| TC-FEAT007-007 | US-008 | Tarif négocié appliqué dans le panier | Critique | Manuel | À faire |
| TC-FEAT007-008 | US-020 | Ajout adresse au carnet d'adresses | Haute | Manuel | À faire |
| TC-FEAT007-009 | US-020 | Sélection adresse existante au checkout | Haute | Manuel | À faire |
| TC-FEAT007-010 | US-020 | Adresse par défaut pré-sélectionnée | Moyenne | Manuel | À faire |

**Total : 10 cas de test — 3 Critique · 5 Haute · 2 Moyenne**
