# Plan de Tests — Sprint 2

## Objectif
Valider les fonctionnalités du parcours d'achat B2B : ajout au panier avec contrôle d'accès, saisie obligatoire du numéro de bon de commande au checkout, envoi de l'email de confirmation de commande, dashboard back-office des commandes et workflow de mise à jour des statuts.

## Scope
US-009 · US-010 · US-011 · US-013 · US-014

## Fichiers BDD Gherkin (traçabilité)

| US | Fichier feature | Scénarios |
|----|----------------|-----------|
| US-009 | `02_qa_agile/bdd_gherkin/US-009.feature` | 6 scénarios |
| US-010 | `02_qa_agile/bdd_gherkin/US-010.feature` | 5 scénarios |
| US-011 | `02_qa_agile/bdd_gherkin/US-011.feature` | 5 scénarios |
| US-013 | `02_qa_agile/bdd_gherkin/US-013.feature` | 6 scénarios |
| US-014 | `02_qa_agile/bdd_gherkin/US-014.feature` | 6 scénarios |

## Tests à réaliser

| US | Type | Scénario BDD | Méthode | Statut |
|----|------|-------------|---------|--------|
| US-009 | Acceptation | Ajout produit au panier B2B connecté | Manuel + Behat | À faire |
| US-009 | Acceptation | Accès panier bloqué visiteur non connecté | Manuel | À faire |
| US-009 | Sécurité | CartAccessSubscriber — rôle non autorisé | Manuel | À faire |
| US-009 | Acceptation | Modification quantité panier | Manuel | À faire |
| US-009 | Acceptation | Suppression article du panier | Manuel | À faire |
| US-009 | Acceptation | Ajout plusieurs produits — total HT (Plan) | Manuel | À faire |
| US-010 | Acceptation | Checkout sans numéro BC — blocage | Manuel + Behat | À faire |
| US-010 | Acceptation | Checkout avec numéro BC valide | Manuel + Behat | À faire |
| US-010 | Acceptation | Pas de pré-remplissage BC session précédente | Manuel | À faire |
| US-010 | Acceptation | Validation formats numéro BC (Plan) | Manuel | À faire |
| US-010 | Acceptation | Numéro BC visible récapitulatif commande | Manuel | À faire |
| US-011 | Acceptation | Réception email confirmation | Manuel | À faire |
| US-011 | Acceptation | Contenu email confirmation — éléments obligatoires | Manuel | À faire |
| US-011 | Acceptation | Email non dupliqué en cas de double-clic | Manuel | À faire |
| US-011 | Acceptation | Copie email adresse facturation | Manuel | À faire |
| US-011 | Robustesse | Échec SendGrid — commande non bloquée | Manuel | À faire |
| US-013 | Acceptation | Accès dashboard — liste des commandes | Manuel + Behat | À faire |
| US-013 | Acceptation | Filtrage par statut (Plan) | Manuel | À faire |
| US-013 | Acceptation | Accès détail commande depuis liste | Manuel | À faire |
| US-013 | Acceptation | Recherche par numéro de commande | Manuel | À faire |
| US-013 | Sécurité | Accès dashboard refusé — acheteur B2B | Manuel | À faire |
| US-014 | Acceptation | Transition pending → processing + email | Manuel + Behat | À faire |
| US-014 | Acceptation | Transition processing → shipped + email | Manuel | À faire |
| US-014 | Acceptation | Transition shipped → completed + email | Manuel | À faire |
| US-014 | Acceptation | Transition invalide bloquée | Manuel | À faire |
| US-014 | Acceptation | Contenu emails selon statut (Plan) | Manuel | À faire |
| US-014 | Acceptation | Historique transitions dans détail commande | Manuel | À faire |

**Total : 27 scénarios d'acceptation et de sécurité**

## Données de test requises

| Jeu de données | Détail |
|----------------|--------|
| Comptes B2B | 1 compte `b2b_buyer` actif (thomas.mercier@client.fr) · 1 compte sans rôle `b2b_buyer` · 1 visiteur anonyme |
| Catalogue | ≥ 3 produits avec prix HT, poids et stock renseignés |
| Panier | Scenarios avec paniers à différentes quantités : 50, 100, 200 |
| Numéros BC | Jeux de valeurs : "BC-2026-00145", "PO/26/00145", "2026145", "" (vide) |
| Admin | 1 compte administrateur Company-Test (isabelle.royer@Company-Test.fr) avec rôle `Company-Test_admin` |
| Commandes | ≥ 5 commandes dans chaque statut : pending, processing, shipped, completed, cancelled |
| Emails | Boîtes de recette configurées pour : thomas.mercier@client.fr · isabelle.royer@Company-Test.fr |
| SendGrid | Stub/mock disponible pour simuler indisponibilité service |

## Environnement

- Staging Drupal : URL à définir (branch `feature/sprint-02`)
- Module Commerce 2.x avec `CartAccessSubscriber` actif
- Module `PurchaseOrderPane` activé et configuré
- Service SendGrid en mode sandbox/test
- Outil BDD : Behat 3.x
- Navigateurs : Chrome 124+ · Firefox 125+ (responsive desktop)

## Critères d'entrée Sprint 2

- [ ] Sprint 1 terminé avec 0 anomalie critique ou majeure ouverte
- [ ] Environnement de staging déployé avec la branche `feature/sprint-02`
- [ ] Données de test initialisées (comptes, catalogue, commandes)
- [ ] CartAccessSubscriber et PurchaseOrderPane déployés et configurés
- [ ] SendGrid sandbox configuré

## Critères de sortie Sprint 2

- [ ] 100% des 27 scénarios Must Have passants
- [ ] 0 anomalie critique ou majeure ouverte
- [ ] Emails transactionnels vérifiés (confirmation commande, notifications changement de statut)
- [ ] Contrôles d'accès panier et back-office validés (HTTP 403 testés)
- [ ] Export CSV fonctionnel (US-014 incluse dans le scope back-office)
- [ ] PO a validé la recette lors de la Sprint Review
