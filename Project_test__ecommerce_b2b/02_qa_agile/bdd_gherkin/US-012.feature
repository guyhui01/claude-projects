# language: fr
Fonctionnalité: Historique des commandes de l'acheteur B2B
  En tant qu'acheteur B2B connecté
  Je veux accéder à la liste de mes commandes passées
  Afin de suivre mes achats et retrouver facilement une commande

  Contexte:
    Étant donné que je suis connecté en tant qu'acheteur B2B "thomas.mercier@client.fr"
    Et que mon compte possède 5 commandes passées dans différents statuts

  Scénario: Accès à la liste de mes commandes
    Quand j'accède à "Mon espace > Mes commandes"
    Alors je vois uniquement les commandes passées par mon compte
    Et chaque commande affiche : numéro, date, total TTC, statut
    Et les commandes sont triées par date décroissante (la plus récente en premier)

  Scénario: Tri des commandes par date croissante
    Étant donné que je suis sur la page "Mes commandes"
    Quand je clique sur "Trier par date croissante"
    Alors les commandes sont réordonnées de la plus ancienne à la plus récente

  Scénario: Filtrage des commandes par statut
    Étant donné que je suis sur la page "Mes commandes"
    Quand je sélectionne le filtre "Statut = Expédiée"
    Alors seules mes commandes au statut "Expédiée" sont affichées
    Et les commandes avec d'autres statuts ne sont plus visibles

  Scénario: Accès au détail d'une commande depuis l'historique
    Étant donné que je suis sur la page "Mes commandes"
    Quand je clique sur le numéro de commande "CMD-2026-0042"
    Alors je suis redirigé vers la page de détail de la commande "CMD-2026-0042"
    Et je vois les articles commandés, les quantités, les prix et le statut actuel

  Scénario: Isolation des commandes entre clients B2B
    Étant donné que le client "autre.client@entreprise.fr" a passé une commande "CMD-2026-0099"
    Quand je consulte "Mes commandes" avec mon compte "thomas.mercier@client.fr"
    Alors la commande "CMD-2026-0099" n'apparaît pas dans ma liste
    Et je ne vois que mes propres commandes

  Scénario Plan: Affichage correct du statut dans l'historique
    Étant donné que j'ai une commande avec le statut "<statut_bd>"
    Quand j'accède à "Mes commandes"
    Alors cette commande affiche le libellé "<libelle_affiche>"

    Exemples:
      | statut_bd          | libelle_affiche            |
      | pending            | En attente de paiement     |
      | processing         | En cours de traitement     |
      | shipped            | Expédiée                   |
      | completed          | Terminée                   |
