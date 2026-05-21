# language: fr
Fonctionnalité: Tarifs négociés spécifiques par client B2B
  En tant qu'acheteur B2B connecté
  Je veux voir les tarifs négociés correspondant à mon compte
  Afin de commander aux prix convenus avec Company-Test lors de la négociation commerciale

  Contexte:
    Étant donné que le produit "Câble FTTH 4FO G657A2" a un tarif standard de "12,50 € HT/m"
    Et que le compte "thomas.mercier@client.fr" bénéficie d'un tarif négocié de "10,00 € HT/m" pour ce produit
    Et que le compte "autre.client@entreprise.fr" bénéficie d'un tarif standard non négocié

  Scénario: Affichage du tarif négocié pour le client concerné
    Étant donné que je suis connecté en tant que "thomas.mercier@client.fr"
    Quand je consulte la fiche du produit "Câble FTTH 4FO G657A2"
    Alors le tarif affiché est "10,00 € HT/m" (tarif négocié)
    Et aucun tarif standard n'est visible

  Scénario: Affichage du tarif standard pour un client sans tarif négocié
    Étant donné que je suis connecté en tant que "autre.client@entreprise.fr"
    Quand je consulte la fiche du produit "Câble FTTH 4FO G657A2"
    Alors le tarif affiché est "12,50 € HT/m" (tarif standard)

  Scénario: Isolation des tarifs entre deux clients B2B
    Étant donné que "thomas.mercier@client.fr" est connecté
    Quand il consulte la fiche du produit "Câble FTTH 4FO G657A2"
    Alors il voit "10,00 € HT/m"
    Et "autre.client@entreprise.fr" connecté séparément voit "12,50 € HT/m"

  Scénario: Tarif négocié appliqué dans le panier
    Étant donné que je suis connecté en tant que "thomas.mercier@client.fr"
    Et que j'ajoute "100 m" de "Câble FTTH 4FO G657A2" au panier
    Quand je consulte mon panier
    Alors le total HT affiché est "1 000,00 €" (et non 1 250,00 € au tarif standard)

  Scénario Plan: Tarifs négociés sur plusieurs produits pour le même client
    Étant donné que je suis connecté en tant que "thomas.mercier@client.fr"
    Quand je consulte la fiche du produit "<produit>"
    Alors le tarif affiché est "<tarif_negocie>" HT

    Exemples:
      | produit                  | tarif_negocie |
      | Câble FTTH 4FO G657A2    | 10,00 €/m     |
      | Câble FTTH 8FO G657A1    | 15,00 €/m     |
      | Boîtier fibre 12 sorties | 38,00 €/u     |

  Scénario: Tarif négocié reflété sur la commande et la facture
    Étant donné que je suis connecté en tant que "thomas.mercier@client.fr"
    Quand je passe une commande incluant "Câble FTTH 4FO G657A2" en quantité "100"
    Alors la commande enregistre le prix unitaire "10,00 € HT/m"
    Et la facture PDF générée indique bien "10,00 € HT/m" pour ce produit
