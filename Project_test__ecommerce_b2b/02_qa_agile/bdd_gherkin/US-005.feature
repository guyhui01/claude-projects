# language: fr
Fonctionnalité: Création de compte professionnel B2B
  En tant que nouvel acheteur B2B
  Je veux créer un compte professionnel
  Afin d'accéder au catalogue et aux tarifs B2B

  # Descope Planning Poker 2026-05-20 :
  # Validation SIRET = regex 14 chiffres uniquement (API INSEE hors scope V1)

  Scénario: Création de compte réussie
    Étant donné que je suis sur la page d'inscription B2B
    Quand je renseigne les champs :
      | Champ          | Valeur               |
      | Raison sociale | Dupont Télécom SARL  |
      | SIRET          | 12345678901234       |
      | Prénom         | Jean                 |
      | Nom            | Dupont               |
      | Email          | jean.dupont@dt.fr    |
      | Téléphone      | 0612345678           |
      | Mot de passe   | MonMotDePasse2026!   |
    Et que je valide le formulaire
    Alors mon compte est créé avec le statut "En attente de validation"
    Et je reçois un email de confirmation à "jean.dupont@dt.fr"
    Et je suis redirigé vers une page "Votre demande est en cours de traitement"

  Scénario: SIRET invalide — pas 14 chiffres
    Étant donné que je suis sur la page d'inscription B2B
    Quand je saisis le SIRET "1234567"
    Et que je tente de valider le formulaire
    Alors un message d'erreur "Le SIRET doit contenir exactement 14 chiffres" s'affiche sur le champ SIRET
    Et la soumission du formulaire est bloquée
    Et aucun compte n'est créé

  Scénario: SIRET invalide — contient des lettres
    Étant donné que je suis sur la page d'inscription B2B
    Quand je saisis le SIRET "1234567890ABCD"
    Et que je tente de valider le formulaire
    Alors un message d'erreur "Le SIRET doit contenir exactement 14 chiffres" s'affiche
    Et la soumission est bloquée

  Scénario: Email professionnel déjà enregistré
    Étant donné qu'un compte existe déjà avec l'email "jean.dupont@dt.fr"
    Et que je suis sur la page d'inscription B2B
    Quand je saisis l'email "jean.dupont@dt.fr"
    Et que je valide le formulaire
    Alors le message "Un compte existe déjà avec cet email" s'affiche
    Et aucun nouveau compte n'est créé

  Scénario: Champs obligatoires manquants
    Étant donné que je suis sur la page d'inscription B2B
    Quand je valide le formulaire sans renseigner la raison sociale
    Alors un message d'erreur "Ce champ est obligatoire" s'affiche sur le champ Raison sociale
    Et la soumission est bloquée

  Scénario: Mot de passe trop faible
    Étant donné que je suis sur la page d'inscription B2B
    Quand je saisis le mot de passe "123456"
    Alors un message "Le mot de passe doit contenir au moins 8 caractères, une majuscule et un chiffre" s'affiche
    Et la soumission est bloquée
