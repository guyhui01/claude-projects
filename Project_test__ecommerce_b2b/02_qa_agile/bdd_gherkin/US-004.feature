# language: fr
Fonctionnalité: Téléchargement de la fiche technique PDF produit
  En tant que visiteur ou acheteur B2B
  Je veux télécharger la fiche technique PDF d'un produit
  Afin de consulter les caractéristiques techniques détaillées avant de commander

  Contexte:
    Étant donné que le produit "Câble FTTH 4FO G657A2" possède une fiche technique PDF disponible

  Scénario: Téléchargement de la fiche technique par un visiteur anonyme
    Étant donné que je suis un visiteur non connecté
    Quand j'accède à la fiche du produit "Câble FTTH 4FO G657A2"
    Alors le lien "Télécharger la fiche technique" est visible
    Et le clic sur ce lien déclenche le téléchargement du fichier PDF
    Et le téléchargement ne nécessite pas de connexion

  Scénario: Téléchargement de la fiche technique par un acheteur B2B connecté
    Étant donné que je suis connecté en tant qu'acheteur B2B avec le rôle "b2b_buyer"
    Quand j'accède à la fiche du produit "Câble FTTH 4FO G657A2"
    Et que je clique sur "Télécharger la fiche technique"
    Alors le fichier PDF est téléchargé
    Et le nom du fichier est "fiche_technique_FTTH-4FO-G657A2.pdf"

  Scénario: Fiche technique absente — message approprié
    Étant donné que le produit "Boîtier test" n'a pas de fiche technique associée
    Quand j'accède à la fiche de ce produit
    Alors le lien "Télécharger la fiche technique" n'est pas affiché
    Et aucun lien mort ou erreur 404 n'est visible

  Scénario Plan: Disponibilité de la fiche technique selon le type de produit
    Étant donné que je consulte la fiche du produit "<produit>"
    Alors le lien de téléchargement "<disponibilite>"

    Exemples:
      | produit                  | disponibilite       |
      | Câble FTTH 4FO G657A2    | est affiché         |
      | Câble FTTH 8FO G657A1    | est affiché         |
      | Boîtier fibre 12 sorties | est affiché         |

  Scénario: Fichier PDF valide et lisible
    Quand je télécharge la fiche technique du produit "Câble FTTH 4FO G657A2"
    Alors le fichier est au format PDF valide (Content-Type: application/pdf)
    Et le fichier ne retourne pas une erreur HTTP (200 OK)
    Et la taille du fichier est supérieure à 0 octet
