# language: fr
Fonctionnalité: Calcul automatique des frais de livraison Chronopost / Colissimo
  En tant qu'acheteur B2B connecté
  Je veux que les frais de livraison soient calculés automatiquement selon mon adresse et le poids de ma commande
  Afin de connaître le coût total avant de valider ma commande

  Contexte:
    Étant donné que je suis connecté en tant qu'acheteur B2B avec le rôle "b2b_buyer"
    Et que mon panier contient des articles

  Scénario: Calcul des frais Chronopost pour une livraison en France métropolitaine
    Étant donné que mon panier pèse "5 kg" au total
    Et que mon adresse de livraison est "75001 Paris"
    Quand je suis à l'étape de livraison du checkout
    Alors les frais de livraison Chronopost sont calculés et affichés
    Et le montant des frais correspond au tarif Chronopost pour 5 kg en France métropolitaine

  Scénario: Calcul des frais Colissimo pour une livraison légère
    Étant donné que mon panier pèse "0,5 kg" au total
    Et que mon adresse de livraison est "69001 Lyon"
    Quand je suis à l'étape de livraison du checkout
    Alors l'option Colissimo est proposée avec ses frais correspondants
    Et l'option Chronopost est également disponible avec ses frais

  Scénario Plan: Calcul des frais selon le poids et le code postal
    Étant donné que mon panier pèse "<poids>" et mon adresse est "<cp>"
    Quand j'atteins l'étape de livraison
    Alors le montant des frais proposé est cohérent avec la grille tarifaire du transporteur "<transporteur>"

    Exemples:
      | poids  | cp    | transporteur  |
      | 1 kg   | 75001 | Colissimo     |
      | 5 kg   | 75001 | Chronopost    |
      | 10 kg  | 13001 | Chronopost    |
      | 30 kg  | 33000 | Chronopost    |

  Scénario: Frais de livraison inclus dans le récapitulatif de commande
    Étant donné que les frais de livraison sont calculés à "12,50 €"
    Quand je consulte le récapitulatif de commande
    Alors les frais de livraison sont affichés séparément sur la ligne "Livraison : 12,50 €"
    Et le total TTC inclut les frais de livraison

  Scénario: Absence de calcul si l'adresse de livraison est incomplète
    Étant donné que mon adresse de livraison ne contient pas de code postal
    Quand j'atteins l'étape de livraison du checkout
    Alors un message "Veuillez renseigner une adresse de livraison complète pour calculer les frais" s'affiche
    Et le bouton "Continuer vers le paiement" est désactivé
