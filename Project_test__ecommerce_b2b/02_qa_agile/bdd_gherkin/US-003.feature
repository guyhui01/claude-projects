# language: fr
Fonctionnalité: Filtres avancés du catalogue produits
  En tant qu'acheteur B2B connecté
  Je veux filtrer les produits du catalogue par référence, type de fibre et conditionnement
  Afin de trouver rapidement les produits correspondant exactement à mes besoins techniques

  Contexte:
    Étant donné que je suis connecté en tant qu'acheteur B2B avec le rôle "b2b_buyer"
    Et que le catalogue contient des produits de différents types de fibre et conditionnements

  Scénario: Filtrage par référence produit (recherche exacte)
    Quand je saisit "FTTH-4FO-G657A2-500" dans le champ "Référence produit"
    Et que je clique sur "Appliquer les filtres"
    Alors seul le produit avec la référence exacte "FTTH-4FO-G657A2-500" est affiché
    Et les autres produits ne sont plus visibles

  Scénario: Filtrage par type de fibre G657A1
    Quand je sélectionne le filtre "Type de fibre = G657A1"
    Et que je clique sur "Appliquer les filtres"
    Alors seuls les produits de type "G657A1" sont affichés
    Et aucun produit de type "G657A2" n'est visible

  Scénario: Filtrage par type de fibre G657A2
    Quand je sélectionne le filtre "Type de fibre = G657A2"
    Et que je clique sur "Appliquer les filtres"
    Alors seuls les produits de type "G657A2" sont affichés

  Scénario Plan: Filtrage par conditionnement
    Quand je sélectionne le filtre "Conditionnement = <conditionnement>"
    Et que je clique sur "Appliquer les filtres"
    Alors seuls les produits avec le conditionnement "<conditionnement>" sont affichés

    Exemples:
      | conditionnement |
      | Bobine 500 m    |
      | Bobine 1000 m   |
      | Touret 2000 m   |

  Scénario: Combinaison de filtres — type de fibre + conditionnement
    Quand je sélectionne "Type de fibre = G657A2" et "Conditionnement = Bobine 500 m"
    Et que je clique sur "Appliquer les filtres"
    Alors seuls les produits répondant aux DEUX critères sont affichés
    Et le compteur de résultats est mis à jour

  Scénario: Réinitialisation des filtres
    Étant donné que des filtres sont appliqués sur le catalogue
    Quand je clique sur "Réinitialiser les filtres"
    Alors tous les produits du catalogue sont à nouveau affichés
    Et tous les champs de filtre sont vides ou réinitialisés

  Scénario: Filtrage sans résultat — message approprié
    Quand je saisis "REF-INEXISTANTE-9999" dans le champ "Référence produit"
    Et que je clique sur "Appliquer les filtres"
    Alors le message "Aucun produit ne correspond à votre recherche" s'affiche
    Et aucun produit n'est visible dans la liste
