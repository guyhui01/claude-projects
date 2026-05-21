# language: fr
Fonctionnalité: Notification email de réception de demande de compte B2B
  En tant que nouvel acheteur B2B
  Je veux recevoir un accusé de réception par email immédiatement après ma demande de compte
  Afin d'être informé que ma demande a bien été prise en compte

  Contexte:
    Étant donné que le service SendGrid est opérationnel

  Scénario: Réception de l'accusé de réception après soumission du formulaire
    Étant donné que "thomas.mercier@client.fr" soumet une demande de compte B2B valide
    Quand la demande est enregistrée en base avec le statut "En attente de validation"
    Alors un email d'accusé de réception est envoyé immédiatement à "thomas.mercier@client.fr"
    Et l'email est reçu dans un délai de 2 minutes

  Scénario: Contenu de l'email d'accusé de réception
    Étant donné que "thomas.mercier@client.fr" a soumis une demande avec la raison sociale "Client Télécom SAS"
    Quand l'email d'accusé de réception est reçu
    Alors l'objet de l'email est "Company-Test B2B — Votre demande de compte a bien été reçue"
    Et le corps contient "Bonjour Thomas Mercier"
    Et le corps contient "Votre demande pour le compte Client Télécom SAS a bien été reçue"
    Et le corps contient "Délai de traitement estimé : 24 à 48 heures ouvrées"
    Et le corps contient un contact email ou téléphone pour le support Company-Test

  Scénario: Accusé de réception non envoyé si le formulaire est invalide
    Étant donné que "invalid@test.fr" soumet un formulaire avec un SIRET invalide
    Quand le formulaire est refusé côté serveur (validation échouée)
    Alors aucun email d'accusé de réception n'est envoyé à "invalid@test.fr"
    Et aucun compte n'est créé en base

  Scénario: Un seul email d'accusé envoyé même en cas de double-soumission
    Étant donné que "thomas.mercier@client.fr" clique deux fois sur "Soumettre ma demande"
    Quand les deux requêtes sont traitées
    Alors un seul compte est créé en base
    Et un seul email d'accusé de réception est envoyé à "thomas.mercier@client.fr"

  Scénario: Accusé de réception en cas d'email déjà existant
    Étant donné qu'un compte existe déjà pour "thomas.mercier@client.fr"
    Quand une nouvelle demande est soumise avec le même email
    Alors l'erreur "Un compte existe déjà avec cet email" s'affiche sur le formulaire
    Et aucun email d'accusé de réception n'est envoyé
