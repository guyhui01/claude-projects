# Plan de Tests — Sprint 4 + IP Sprint

## Objectif
Valider les fonctionnalités de livraison avancées (calcul automatique frais, numéro de suivi), les features avancées du catalogue (filtres avancés, tarifs négociés, adresses multiples), ainsi que les fonctionnalités de l'IP Sprint (fiche technique PDF, adresses multiples, emails d'accueil et d'accusé de réception).

## Scope

### Sprint 4
US-019 · US-021 · US-003 · US-008

### IP Sprint
US-004 · US-020 · US-022 · US-023

## Fichiers BDD Gherkin (traçabilité)

| US | Sprint | Fichier feature | Scénarios |
|----|--------|----------------|-----------|
| US-019 | Sprint 4 | `02_qa_agile/bdd_gherkin/US-019.feature` | 5 scénarios |
| US-021 | Sprint 4 | `02_qa_agile/bdd_gherkin/US-021.feature` | 5 scénarios |
| US-003 | Sprint 4 | `02_qa_agile/bdd_gherkin/US-003.feature` | 7 scénarios |
| US-008 | Sprint 4 | `02_qa_agile/bdd_gherkin/US-008.feature` | 6 scénarios |
| US-004 | IP Sprint | `02_qa_agile/bdd_gherkin/US-004.feature` | 5 scénarios |
| US-020 | IP Sprint | `02_qa_agile/bdd_gherkin/US-020.feature` | 6 scénarios |
| US-022 | IP Sprint | `02_qa_agile/bdd_gherkin/US-022.feature` | 5 scénarios |
| US-023 | IP Sprint | `02_qa_agile/bdd_gherkin/US-023.feature` | 5 scénarios |

## Tests à réaliser — Sprint 4

| US | Type | Scénario BDD | Méthode | Statut |
|----|------|-------------|---------|--------|
| US-019 | Acceptation | Calcul frais Chronopost — France métropolitaine 5 kg | Manuel + Behat | À faire |
| US-019 | Acceptation | Proposition Colissimo livraison légère 0,5 kg | Manuel | À faire |
| US-019 | Acceptation | Variation frais selon poids/CP (Scénario Plan) | Manuel | À faire |
| US-019 | Acceptation | Frais livraison dans récapitulatif commande | Manuel | À faire |
| US-019 | Acceptation | Absence calcul si adresse incomplète | Manuel | À faire |
| US-021 | Acceptation | Envoi numéro suivi lors passage statut "Expédiée" | Manuel + Behat | À faire |
| US-021 | Acceptation | Numéro suivi visible dans espace commandes | Manuel | À faire |
| US-021 | Acceptation | Mise à jour numéro de suivi | Manuel | À faire |
| US-021 | Acceptation | Expédition sans numéro suivi bloquée | Manuel | À faire |
| US-021 | Acceptation | Lien suivi selon transporteur (Chronopost/Colissimo) | Manuel | À faire |
| US-003 | Acceptation | Filtrage par référence produit exacte | Manuel + Behat | À faire |
| US-003 | Acceptation | Filtrage par type de fibre G657A1 | Manuel | À faire |
| US-003 | Acceptation | Filtrage par type de fibre G657A2 | Manuel | À faire |
| US-003 | Acceptation | Filtrage par conditionnement (Scénario Plan) | Manuel | À faire |
| US-003 | Acceptation | Combinaison filtres type de fibre + conditionnement | Manuel | À faire |
| US-003 | Acceptation | Réinitialisation des filtres | Manuel | À faire |
| US-003 | Acceptation | Filtre sans résultat — message approprié | Manuel | À faire |
| US-008 | Acceptation | Tarif négocié affiché pour le client concerné | Manuel + Behat | À faire |
| US-008 | Acceptation | Tarif standard affiché pour client sans négociation | Manuel | À faire |
| US-008 | Sécurité | Isolation tarifs entre deux clients B2B | Manuel | À faire |
| US-008 | Acceptation | Tarif négocié appliqué dans le panier | Manuel | À faire |
| US-008 | Acceptation | Tarifs négociés sur plusieurs produits (Scénario Plan) | Manuel | À faire |
| US-008 | Acceptation | Tarif négocié reflété sur commande et facture | Manuel | À faire |

**Total Sprint 4 : 23 scénarios**

## Tests à réaliser — IP Sprint

