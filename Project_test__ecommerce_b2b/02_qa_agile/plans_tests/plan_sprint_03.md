# Plan de Tests — Sprint 3

## Objectif
Valider le paiement par carte bancaire 3D Secure via Stripe, la génération et l'envoi automatique de factures PDF, l'historique des commandes de l'acheteur B2B, et l'export CSV des commandes pour l'administrateur.

## Scope
US-016 · US-018 · US-012 · US-015

## Fichiers BDD Gherkin (traçabilité)

| US | Fichier feature | Scénarios |
|----|----------------|-----------|
| US-016 | `02_qa_agile/bdd_gherkin/US-016.feature` | 6 scénarios |
| US-018 | `02_qa_agile/bdd_gherkin/US-018.feature` | 5 scénarios |
| US-012 | `02_qa_agile/bdd_gherkin/US-012.feature` | 6 scénarios |
| US-015 | `02_qa_agile/bdd_gherkin/US-015.feature` | 6 scénarios |

## Tests à réaliser

| US | Type | Scénario BDD | Méthode | Statut |
|----|------|-------------|---------|--------|
| US-016 | Acceptation | Paiement Visa 3D Secure réussi | Manuel + Behat | À faire |
| US-016 | Acceptation | Paiement Mastercard 3D Secure réussi | Manuel | À faire |
| US-016 | Acceptation | Carte déclinée — card_declined | Manuel | À faire |
| US-016 | Acceptation | Annulation authentification 3D Secure | Manuel | À faire |
| US-016 | Technique | Idempotence webhook Stripe | Manuel | À faire |
| US-016 | Acceptation | Fonds insuffisants | Manuel | À faire |
| US-018 | Acceptation | Génération et envoi automatique facture PDF | Manuel | À faire |
| US-018 | Acceptation | Contenu obligatoire facture PDF | Manuel | À faire |
| US-018 | Acceptation | Facture téléchargeable espace commandes | Manuel | À faire |
| US-018 | Acceptation | Numéro facture séquentiel et unique | Manuel | À faire |
| US-018 | Technique | Idempotence génération facture (webhook rejoué) | Manuel | À faire |
| US-012 | Acceptation | Accès et affichage liste mes commandes | Manuel + Behat | À faire |
| US-012 | Acceptation | Tri par date croissante | Manuel | À faire |
| US-012 | Acceptation | Filtrage par statut | Manuel | À faire |
| US-012 | Acceptation | Accès détail commande depuis historique | Manuel | À faire |
| US-012 | Sécurité | Isolation commandes entre clients B2B | Manuel | À faire |
| US-012 | Acceptation | Affichage libellé statut correct (Plan) | Manuel | À faire |
| US-015 | Acceptation | Export CSV toutes commandes sans filtre | Manuel | À faire |
| US-015 | Acceptation | Export CSV filtré par statut | Manuel | À faire |
| US-015 | Acceptation | Export CSV filtré par période de dates (Plan) | Manuel | À faire |
| US-015 | Acceptation | Export CSV filtre combiné date + statut | Manuel | À faire |
| US-015 | Acceptation | Export CSV vide si aucun résultat | Manuel | À faire |
| US-015 | Sécurité | Export CSV refusé acheteur B2B | Manuel | À faire |

**Total : 23 scénarios**

## Données de test requises

| Jeu de données | Détail |
|----------------|--------|
| Comptes B2B | 1 compte `b2b_buyer` actif (thomas.mercier@client.fr) · 1 compte `b2b_buyer` secondaire (autre.client@entreprise.fr) · 1 compte `Company-Test_admin` (isabelle.royer@Company-Test.fr) |
| Stripe | Clés API test Stripe configurées · Cartes de test : 4000000000003220 (Visa 3DS), 5200828282828210 (MC 3DS), 4000000000000002 (déclinée), 4000000000009995 (fonds insuffisants) |
| Webhook Stripe | Endpoint configuré · Outil de rejeu webhook disponible (Stripe CLI ou équivalent) |
| Commandes | ≥ 3 commandes payées par acheteur pour l'historique · Commandes avec statuts variés pour export CSV |
| Factures PDF | Module PDF configuré avec logo Company-Test · Séquence FAC-2026-xxxx initialisée |
| Emails | Boîtes de recette configurées pour thomas.mercier@client.fr · compta@client.fr (copie facturation) |
| SendGrid | Mode sandbox/test actif |
| Dates | Commandes créées sur plusieurs mois pour tester les filtres date export CSV |

## Environnement

- Staging Drupal : URL à définir (branch `feature/sprint-03`)
- Module Stripe Commerce 2.x avec PaymentIntent 3D Secure configuré
- Module génération PDF activé (ex. Drupal PDF API ou wkhtmltopdf)
- SendGrid en mode sandbox
- Webhook Stripe : endpoint `/commerce/stripe/webhook` configuré avec clé secrète
- Outil BDD : Behat 3.x
- Stripe CLI installé pour le rejeu de webhooks en test

## Critères d'entrée Sprint 3

- [ ] Sprint 2 terminé avec 0 anomalie critique ou majeure ouverte
- [ ] Environnement de staging déployé avec la branche `feature/sprint-03`
- [ ] Clés API Stripe test configurées dans Drupal
- [ ] Module PDF et SendGrid opérationnels en staging
- [ ] Jeux de données commandes initialisés pour l'historique et l'export CSV

## Critères de sortie Sprint 3

- [ ] 100% des 23 scénarios Must Have passants
- [ ] 0 anomalie critique ou majeure ouverte
- [ ] Paiement 3D Secure validé sur Visa et Mastercard
- [ ] Idempotence webhook Stripe démontrée (zéro doublon)
- [ ] Facture PDF conforme au contenu obligatoire (logo, numéros, TVA, lignes produit)
- [ ] Historique commandes isolé par client (test d'isolation réalisé)
- [ ] Export CSV fonctionnel avec tous les filtres testés
- [ ] PO a validé la recette lors de la Sprint Review
