# language: fr
Fonctionnalité: Email de bienvenue et guide de démarrage B2B
  En tant que nouvel acheteur B2B dont le compte vient d'être activé
  Je veux recevoir un email de bienvenue avec un guide de démarrage
  Afin de pouvoir démarrer rapidement mes achats sur la plateforme Company-Test

  Contexte:
    Étant donné que le service SendGrid est opérationnel
    Et que l'administratrice Company-Test vient d'activer le compte de "thomas.mercier@client.fr"

  Scénario: Envoi automatique de l'email de bienvenue lors de l'activation du compte
    Quand le compte de "thomas.mercier@client.fr" passe au statut "Actif"
    Alors un email de bienvenue est envoyé à "thomas.mercier@client.fr"
    Et l'email est envoyé dans un délai de 2 minutes après l'activation

  Scénario: Contenu de l'email de bienvenue — éléments obligatoires
    Quand l'email de bienvenue est reçu par "thomas.mercier@client.fr"
    Alors l'objet de l'email est "Bienvenue sur Company-Test B2B — Votre compte est activé"
    Et le corps contient "Bonjour Thomas Mercier"
    Et le corps contient un lien direct vers le catalogue produits
    Et le corps contient un lien vers la page "Premiers pas sur Company-Test B2B"
    Et le corps contient les coordonnées du support commercial Company-Test

  Scénario: Lien catalogue dans l'email de bienvenue est fonctionnel
    Quand je clique sur le lien "Accéder au catalogue" dans l'email de bienvenue
    Alors je suis redirigé vers la page catalogue de la plateforme Company-Test B2B
    Et si je ne suis pas connecté, je suis d'abord redirigé vers la page de connexion

  Scénario: Email de bienvenue distinct de l'accusé de réception
    Étant donné que "thomas.mercier@client.fr" a reçu l'accusé de réception lors de sa demande
    Quand son compte est activé
    Alors un second email distinct est envoyé : l'email de bienvenue
    Et le total d'emails reçus par "thomas.mercier@client.fr" est 2 (accusé + bienvenue)

  Scénario: Email de bienvenue non renvoyé si le compte est désactivé puis réactivé (idempotence activation)
    Étant donné que "thomas.mercier@client.fr" a déjà reçu son email de bienvenue lors de la première activation
    Quand l'administratrice désactive puis réactive son compte
    Alors un nouvel email de bienvenue est envoyé uniquement lors de la première activation
    Et les réactivations ultérieures ne déclenchent pas de nouvel email de bienvenue
