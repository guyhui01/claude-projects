# Wireframe — WF-005 — Formulaire Inscription B2B

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-005 — Création compte professionnel B2B
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État nominal (formulaire vide)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ HEADER simplifié                                                            │
│ [Logo Company-Test]                                          Déjà un compte ?   │
│                                                         [ Se connecter ]   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│              Créer votre compte professionnel B2B                          │
│              ──────────────────────────────────                            │
│              Accédez au catalogue et à vos tarifs négociés                 │
│                                                                             │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │ INFORMATIONS ENTREPRISE                                              │   │
│  │                                                                      │   │
│  │  Raison sociale *                                                    │   │
│  │  ┌────────────────────────────────────────────────────────────────┐ │   │
│  │  │ Ex : Fibre Sud-Est SARL                                        │ │   │
│  │  └────────────────────────────────────────────────────────────────┘ │   │
│  │                                                                      │   │
│  │  Numéro SIRET *                          ℹ                          │   │
│  │  ┌────────────────────────────────────────────────────────────────┐ │   │
│  │  │ 14 chiffres — ex : 12345678901234                              │ │   │
│  │  └────────────────────────────────────────────────────────────────┘ │   │
│  │  Tooltip ℹ : "Le SIRET est le numéro d'identification de votre      │   │
│  │              établissement (14 chiffres, trouvable sur votre Kbis)" │   │
│  └──────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │ INFORMATIONS CONTACT                                                 │   │
│  │                                                                      │   │
│  │  Prénom *                   Nom *                                    │   │
│  │  ┌──────────────────────┐   ┌──────────────────────────────────┐    │   │
│  │  │                      │   │                                  │    │   │
│  │  └──────────────────────┘   └──────────────────────────────────┘    │   │
│  │                                                                      │   │
│  │  Email professionnel *                                               │   │
│  │  ┌────────────────────────────────────────────────────────────────┐ │   │
│  │  │ prenom.nom@entreprise.fr                                       │ │   │
│  │  └────────────────────────────────────────────────────────────────┘ │   │
│  │                                                                      │   │
│  │  Téléphone                                                           │   │
│  │  ┌────────────────────────────────────────────────────────────────┐ │   │
│  │  │ +33 6 ...                                                      │ │   │
│  │  └────────────────────────────────────────────────────────────────┘ │   │
│  └──────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │ MOT DE PASSE                                                         │   │
│  │                                                                      │   │
│  │  Mot de passe *                                                      │   │
│  │  ┌────────────────────────────────────────────────────────────────┐ │   │
│  │  │ ••••••••                                                   [👁]│ │   │
│  │  └────────────────────────────────────────────────────────────────┘ │   │
│  │  ○●○○  "Incluez majuscule, chiffre, 8 caractères min."              │   │
│  │                                                                      │   │
│  │  Confirmer le mot de passe *                                         │   │
│  │  ┌────────────────────────────────────────────────────────────────┐ │   │
│  │  │ ••••••••                                                   [👁]│ │   │
│  │  └────────────────────────────────────────────────────────────────┘ │   │
│  └──────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
│  ☐  J'accepte les conditions générales d'utilisation                       │
│                                                                             │
│              [ Créer mon compte professionnel ]                            │
│                                                                             │
│    Votre demande sera examinée sous 24h par notre équipe Company-Test.          │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## États de validation — erreurs inline

```
┌────────────────────────────────────────────────┐
│ SIRET invalide                                 │
│  ┌──────────────────────────────────────────┐  │
│  │ 1234567                           ❌     │  │
│  └──────────────────────────────────────────┘  │
│  ⚠ Le SIRET doit contenir exactement 14 chiffres│
└────────────────────────────────────────────────┘

┌────────────────────────────────────────────────┐
│ Email déjà enregistré                          │
│  ┌──────────────────────────────────────────┐  │
│  │ jean.dupont@dt.fr                 ❌     │  │
│  └──────────────────────────────────────────┘  │
│  ⚠ Un compte existe déjà avec cet email.       │
│    [ Se connecter ] ou [ Mot de passe oublié ] │
└────────────────────────────────────────────────┘

┌────────────────────────────────────────────────┐
│ Mot de passe trop faible                       │
│  ┌──────────────────────────────────────────┐  │
│  │ ••••••                            ❌     │  │
│  └──────────────────────────────────────────┘  │
│  ●○○○  Faible                                  │
│  ⚠ 8 caractères min · 1 majuscule · 1 chiffre  │
└────────────────────────────────────────────────┘
```

---

## Page de confirmation (post-soumission)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│                          ✅                                                 │
│                                                                             │
│              Votre demande est en cours de traitement                      │
│              ──────────────────────────────────────                        │
│                                                                             │
│   Merci Thomas ! Votre demande de compte B2B a bien été enregistrée.       │
│   Notre équipe va l'examiner dans les prochaines 24 heures.                │
│                                                                             │
│   Un email de confirmation a été envoyé à : jean.dupont@dt.fr              │
│                                                                             │
│   ┌─────────────────────────────────────────────────────────────────────┐  │
│   │  En attendant, vous pouvez consulter notre catalogue en ligne.      │  │
│   │  [ Parcourir le catalogue ]                                         │  │
│   └─────────────────────────────────────────────────────────────────────┘  │
│                                                                             │
│   Des questions ? [ Contacter Company-Test ]                                    │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Tooltip SIRET | Icône ℹ + explication + où trouver | Réduction friction — terme métier pas toujours connu |
| Validation inline | Erreur affichée à la perte de focus (blur) | Pas en temps réel (trop intrusif) — Nielsen #9 |
| Indicateur force mdp | Barre colorée progressive | Feedback visuel immédiat sans texte verbeux |
| Champ téléphone | Non obligatoire | Réduction friction inscription — données collectées après |
| Message post-soumission | Email affiché + délai 24h précis | Gestion anxiété utilisateur — Nielsen #1 visibilité statut |
| CTA catalogue | Proposé sur la page de confirmation | Engagement immédiat — réduit le taux d'abandon |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|--------------|----------------------|
| Formulaire inscription | `user.register` + `hook_form_alter()` |
| Validation SIRET | `SiretConstraintValidator` (Kernel) |
| Indicateur force mdp | JS natif Drupal (password policy module) |
| Tooltip ℹ | `#description` field + CSS tooltip |
| Page confirmation | Route custom → `Company-TestsRegisterController` |
