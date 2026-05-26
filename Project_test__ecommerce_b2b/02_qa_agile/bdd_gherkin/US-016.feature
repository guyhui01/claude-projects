# language: fr
Fonctionnalité: Paiement CB 3D Secure via Stripe PaymentIntent
  En tant qu'acheteur B2B connecté
  Je veux payer ma commande par carte bancaire avec authentification 3D Secure
  Afin de finaliser mon achat de façon sécurisée

  Contexte:
    Étant donné que je suis connecté en tant qu'acheteur B2B avec le rôle "b2b_buyer"
    Et que mon panier contient des articles pour un total de "1 500,00 € TTC"
    Et que j'ai saisi mon numéro de bon de commande "BC-2026-00145"

  Scénario: Paiement Visa réussi avec authentification 3D Secure
    Étant donné que je suis à l'étape de paiement
    Quand je saisis la carte Visa de test "4000000000003220"
    Et que je complète l'authentification 3D Secure (confirmCardPayment)
    Alors le paiement est confirmé par Stripe
    Et la commande passe au statut "En cours de traitement"
    Et je suis redirigé vers la page de confirmation de commande

  Scénario: Paiement Mastercard réussi avec authentification 3D Secure
    Étant donné que je suis à l'étape de paiement
    Quand je saisis la carte Mastercard de test "5200828282828210"
    Et que je complète l'authentification 3D Secure
    Alors le paiement est confirmé par Stripe
    Et la commande passe au statut "En cours de traitement"

  Scénario: Paiement refusé — carte déclinée
    Étant donné que je suis à l'étape de paiement
    Quand je saisis la carte de test "4000000000000002" (carte déclinée)
    Alors Stripe retourne une erreur "card_declined"
    Et le message "Votre carte bancaire a été refusée. Veuillez vérifier vos coordonnées ou utiliser une autre carte." s'affiche
    Et la commande reste au statut "En attente de paiement"
    Et aucun débit n'est effectué

  Scénario: Annulation de l'authentification 3D Secure
    Étant donné que je suis à l'étape de paiement
    Quand je saisis la carte de test "4000000000003220"
    Et que j'annule l'authentification 3D Secure dans la fenêtre popup
    Alors le paiement est annulé
    Et le message "Authentification annulée. Veuillez réessayer." s'affiche
    Et la commande reste au statut "En attente de paiement"

  Scénario: Idempotence webhook Stripe — double traitement impossible
    Étant donné qu'un webhook Stripe "payment_intent.succeeded" est reçu pour la commande "CMD-2026-0042"
    Quand le même webhook est reçu une seconde fois (rejeu réseau)
    Alors la commande n'est pas traitée deux fois
    Et le statut reste "En cours de traitement" (pas de doublon)
    Et le second webhook retourne HTTP 200 sans effet de bord

  Scénario: Paiement avec fonds insuffisants
    Étant donné que je suis à l'étape de paiement
    Quand je saisis la carte de test "4000000000009995" (fonds insuffisants)
    Alors Stripe retourne une erreur "insufficient_funds"
    Et le message "Fonds insuffisants. Veuillez contacter votre banque ou utiliser une autre carte." s'affiche
