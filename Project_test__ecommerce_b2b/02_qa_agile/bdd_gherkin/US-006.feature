# language: fr
Fonctionnalité: Connexion acheteur B2B
  En tant qu'acheteur B2B enregistré
  Je veux me connecter avec email et mot de passe
  Afin d'accéder à mon espace personnel et mes commandes

  Contexte:
    Étant donné que les comptes suivants existent :
      | Email               | Statut    |
      | actif@dupont.fr     | Actif     |
      | attente@dupont.fr   | En attente|
      | refuse@dupont.fr    | Refusé    |

  Scénario: Connexion réussie avec compte actif
    Étant donné que je suis sur la page de connexion
    Quand je saisis l'email "actif@dupont.fr" et le mot de passe correct
    Alors je suis redirigé vers mon tableau de bord B2B
    Et mes tarifs B2B sont visibles sur les fiches produits
    Et mon nom s'affiche dans le menu de navigation

  Scénario: Compte en attente de validation
    Étant donné que je suis sur la page de connexion
    Quand je saisis l'email "attente@dupont.fr" et le mot de passe correct
    Alors le message "Votre compte est en cours de validation (délai 24h)" s'affiche
    Et je ne suis pas connecté
    Et un lien "Contacter Company-Test" est proposé

  Scénario: Compte refusé
    Étant donné que je suis sur la page de connexion
    Quand je saisis l'email "refuse@dupont.fr" et le mot de passe correct
    Alors le message "Votre demande de compte a été refusée. Contactez-nous pour plus d'informations." s'affiche
    Et je ne suis pas connecté

  Scénario: Identifiants incorrects
    Étant donné que je suis sur la page de connexion
    Quand je saisis l'email "actif@dupont.fr" et un mot de passe incorrect
    Alors le message "Email ou mot de passe incorrect" s'affiche
    Et je ne suis pas connecté
    Et le compteur de tentatives s'incrémente

  Scénario: Blocage après 5 tentatives échouées
    Étant donné que j'ai échoué 4 fois consécutives à me connecter
    Quand je saisis à nouveau un mot de passe incorrect
    Alors le message "Compte temporairement bloqué — réessayez dans 15 minutes" s'affiche
    Et toute tentative de connexion est bloquée pendant 15 minutes

  Scénario: Déconnexion
    Étant donné que je suis connecté en tant qu'acheteur B2B
    Quand je clique sur "Se déconnecter"
    Alors je suis redirigé vers la page d'accueil publique
    Et les tarifs B2B ne sont plus visibles
