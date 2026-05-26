# language: fr
Fonctionnalité: Saisie du numéro de bon de commande obligatoire au checkout
  En tant qu'acheteur B2B connecté
  Je veux saisir mon numéro de bon de commande interne lors du checkout
  Afin d'assurer la traçabilité comptable de ma commande

  Contexte:
    Étant donné que je suis connecté en tant qu'acheteur B2B avec le rôle "b2b_buyer"
    Et que mon panier contient au moins un article
    Et que je suis à l'étape "Informations de commande" du checkout (PurchaseOrderPane)

  Scénario: Soumission du checkout sans numéro de bon de commande
    Quand je laisse le champ "Numéro de bon de commande" vide
    Et que je clique sur "Continuer vers le paiement"
    Alors un message d'erreur "Le numéro de bon de commande est obligatoire" s'affiche
    Et la progression vers l'étape suivante est bloquée
    Et aucune commande n'est créée en base

  Scénario: Soumission du checkout avec un numéro de bon de commande valide
    Quand je saisis "BC-2026-00145" dans le champ "Numéro de bon de commande"
    Et que je clique sur "Continuer vers le paiement"
    Alors je suis redirigé vers l'étape de paiement
    Et le numéro "BC-2026-00145" est bien associé à la commande en cours

  Scénario: Pré-remplissage du numéro de BC depuis la session précédente
    Étant donné que j'ai déjà saisi "BC-2026-00144" lors d'une commande précédente dans la session
    Quand j'atteins l'étape "Informations de commande" pour une nouvelle commande
    Alors le champ "Numéro de bon de commande" est vide
    Et aucune valeur de session précédente n'est pré-remplie

  Scénario Plan: Validation des formats de numéro de bon de commande
    Quand je saisis "<num_bc>" dans le champ "Numéro de bon de commande"
    Et que je clique sur "Continuer vers le paiement"
    Alors le résultat est "<resultat>"

    Exemples:
      | num_bc           | resultat                                         |
      | BC-2026-00145    | Passage à l'étape paiement autorisé              |
      | PO/26/00145      | Passage à l'étape paiement autorisé              |
      | 2026145          | Passage à l'étape paiement autorisé              |
      |                  | Erreur "Le numéro de bon de commande est obligatoire" |

  Scénario: Numéro de BC visible dans le récapitulatif de commande
    Étant donné que j'ai saisi "BC-2026-00145" lors du checkout
    Quand je valide ma commande
    Alors la page de confirmation de commande affiche "Réf. BC : BC-2026-00145"
    Et la commande en base contient le champ purchase_order_number = "BC-2026-00145"
