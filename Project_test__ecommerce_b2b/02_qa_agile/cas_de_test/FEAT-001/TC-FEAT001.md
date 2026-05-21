# Cas de Test — FEAT-001 Catalogue produits B2B

## Référence
| Champ | Valeur |
|-------|--------|
| Feature | FEAT-001 — Catalogue produits B2B |
| Sprint | Sprint 1 |
| US couvertes | US-001 · US-002 |
| Fichiers BDD | `bdd_gherkin/US-001.feature` · `bdd_gherkin/US-002.feature` |
| Rédacteur | QA Agile |
| Date | 2026-05-20 |

---

## US-001 — Navigation catalogue par catégorie

### TC-FEAT001-001 — Navigation vers catégorie Câbles FTTH

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT001-001 |
| BDD ref | US-001.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté (compte Actif)
- Catalogue contient ≥ 1 produit "Câbles FTTH" et ≥ 1 produit "Boîtiers fibres"

**Étapes**
1. Accéder à la page Catalogue
2. Cliquer sur la catégorie "Câbles FTTH" dans le menu

**Résultat attendu**
- Seuls les produits de la catégorie "Câbles FTTH" sont affichés
- Le nombre de résultats est affiché (ex : "X produits")
- Aucun produit "Boîtiers fibres" n'est visible

---

### TC-FEAT001-002 — Navigation vers catégorie Boîtiers fibres

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT001-002 |
| BDD ref | US-001.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté (compte Actif)
- Catalogue contient ≥ 1 produit "Boîtiers fibres"

**Étapes**
1. Accéder à la page Catalogue
2. Cliquer sur la catégorie "Boîtiers fibres"

**Résultat attendu**
- Seuls les produits "Boîtiers fibres" sont affichés
- Le compteur de résultats est affiché

---

### TC-FEAT001-003 — Breadcrumb affiché et cliquable

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT001-003 |
| BDD ref | US-001.feature — Scénario 3 |
| Priorité | Haute |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté
- Se trouve dans la catégorie "Câbles FTTH"

**Étapes**
1. Vérifier l'affichage du fil d'Ariane
2. Vérifier que "Accueil > Catalogue > Câbles FTTH" est affiché
3. Cliquer sur "Catalogue" dans le fil d'Ariane

**Résultat attendu**
- Fil d'Ariane affiché : "Accueil > Catalogue > Câbles FTTH"
- Chaque niveau est un lien cliquable
- Clic sur "Catalogue" → redirection vers la page catalogue complète

---

### TC-FEAT001-004 — Catégorie vide sans produit

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT001-004 |
| BDD ref | US-001.feature — Scénario 4 |
| Priorité | Moyenne |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté
- Catégorie "Accessoires" existe sans aucun produit associé

**Étapes**
1. Naviguer dans la catégorie "Accessoires"

**Résultat attendu**
- Message "Aucun produit disponible dans cette catégorie" affiché
- Fil d'Ariane reste visible
- Pas de message d'erreur technique

---

### TC-FEAT001-005 — Retour à la liste complète depuis une catégorie

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT001-005 |
| BDD ref | US-001.feature — Scénario 5 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté
- Se trouve dans la catégorie "Câbles FTTH"

**Étapes**
1. Cliquer sur "Catalogue" dans le fil d'Ariane

**Résultat attendu**
- Tous les produits des deux catégories sont visibles
- Le compteur total de résultats est mis à jour

---

## US-002 — Fiche produit complète + tarif B2B

### TC-FEAT001-006 — Fiche produit — acheteur B2B connecté voit le tarif

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT001-006 |
| BDD ref | US-002.feature — Scénario 1 |
| Priorité | Critique |
| Type | Manuel + Behat |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté (compte Actif)
- Produit "Câble FTTH 4FO G657A2" existe en catalogue avec tarif B2B renseigné

**Étapes**
1. Naviguer dans la catégorie "Câbles FTTH"
2. Cliquer sur la fiche du produit "Câble FTTH 4FO G657A2"

**Résultat attendu**
- Désignation produit visible
- Référence produit visible
- Tarif B2B HT affiché (ex : "12,50 € HT / m")
- Bouton "Ajouter au panier" visible et cliquable
- Lien "Télécharger la fiche technique" présent

---

### TC-FEAT001-007 — Prix masqué pour un visiteur non connecté

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT001-007 |
| BDD ref | US-002.feature — Scénario 2 |
| Priorité | Critique |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Visiteur non connecté (session anonyme)

**Étapes**
1. Accéder directement à une fiche produit du catalogue

**Résultat attendu**
- Produit visible (désignation, référence)
- Tarif B2B **non affiché** — remplacé par "Connectez-vous pour voir le tarif B2B"
- Bouton "Ajouter au panier" absent ou désactivé

---

### TC-FEAT001-008 — Ajout au panier depuis la fiche produit

| Champ | Détail |
|-------|--------|
| ID | TC-FEAT001-008 |
| BDD ref | US-002.feature — Scénario 3 |
| Priorité | Haute |
| Type | Manuel |
| Statut | À faire |

**Préconditions**
- Acheteur B2B connecté (compte Actif)
- Se trouve sur la fiche du produit "Câble FTTH 4FO G657A2"

**Étapes**
1. Saisir la quantité "10" dans le champ quantité
2. Cliquer sur "Ajouter au panier"

**Résultat attendu**
- Message de confirmation "Produit ajouté au panier" affiché
- Compteur du panier mis à jour (icône header)
- Produit présent dans le panier avec quantité = 10

---

## Synthèse FEAT-001

| TC ID | US | Titre | Priorité | Type | Statut |
|-------|----|-------|----------|------|--------|
| TC-FEAT001-001 | US-001 | Navigation catégorie Câbles FTTH | Critique | Manuel+Behat | À faire |
| TC-FEAT001-002 | US-001 | Navigation catégorie Boîtiers fibres | Critique | Manuel | À faire |
| TC-FEAT001-003 | US-001 | Breadcrumb affiché et cliquable | Haute | Manuel+Behat | À faire |
| TC-FEAT001-004 | US-001 | Catégorie vide | Moyenne | Manuel | À faire |
| TC-FEAT001-005 | US-001 | Retour liste complète | Haute | Manuel | À faire |
| TC-FEAT001-006 | US-002 | Fiche produit B2B connecté | Critique | Manuel+Behat | À faire |
| TC-FEAT001-007 | US-002 | Prix masqué non connecté | Critique | Manuel | À faire |
| TC-FEAT001-008 | US-002 | Ajout au panier | Haute | Manuel | À faire |

**Total : 8 cas de test — 3 Critique · 3 Haute · 1 Moyenne**
