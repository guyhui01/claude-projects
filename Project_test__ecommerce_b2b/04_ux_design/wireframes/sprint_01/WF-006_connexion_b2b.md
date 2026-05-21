# Wireframe — WF-006 — Page Connexion B2B

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-006 — Connexion acheteur B2B
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État nominal (formulaire vide)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ HEADER simplifié                                                            │
│ [Logo Company-Test]                                       Pas encore de compte? │
│                                                      [ Créer un compte ]   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│                    ┌───────────────────────────────────┐                   │
│                    │                                   │                   │
│                    │   Connectez-vous à votre          │                   │
│                    │   espace B2B Company-Test              │                   │
│                    │   ─────────────────────           │                   │
│                    │                                   │                   │
│                    │   Email professionnel             │                   │
│                    │   ┌─────────────────────────────┐ │                   │
│                    │   │ prenom.nom@entreprise.fr    │ │                   │
│                    │   └─────────────────────────────┘ │                   │
│                    │                                   │                   │
│                    │   Mot de passe                    │                   │
│                    │   ┌─────────────────────────┬───┐ │                   │
│                    │   │ ••••••••••••••••        │👁 │ │                   │
│                    │   └─────────────────────────┴───┘ │                   │
│                    │                                   │                   │
│                    │   ☐ Se souvenir de moi            │                   │
│                    │                                   │                   │
│                    │   [ Se connecter ]                │                   │
│                    │                                   │                   │
│                    │   Mot de passe oublié ?           │                   │
│                    │                                   │                   │
│                    └───────────────────────────────────┘                   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 1 — Identifiants incorrects

```
┌───────────────────────────────────────┐
│   ┌───────────────────────────────┐   │
│   │ ⚠ Email ou mot de passe       │   │
│   │   incorrect.                  │   │
│   │   Tentatives restantes : 3/5  │   │
│   └───────────────────────────────┘   │
│                                       │
│   Email professionnel                 │
│   ┌─────────────────────────────────┐ │
│   │ jean.dupont@dt.fr          ❌   │ │
│   └─────────────────────────────────┘ │
│                                       │
│   Mot de passe                        │
│   ┌─────────────────────────────────┐ │
│   │ ••••••••                   ❌   │ │
│   └─────────────────────────────────┘ │
│                                       │
│   [ Se connecter ]                    │
└───────────────────────────────────────┘
```

### État 2 — Compte en attente de validation

```
┌───────────────────────────────────────┐
│   ┌───────────────────────────────┐   │
│   │  🕐 Votre compte est en cours │   │
│   │  de validation (délai 24h).   │   │
│   │                               │   │
│   │  Vous recevrez un email dès   │   │
│   │  que votre accès sera activé. │   │
│   │                               │   │
│   │  [ Contacter Company-Test ]        │   │
│   └───────────────────────────────┘   │
└───────────────────────────────────────┘
```

### État 3 — Compte refusé

```
┌───────────────────────────────────────┐
│   ┌───────────────────────────────┐   │
│   │  ❌ Votre demande de compte   │   │
│   │  a été refusée.               │   │
│   │                               │   │
│   │  Contactez-nous pour plus     │   │
│   │  d'informations.              │   │
│   │                               │   │
│   │  [ Contacter Company-Test ]        │   │
│   └───────────────────────────────┘   │
└───────────────────────────────────────┘
```

### État 4 — Compte bloqué (5 tentatives)

```
┌───────────────────────────────────────┐
│   ┌───────────────────────────────┐   │
│   │  🔒 Compte temporairement     │   │
│   │  bloqué.                      │   │
│   │                               │   │
│   │  Réessayez dans : 14:32       │   │
│   │  (compte à rebours)           │   │
│   │                               │   │
│   │  [ Mot de passe oublié ? ]    │   │
│   └───────────────────────────────┘   │
│                                       │
│   [ Se connecter ]  ← désactivé       │
└───────────────────────────────────────┘
```

---

## Mobile — 375px (état nominal)

```
┌───────────────────────┐
│ [Logo Company-Test]        │
├───────────────────────┤
│                       │
│ Connectez-vous        │
│ à votre espace B2B    │
│                       │
│ Email                 │
│ ┌───────────────────┐ │
│ │                   │ │
│ └───────────────────┘ │
│                       │
│ Mot de passe          │
│ ┌─────────────────┬─┐ │
│ │                 │👁│ │
│ └─────────────────┴─┘ │
│                       │
│ ☐ Se souvenir de moi  │
│                       │
│ [ Se connecter ]      │
│                       │
│ Mot de passe oublié ? │
│ Créer un compte B2B   │
└───────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Compteur tentatives | Affiché dès la 2e erreur (pas la 1ère) | Éviter anxiété prématurée — Nielsen #9 |
| Compte à rebours blocage | Temps réel (mm:ss) | Donne visibilité sur l'attente — Nielsen #1 |
| Message "en attente" | Ton rassurant + lien contact | Éviter frustration — Thomas ne comprend pas pourquoi il ne peut pas se connecter |
| "Se souvenir de moi" | Coché par défaut sur desktop, décoché mobile | Sécurité — appareils partagés en contexte chantier |
| CTA "Créer un compte" | Toujours visible dans le header | Acquisition — pas seulement pour les utilisateurs existants |
| Bouton connexion désactivé | Pendant blocage | Éviter tentatives inutiles — feedback clair |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|--------------|----------------------|
| Formulaire connexion | `user.login` form natif Drupal |
| Messages contextuels | `B2bLoginSubscriber` → `MessengerInterface` |
| Compteur tentatives | Flood API Drupal |
| Compte à rebours | JS → calcul depuis `flood_window` config |
| Lien "Contacter Company-Test" | Config URL dans `Company-Test_b2b.settings.yml` |
