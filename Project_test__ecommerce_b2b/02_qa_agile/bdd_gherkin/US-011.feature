# language: fr
Fonctionnalité: Email de confirmation de commande via SendGrid
  En tant qu'acheteur B2B connecté
  Je veux recevoir un email de confirmation après validation de ma commande
  Afin d'avoir une preuve d'achat et de pouvoir suivre mon dossier

  Contexte:
    Étant donné que je suis connecté en tant qu'acheteur B2B "thomas.mercier@client.fr"
    Et que j'ai validé une commande avec le numéro "CMD-2026-0042"
    Et que le service SendGrid est opérationnel (OrderConfirmationSubscriber actif)

  Scénario: Réception de l'email de confirmation après validation de commande
    Quand la commande "CMD-2026-0042" passe au statut "En attente de paiement"
    Alors un email est envoyé à "thomas.mercier@client.fr" via SendGrid
    Et l'objet de l'email est "Confirmation de votre commande Company-Test n° CMD-2026-0042"
    Et l'email est reçu dans un délai de 2 minutes

  Scénario: Contenu de l'email de confirmation — éléments obligatoires
    Quand l'email de confirmation de la commande "CMD-2026-0042" est reçu
    Alors le corps de l'email contient le numéro de commande "CMD-2026-0042"
    Et le corps contient le numéro de bon de commande du client "BC-2026-00145"
    Et le corps contient la liste des articles commandés avec quantités et prix HT
    Et le corps contient le total HT, la TVA (20%) et le total TTC
    Et le corps contient l'adresse de livraison
    Et un lien "Suivre ma commande" est présent et fonctionnel

  Scénario: Email non envoyé en double en cas de double-clic sur "Valider"
    Étant donné que l'acheteur clique deux fois rapidement sur "Valider la commande"
    Quand les deux requêtes sont traitées par le serveur
    Alors une seule commande est créée
    Et un seul email de confirmation est envoyé à "thomas.mercier@client.fr"

  Scénario: Email de confirmation avec copie à l'adresse email de facturation
    Étant donné que le compte de "thomas.mercier@client.fr" a une adresse de facturation "compta@client.fr"
    Quand la commande est validée
    Alors l'email de confirmation est envoyé en copie à "compta@client.fr"
    Et le destinataire principal reste "thomas.mercier@client.fr"

  Scénario: Échec envoi SendGrid — commande non bloquée
    Étant donné que le service SendGrid est indisponible (simulation)
    Quand l'acheteur valide sa commande
    Alors la commande est créée avec le statut "En attente de paiement"
    Et l'erreur d'envoi d'email est journalisée dans les logs Drupal
    Et l'acheteur est redirigé vers la page de confirmation sans message d'erreur bloquant