| US | Type | Scénario BDD | Méthode | Statut |
|----|------|-------------|---------|--------|
| US-004 | Acceptation | Téléchargement fiche technique visiteur anonyme | Manuel | À faire |
| US-004 | Acceptation | Téléchargement fiche technique acheteur B2B | Manuel | À faire |
| US-004 | Acceptation | Fiche technique absente — message approprié | Manuel | À faire |
| US-004 | Acceptation | Disponibilité fiche selon produit (Scénario Plan) | Manuel | À faire |
| US-004 | Acceptation | Fichier PDF valide et lisible | Manuel | À faire |
| US-020 | Acceptation | Ajout nouvelle adresse au carnet d'adresses | Manuel | À faire |
| US-020 | Acceptation | Sélection adresse existante au checkout | Manuel | À faire |
| US-020 | Acceptation | Modification adresse existante | Manuel | À faire |
| US-020 | Acceptation | Suppression adresse du carnet | Manuel | À faire |
| US-020 | Acceptation | Adresse par défaut pré-sélectionnée au checkout | Manuel | À faire |
| US-020 | Acceptation | Ajout nouvelle adresse directement au checkout | Manuel | À faire |
| US-022 | Acceptation | Réception accusé de réception après soumission | Manuel | À faire |
| US-022 | Acceptation | Contenu de l'email d'accusé de réception | Manuel | À faire |
| US-022 | Acceptation | Pas d'accusé si formulaire invalide | Manuel | À faire |
| US-022 | Acceptation | Un seul accusé en cas de double-soumission | Manuel | À faire |
| US-022 | Acceptation | Pas d'accusé si email déjà existant | Manuel | À faire |
| US-023 | Acceptation | Email bienvenue envoyé lors activation compte | Manuel | À faire |
| US-023 | Acceptation | Contenu obligatoire de l'email de bienvenue | Manuel | À faire |
| US-023 | Acceptation | Lien catalogue dans email bienvenue fonctionnel | Manuel | À faire |
| US-023 | Acceptation | Email bienvenue distinct de l'accusé de réception | Manuel | À faire |
| US-023 | Acceptation | Email bienvenue non renvoyé à la réactivation | Manuel | À faire |

**Total IP Sprint : 21 scénarios**

**Total global Sprint 4 + IP Sprint : 44 scénarios**

## Données de test requises

| Jeu de données | Détail |
|----------------|--------|
| Comptes B2B | thomas.mercier@client.fr (`b2b_buyer` actif, tarifs négociés configurés) · autre.client@entreprise.fr (tarifs standards) · nouveau.client@test.fr (pour tests création compte US-022/US-023) · 1 visiteur anonyme |
| Admin | isabelle.royer@Company-Test.fr (`Company-Test_admin`) |
| Catalogue | ≥ 5 produits avec : référence, type fibre (G657A1 / G657A2), conditionnement (Bobine 500m / 1000m / Touret 2000m), poids, fiche technique PDF associée |
| Tarifs négociés | Tarifs négociés configurés en back-office pour thomas.mercier@client.fr sur les 3 produits du Scénario Plan |
| Paniers | Paniers avec poids variés : 0,5 kg, 1 kg, 5 kg, 10 kg, 30 kg |
| Adresses livraison | CP de test : 75001 Paris, 69001 Lyon, 13001 Marseille, 33000 Bordeaux |
| Transporteurs | API Chronopost et Colissimo configurées en mode test · Grilles tarifaires disponibles |
| Commandes | ≥ 2 commandes au statut "En cours de traitement" pour US-021 |
| Fiches techniques PDF | Fichiers PDF valides associés aux produits du catalogue |
| Emails | Boîtes de recette configurées pour tous les destinataires concernés |
| SendGrid | Mode sandbox/test actif |

## Environnement

- Staging Drupal : URL à définir (branch `feature/sprint-04`)
- APIs Chronopost et Colissimo configurées en mode sandbox
- Module carnet d'adresses Drupal Commerce activé
- Module filtres catalogue avancés déployé
- Module tarifs négociés par client configuré
- Module fiche technique PDF (attachement) activé
- SendGrid en mode sandbox
- Outil BDD : Behat 3.x
- Navigateurs : Chrome 124+ · Firefox 125+

## Critères d'entrée Sprint 4 + IP Sprint

- [ ] Sprint 3 terminé avec 0 anomalie critique ou majeure ouverte
- [ ] Environnement de staging déployé avec la branche `feature/sprint-04`
- [ ] APIs transporteurs (Chronopost, Colissimo) configurées en mode test
- [ ] Tarifs négociés configurés en back-office pour les comptes de test
- [ ] Fiches techniques PDF attachées aux produits de test
- [ ] Données de test complètes (comptes, paniers, commandes, adresses)

## Critères de sortie Sprint 4 + IP Sprint

- [ ] 100% des 44 scénarios Must Have passants
- [ ] 0 anomalie critique ou majeure ouverte
- [ ] Calcul frais de livraison validé sur 4 combinaisons poids/CP (Scénario Plan US-019)
- [ ] Numéro de suivi affiché côté client et en email
- [ ] Filtres catalogue opérationnels (référence, type fibre, conditionnement, combinaison)
- [ ] Isolation des tarifs négociés vérifiée entre deux clients B2B
- [ ] Carnet d'adresses fonctionnel (ajout, modification, suppression, checkout)
- [ ] Emails transactionnels validés : accusé réception, bienvenue, numéro de suivi
- [ ] Fiche technique PDF accessible en anonyme et en connecté
- [ ] PO a validé la recette lors de la Sprint Review IP
- [ ] Rapport de tests IP Sprint transmis au PO et à l'équipe
