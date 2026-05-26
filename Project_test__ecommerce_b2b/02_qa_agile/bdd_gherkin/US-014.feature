# language: fr
Fonctionnalité: Mise à jour du statut de commande et notification email client
  En tant qu'administratrice Company-Test
  Je veux mettre à jour le statut d'une commande selon le workflow défini
  Afin d'informer l'acheteur de l'avancement de sa commande en temps réel

  Contexte:
    Étant donné que je suis connectée en tant qu'administratrice Company-Test avec le rôle "Company-Test_admin"
    Et que la commande "CMD-2026-0042" de "thomas.mercier@client.fr" existe au statut "En attente de paiement"

  Scénario: Transition de statut pending → processing
    Quand j'accède au détail de la commande "CMD-2026-0042"
    Et que je clique sur "Passer en traitement"
    Alors le statut de la commande passe à "En cours de traitement"
    Et un email est envoyé à "thomas.mercier@client.fr"
    Et l'objet de l'email est "Votre commande CMD-2026-0042 est en cours de traitement"

  Scénario: Transition de statut processing → shipped
    Étant donné que la commande "CMD-2026-0042" est au statut "En cours de traitement"
    Quand je clique sur "Marquer comme expédiée"
    Alors le statut de la commande passe à "Expédiée"
    Et un email de notification est envoyé à "thomas.mercier@client.fr"
    Et l'email contient le statut "Expédiée" et un lien vers l'espace commandes du client

  Scénario: Transition de statut shipped → completed
    Étant donné que la commande "CMD-2026-0042" est au statut "Expédiée"
    Quand je clique sur "Marquer comme terminée"
    Alors le statut de la commande passe à "Terminée"
    Et un email de confirmation de livraison est envoyé à "thomas.mercier@client.fr"
    Et l'objet de l'email est "Votre commande CMD-2026-0042 a été livrée"

  Scénario: Transition de statut invalide — retour arrière non autorisé
    Étant donné que la commande "CMD-2026-0042" est au statut "Terminée"
    Quand je tente de la repasser au statut "En attente de paiement"
    Alors un message d'erreur "Cette transition de statut n'est pas autorisée" s'affiche
    Et le statut de la commande reste "Terminée"
    Et aucun email n'est envoyé au client

  Scénario Plan: Contenu des emails de notification selon le statut
    Étant donné que la commande "CMD-2026-0042" change de statut vers "<nouveau_statut>"
    Alors l'email envoyé au client contient le texte "<contenu_attendu>"

    Exemples:
      | nouveau_statut             | contenu_attendu                                       |
      | En cours de traitement     | votre commande est en cours de préparation            |
      | Expédiée                   | votre commande a été expédiée                         |
      | Terminée                   | votre commande a bien été livrée                      |

  Scénario: Historique des transitions visible dans le détail commande
    Quand j'accède au détail de la commande "CMD-2026-0042"
    Alors l'historique des changements de statut est affiché avec date et heure
    Et l'administrateur ayant effectué chaque transition est identifié
