# language: fr
Fonctionnalité: Export des commandes en CSV (admin Company-Test)
  En tant qu'administratrice Company-Test
  Je veux exporter la liste des commandes au format CSV
  Afin de réaliser des analyses et de transmettre les données à mon équipe comptable

  Contexte:
    Étant donné que je suis connectée en tant qu'administratrice Company-Test avec le rôle "Company-Test_admin"
    Et que la base contient des commandes sur plusieurs statuts et périodes

  Scénario: Export CSV de toutes les commandes sans filtre
    Quand j'accède à "Commerce > Commandes > Exporter"
    Et que je clique sur "Exporter en CSV" sans filtre
    Alors un fichier CSV est téléchargé immédiatement
    Et le fichier contient toutes les commandes existantes
    Et la première ligne contient les en-têtes : "Numéro commande", "Date", "Client", "Total HT", "Total TTC", "Statut", "N° BC client"

  Scénario: Export CSV filtré par statut "Terminée"
    Quand je sélectionne le filtre "Statut = Terminée"
    Et que je clique sur "Exporter en CSV"
    Alors le fichier CSV ne contient que les commandes au statut "Terminée"
    Et aucune commande d'un autre statut n'est présente dans le fichier

  Scénario Plan: Export CSV filtré par période de dates
    Quand je renseigne la date de début "<date_debut>" et la date de fin "<date_fin>"
    Et que je clique sur "Exporter en CSV"
    Alors le fichier CSV contient uniquement les commandes créées entre "<date_debut>" et "<date_fin>"

    Exemples:
      | date_debut  | date_fin    |
      | 01/04/2026  | 30/04/2026  |
      | 01/05/2026  | 20/05/2026  |

  Scénario: Export CSV avec filtre combiné date + statut
    Quand je renseigne la date de début "01/05/2026", la date de fin "20/05/2026"
    Et que je sélectionne le statut "En cours de traitement"
    Et que je clique sur "Exporter en CSV"
    Alors le fichier CSV contient uniquement les commandes correspondant aux deux critères

  Scénario: Export CSV vide quand aucun résultat ne correspond aux filtres
    Quand je filtre sur une période sans commande (ex. "01/01/2020" au "31/01/2020")
    Et que je clique sur "Exporter en CSV"
    Alors un fichier CSV contenant uniquement les en-têtes est téléchargé
    Et un message "Aucune commande ne correspond aux critères sélectionnés" s'affiche

  Scénario: Export CSV non accessible pour un acheteur B2B
    Étant donné que je suis connectée en tant qu'acheteur B2B avec le rôle "b2b_buyer"
    Quand je tente d'accéder à la fonctionnalité d'export CSV
    Alors l'accès est refusé avec le code HTTP 403
