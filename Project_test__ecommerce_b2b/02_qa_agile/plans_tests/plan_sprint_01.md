# Plan de Tests — Sprint 1

## Scope
US-001 · US-002 · US-005 · US-006 · US-007

## Fichiers BDD Gherkin (traçabilité)

| US | Fichier feature | Scénarios |
|----|----------------|-----------|
| US-001 | `02_qa_agile/bdd_gherkin/US-001.feature` | 5 scénarios |
| US-002 | `02_qa_agile/bdd_gherkin/US-002.feature` | 3 scénarios |
| US-005 | `02_qa_agile/bdd_gherkin/US-005.feature` | 6 scénarios |
| US-006 | `02_qa_agile/bdd_gherkin/US-006.feature` | 6 scénarios |
| US-007 | `02_qa_agile/bdd_gherkin/US-007.feature` | 5 scénarios |

## Tests à réaliser

| US | Type | Scénario BDD | Méthode | Statut |
|----|------|-------------|---------|--------|
| US-001 | Acceptation | Navigation vers catégorie Câbles FTTH | Manuel + Behat | À faire |
| US-001 | Acceptation | Navigation vers catégorie Boîtiers fibres | Manuel | À faire |
| US-001 | Acceptation | Breadcrumb affiché et cliquable | Manuel + Behat | À faire |
| US-001 | Acceptation | Catalogue vide pour catégorie sans produit | Manuel | À faire |
| US-001 | Acceptation | Retour à la liste complète | Manuel | À faire |
| US-002 | Acceptation | Fiche produit — acheteur B2B connecté | Manuel + Behat | À faire |
| US-002 | Acceptation | Prix masqué — visiteur non connecté | Manuel | À faire |
| US-002 | Acceptation | Ajout au panier depuis la fiche | Manuel | À faire |
| US-005 | Acceptation | Création de compte réussie | Manuel + Behat | À faire |
| US-005 | Acceptation | SIRET invalide — pas 14 chiffres | Manuel | À faire |
| US-005 | Acceptation | SIRET invalide — contient des lettres | Manuel | À faire |
| US-005 | Acceptation | Email professionnel déjà enregistré | Manuel | À faire |
| US-005 | Acceptation | Champs obligatoires manquants | Manuel | À faire |
| US-005 | Acceptation | Mot de passe trop faible | Manuel | À faire |
| US-006 | Acceptation | Connexion réussie avec compte actif | Manuel + Behat | À faire |
| US-006 | Acceptation | Compte en attente de validation | Manuel | À faire |
| US-006 | Acceptation | Compte refusé | Manuel | À faire |
| US-006 | Acceptation | Identifiants incorrects | Manuel | À faire |
| US-006 | Acceptation | Blocage après 5 tentatives échouées | Manuel | À faire |
| US-006 | Acceptation | Déconnexion | Manuel | À faire |
| US-007 | Acceptation | Validation d'un compte B2B | Manuel + Behat | À faire |
| US-007 | Acceptation | Rejet avec motif | Manuel | À faire |
| US-007 | Acceptation | Rejet sans motif — bloqué | Manuel | À faire |
| US-007 | Acceptation | Notification email admin nouvelle demande | Manuel | À faire |
| US-007 | Acceptation | Badge compteur demandes en attente | Manuel | À faire |

**Total : 25 scénarios d'acceptation**

## Données de test requises

| Jeu de données | Détail |
|----------------|--------|
| Comptes B2B | 1 Actif · 1 En attente · 1 Refusé |
| Catalogue | ≥ 5 produits "Câbles FTTH" · ≥ 3 produits "Boîtiers fibres" |
| Admin | 1 compte administrateur Company-Test |
| Emails | Boîte de recette pour vérification emails transactionnels |

## Environnement
- Staging Drupal : URL à définir
- Branch : `feature/sprint-01`
- Outil BDD : Behat 3.x (scénarios Manuel + Behat automatisables en Iteration 2)

## Critères de sortie Sprint 1
- [ ] 100% des 25 scénarios Must Have passants
- [ ] 0 anomalie critique ou majeure ouverte
- [ ] Emails transactionnels vérifiés (confirmation compte, activation, rejet, notif admin)
- [ ] PO a validé la recette lors de la Sprint Review
