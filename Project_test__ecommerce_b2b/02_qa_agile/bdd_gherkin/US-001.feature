# language: fr
Fonctionnalité: Navigation catalogue produits B2B par catégorie
  En tant qu'acheteur B2B
  Je veux naviguer dans le catalogue par catégorie
  Afin de trouver rapidement les produits correspondant à mon besoin

  Contexte:
    Étant donné que le catalogue contient des produits dans les catégories "Câbles FTTH" et "Boîtiers fibres"
    Et que je suis connecté en tant qu'acheteur B2B validé

  Scénario: Navigation vers la catégorie Câbles FTTH
    Quand je clique sur la catégorie "Câbles FTTH"
    Alors je vois uniquement les produits de la catégorie "Câbles FTTH"
    Et le nombre de résultats est affiché
    Et aucun produit "Boîtiers fibres" n'est visible

  Scénario: Navigation vers la catégorie Boîtiers fibres
    Quand je clique sur la catégorie "Boîtiers fibres"
    Alors je vois uniquement les produits de la catégorie "Boîtiers fibres"
    Et le nombre de résultats est affiché

  Scénario: Breadcrumb de navigation affiché et cliquable
    Quand je navigue dans la catégorie "Câbles FTTH"
    Alors le fil d'Ariane affiche "Accueil > Catalogue > Câbles FTTH"
    Et chaque niveau du fil d'Ariane est cliquable
    Quand je clique sur "Catalogue" dans le fil d'Ariane
    Alors je suis redirigé vers la page catalogue complète

  Scénario: Catalogue vide pour une catégorie sans produit
    Étant donné qu'une catégorie "Accessoires" existe sans produit associé
    Quand je navigue dans la catégorie "Accessoires"
    Alors le message "Aucun produit disponible dans cette catégorie" s'affiche
    Et le fil d'Ariane reste visible

  Scénario: Retour à la liste complète depuis une catégorie
    Étant donné que je suis dans la catégorie "Câbles FTTH"
    Quand je clique sur "Catalogue" dans le fil d'Ariane
    Alors je vois tous les produits des deux catégories
    Et le compteur total de résultats est mis à jour
