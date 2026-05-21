# language: fr
Fonctionnalité: Envoi du numéro de suivi transporteur au client
  En tant qu'acheteur B2B connecté
  Je veux recevoir le numéro de suivi de mon colis par email et le voir dans mon espace commandes
  Afin de suivre l'acheminement de ma livraison en temps réel

  Contexte:
    Étant donné que je suis connecté en tant qu'acheteur B2B "thomas.mercier@client.fr"
    Et que la commande "CMD-2026-0042" est au statut "En cours de traitement"

  Scénario: Envoi automatique du numéro de suivi lors du passage au statut "Expédiée"
    Étant donné que l'administratrice saisit le numéro de suivi "CP123456789FR"
    Quand elle clique sur "Marquer comme expédiée"
    Alors un email est envoyé à "thomas.mercier@client.fr"
    Et l'objet de l'email est "Votre commande CMD-2026-0042 a été expédiée"
    Et le corps de l'email contient le numéro de suivi "CP123456789FR"
    Et un lien de suivi vers le site du transporteur est présent dans l'email

  Scénario: Numéro de suivi visible dans l'espace commandes du client
    Étant donné que la commande "CMD-2026-0042" est au statut "Expédiée" avec le suivi "CP123456789FR"
    Quand je consulte le détail de la commande "CMD-2026-0042" dans "Mes commandes"
    Alors le numéro de suivi "CP123456789FR" est affiché
    Et un lien cliquable vers le site de suivi Chronopost est disponible

  Scénario: Mise à jour du numéro de suivi par l'admin
    Étant donné que la commande "CMD-2026-0042" a le numéro de suivi "CP123456789FR"
    Quand l'administratrice corrige le numéro de suivi à "CP987654321FR"
    Alors le numéro mis à jour "CP987654321FR" est visible dans l'espace client
    Et un email de mise à jour est envoyé à "thomas.mercier@client.fr"

  Scénario: Expédition sans numéro de suivi — champ obligatoire
    Étant donné que l'administratrice laisse le champ "Numéro de suivi" vide
    Quand elle tente de cliquer sur "Marquer comme expédiée"
    Alors un message d'erreur "Le numéro de suivi est obligatoire pour expédier la commande" s'affiche
    Et le statut de la commande n'est pas modifié

  Scénario Plan: Lien de suivi selon le transporteur
    Étant donné que la commande est expédiée avec le transporteur "<transporteur>"
    Alors le lien de suivi pointe vers le site "<url_suivi>"

    Exemples:
      | transporteur | url_suivi                                |
      | Chronopost   | https://www.chronopost.fr/tracking-no-cms |
      | Colissimo    | https://www.laposte.fr/outils/suivre-vos-envois |
