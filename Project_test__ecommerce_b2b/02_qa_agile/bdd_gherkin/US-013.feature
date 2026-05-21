# language: fr
Fonctionnalité: Dashboard back-office commandes (admin Company-Test)
  En tant qu'administratrice Company-Test
  Je veux accéder à un tableau de bord listant toutes les commandes
  Afin de suivre l'activité commerciale et traiter les commandes en temps réel

  Contexte:
    Étant donné que je suis connectée en tant qu'administratrice Company-Test avec le rôle "Company-Test_admin"
    Et que la base de données contient des commandes dans différents statuts

  Scénario: Accès au dashboard et liste des commandes
    Quand j'accède au menu "Commerce > Commandes" du back-office
    Alors je vois la liste de toutes les commandes
    Et chaque ligne affiche : numéro de commande, client, date, total TTC, statut
    Et les commandes sont triées par date de création décroissante (plus récente en premier)

  Scénario: Filtrage des commandes par statut "En attente de paiement"
    Quand je sélectionne le filtre "Statut = En attente de paiement"
    Et que je clique sur "Appliquer"
    Alors seules les commandes au statut "En attente de paiement" sont affichées
    Et le compteur de résultats est mis à jour
    Et aucune commande d'un autre statut n'est visible

  Scénario Plan: Filtrage par chaque statut de commande disponible
    Quand je filtre les commandes par le statut "<statut>"
    Alors seules les commandes avec le statut "<statut>" sont affichées

    Exemples:
      | statut                    |
      | En attente de paiement    |
      | En cours de traitement    |
      | Expédiée                  |
      | Terminée                  |
      | Annulée                   |

  Scénario: Accès au détail d'une commande depuis la liste
    Étant donné que la liste des commandes est affichée
    Quand je clique sur le numéro de commande "CMD-2026-0042"
    Alors je suis redirigée vers la page de détail de la commande "CMD-2026-0042"
    Et je vois : client, adresse, articles, numéro BC client, total, statut actuel

  Scénario: Recherche par numéro de commande
    Quand je saisis "CMD-2026-0042" dans le champ de recherche
    Et que je clique sur "Rechercher"
    Alors la commande "CMD-2026-0042" apparaît seule dans les résultats

  Scénario: Accès dashboard refusé pour un acheteur B2B
    Étant donné que je suis connectée en tant qu'acheteur B2B avec le rôle "b2b_buyer"
    Quand j'essaie d'accéder à "/admin/commerce/orders"
    Alors l'accès est refusé avec le code HTTP 403
    Et je suis redirigée vers ma page d'accueil acheteur
