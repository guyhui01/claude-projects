# language: fr
Fonctionnalité: Ajout de produits au panier B2B
  En tant qu'acheteur B2B connecté
  Je veux ajouter des produits à mon panier
  Afin de préparer ma commande

  Contexte:
    Étant donné que je suis connecté en tant qu'acheteur B2B avec le rôle "b2b_buyer"
    Et que le catalogue contient le produit "Câble FTTH 4FO G657A2" au tarif HT de "12,50 €/m"

  Scénario: Ajout d'un produit au panier depuis la fiche produit
    Quand je navigue sur la fiche du produit "Câble FTTH 4FO G657A2"
    Et que je saisit la quantité "100"
    Et que je clique sur "Ajouter au panier"
    Alors le message "Produit ajouté au panier" s'affiche
    Et le compteur du panier dans le header affiche "1 article"
    Et le total HT du panier est "1 250,00 €"

  Scénario: Accès au panier bloqué pour un visiteur non connecté
    Étant donné que je suis un visiteur non connecté
    Quand je tente d'accéder à la page panier via "/cart"
    Alors je suis redirigé vers la page de connexion
    Et le message "Veuillez vous connecter pour accéder au panier" s'affiche

  Scénario: Contrôle d'accès CartAccessSubscriber — rôle non autorisé
    Étant donné que je suis connecté avec un compte utilisateur sans rôle "b2b_buyer"
    Quand je tente d'ajouter un produit au panier
    Alors l'accès est refusé avec le code HTTP 403
    Et le message "Accès réservé aux acheteurs B2B validés" s'affiche

  Scénario: Modification de la quantité dans le panier
    Étant donné que mon panier contient "Câble FTTH 4FO G657A2" avec une quantité de "50"
    Quand je modifie la quantité à "200"
    Et que je clique sur "Mettre à jour le panier"
    Alors la quantité affichée est "200"
    Et le total HT est recalculé à "2 500,00 €"

  Scénario: Suppression d'un article du panier
    Étant donné que mon panier contient "Câble FTTH 4FO G657A2" avec une quantité de "100"
    Quand je clique sur l'icône de suppression de cet article
    Alors l'article est retiré du panier
    Et le message "Votre panier est vide" s'affiche
    Et le compteur du header affiche "0 article"

  Scénario Plan: Ajout de plusieurs produits avec vérification du total HT
    Étant donné que mon panier est vide
    Quand j'ajoute le produit "<produit>" en quantité "<qté>"
    Alors le total HT partiel de cet article est "<total_HT>"

    Exemples:
      | produit                  | qté  | total_HT     |
      | Câble FTTH 4FO G657A2    | 100  | 1 250,00 €   |
      | Câble FTTH 8FO G657A1    | 50   | 875,00 €     |
      | Boîtier fibre 12 sorties | 10   | 450,00 €     |
