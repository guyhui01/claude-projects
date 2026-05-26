# language: fr
Fonctionnalité: Génération et envoi de la facture PDF par email post-commande
  En tant qu'acheteur B2B connecté
  Je veux recevoir ma facture en PDF par email après validation de ma commande
  Afin de disposer d'un document comptable officiel pour mon service financier

  Contexte:
    Étant donné que la commande "CMD-2026-0042" de "thomas.mercier@client.fr" est au statut "Terminée"
    Et que le module de génération PDF est actif

  Scénario: Génération et envoi automatique de la facture après paiement confirmé
    Quand le paiement de la commande "CMD-2026-0042" est confirmé par Stripe
    Alors une facture PDF est générée automatiquement
    Et la facture est envoyée par email à "thomas.mercier@client.fr" via SendGrid
    Et l'objet de l'email est "Votre facture Company-Test — Commande CMD-2026-0042"

  Scénario: Contenu obligatoire de la facture PDF
    Quand je reçois la facture PDF de la commande "CMD-2026-0042"
    Alors la facture contient le logo Company-Test
    Et la facture contient le numéro de facture unique
    Et la facture contient la date d'émission
    Et la facture contient le numéro de commande "CMD-2026-0042"
    Et la facture contient le numéro de bon de commande client "BC-2026-00145"
    Et la facture contient les coordonnées d'Company-Test (SIRET, adresse, TVA intracommunautaire)
    Et la facture contient les coordonnées du client (raison sociale, adresse de facturation)
    Et la facture contient les lignes produit avec désignation, quantité, prix unitaire HT
    Et la facture contient le total HT, la TVA 20% et le total TTC

  Scénario: Facture téléchargeable depuis l'espace commandes du client
    Quand je suis connecté et que j'accède au détail de la commande "CMD-2026-0042"
    Alors un bouton "Télécharger la facture PDF" est affiché
    Et le clic sur ce bouton déclenche le téléchargement du fichier PDF
    Et le nom du fichier est "facture_CMD-2026-0042.pdf"

  Scénario: Numéro de facture séquentiel et unique
    Étant donné que la dernière facture émise est "FAC-2026-0041"
    Quand une nouvelle facture est générée pour "CMD-2026-0042"
    Alors le numéro de facture est "FAC-2026-0042"
    Et ce numéro est unique en base de données

  Scénario: Facture non régénérée en cas de second appel (idempotence)
    Étant donné qu'une facture "FAC-2026-0042" a déjà été générée pour "CMD-2026-0042"
    Quand le processus de génération est déclenché à nouveau (ex. webhook rejoué)
    Alors aucune nouvelle facture n'est créée
    Et aucun email supplémentaire n'est envoyé au client
