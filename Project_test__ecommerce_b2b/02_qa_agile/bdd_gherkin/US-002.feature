# language: fr
Fonctionnalité: Fiche produit B2B avec tarif
  En tant qu'acheteur B2B
  Je veux consulter la fiche produit complète
  Afin de prendre ma décision d'achat sans contacter un commercial

  Contexte:
    Étant donné que le produit "Câble FTTH 500m G657A2" existe dans le catalogue

  Scénario: Affichage fiche produit pour acheteur connecté
    Étant donné que je suis connecté en tant qu'acheteur B2B validé
    Quand j'accède à la fiche du produit "Câble FTTH 500m G657A2"
    Alors je vois la référence du produit
    Et je vois la description et les spécifications techniques
    Et je vois mon prix HT B2B
    Et je vois la disponibilité stock et le délai de livraison estimé
    Et le bouton "Ajouter au panier" est visible et actif

  Scénario: Prix masqué pour visiteur non connecté
    Étant donné que je ne suis pas connecté
    Quand j'accède à la fiche du produit "Câble FTTH 500m G657A2"
    Alors le prix est masqué
    Et le message "Connectez-vous pour voir vos tarifs" s'affiche
    Et le bouton "Ajouter au panier" n'est pas visible

  Scénario: Ajout au panier depuis la fiche produit
    Étant donné que je suis connecté en tant qu'acheteur B2B validé
    Et que le produit est en stock
    Quand je saisis la quantité "20" et clique sur "Ajouter au panier"
    Alors le produit apparaît dans mon panier avec la quantité 20
    Et un message de confirmation "Produit ajouté au panier" s'affiche
