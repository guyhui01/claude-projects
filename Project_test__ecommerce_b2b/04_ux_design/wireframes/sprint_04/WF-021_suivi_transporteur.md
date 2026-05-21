# Wireframe — WF-021 — Suivi transporteur et email d'expédition

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-021 — Envoi automatique du numéro de suivi au client après expédition
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État 1 : Email d'expédition reçu par Thomas (template HTML)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  EMAIL — Objet : ✉ Votre commande CMD-1042 a été expédiée — Company-Test                                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌────────────────────────────────────────────────────────────────────────────────────────────────┐  │
│  │                                                                                                │  │
│  │   [LOGO Company-Test]                                                                               │  │
│  │   ─────────────────────────────────────────────────────────────────────────────────────────   │  │
│  │                                                                                                │  │
│  │   Bonjour Thomas Mercier,                                                                      │  │
│  │                                                                                                │  │
│  │   Bonne nouvelle ! Votre commande N° CMD-1042 a été expédiée.                                  │  │
│  │                                                                                                │  │
│  │   ┌──────────────────────────────────────────────────────────────────────────────────────┐    │  │
│  │   │  🚚  Informations d'expédition                                                        │    │  │
│  │   │                                                                                      │    │  │
│  │   │   Transporteur       : Chronopost Express                                            │    │  │
│  │   │   Numéro de suivi    : XK123456789FR                                                 │    │  │
│  │   │   Date d'expédition  : 21/05/2026                                                    │    │  │
│  │   │   Livraison estimée  : 22/05/2026 avant 13h                                          │    │  │
│  │   │                                                                                      │    │  │
│  │   │   Adresse livraison  : Chantier Porte de la Défense                                  │    │  │
│  │   │                        92400 Courbevoie                                               │    │  │
│  │   │                                                                                      │    │  │
│  │   │   ┌───────────────────────────────────────────────────────────────┐                  │    │  │
│  │   │   │        [ 🔍  Suivre ma livraison sur Chronopost ]              │                  │    │  │
│  │   │   └───────────────────────────────────────────────────────────────┘                  │    │  │
│  │   └──────────────────────────────────────────────────────────────────────────────────────┘    │  │
│  │                                                                                                │  │
│  │   Vous pouvez également suivre votre commande depuis votre espace client :                    │  │
│  │   [→ Accéder à mes commandes]                                                                 │  │
│  │                                                                                                │  │
│  │   Merci pour votre confiance,                                                                  │  │
│  │   L'équipe Company-Test                                                                             │  │
│  │   ─────────────────────────────────────────────────────────────────────────────────────────   │  │
│  │   Company-Test SAS — 12 rue de la Fibre Optique — 75015 Paris                                      │  │
│  │   Pour toute question : support@Company-Test.fr — +33 1 23 45 67 89                                │  │
│  │                                                                                                │  │
│  └────────────────────────────────────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Desktop — État 2 : Lien de suivi dans l'espace client (Mon compte > Mes commandes)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌────────────────────┐  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ MON COMPTE         │  │  Commande CMD-1042 — 20/05/2026                     [Expédiée 🚚]      │  │
│  ├────────────────────┤  ├────────────────────────────────────────────────────────────────────────┤  │
│  │ > Mes commandes    │  │                                                                        │  │
│  │ > Mon profil       │  │  SUIVI D'EXPÉDITION                                                    │  │
│  │ > Mes adresses     │  │                                                                        │  │
│  │ > Déconnexion      │  │  [●]──────────────[●]────────────────[●]──────────────[○]             │  │
│  └────────────────────┘  │  Confirmée        En préparation    Expédiée         Livrée           │  │
│                           │  20/05             21/05             21/05           Attendu 22/05    │  │
│                           │                                                                        │  │
│                           │  ✓ Commande confirmée le 20/05 à 14h30                                │  │
│                           │  ✓ En préparation le 21/05 à 08h15                                    │  │
│                           │  ✓ Expédiée le 21/05 à 15h45                                          │  │
│                           │  ○ Livraison estimée le 22/05/2026 avant 13h                          │  │
│                           │                                                                        │  │
│                           │  ┌────────────────────────────────────────────────────────────────┐   │  │
│                           │  │  🚚 Chronopost Express    Suivi : XK123456789FR                │   │  │
│                           │  │  [ Suivre sur chronopost.fr →  ]                               │   │  │
│                           │  └────────────────────────────────────────────────────────────────┘   │  │
│                           │                                                                        │  │
│                           └────────────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 3 — Commande sans numéro de suivi (numéro non renseigné par admin)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  SUIVI D'EXPÉDITION                                                                                   │
│                                                                                                      │
│  [●]──────────────[●]────────────────[○]──────────────[○]                                            │
│  Confirmée        En préparation    Expédiée         Livrée                                          │
│  20/05             21/05                                                                              │
│                                                                                                      │
│  ✓ Commande confirmée le 20/05 à 14h30                                                               │
│  ✓ En préparation le 21/05 à 08h15                                                                   │
│  ○ Expédition en cours — le numéro de suivi sera disponible prochainement                           │
│                                                                                                      │
│  Pour toute question : support@Company-Test.fr                                                            │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 4 — Back-office : saisie numéro de suivi par Isabelle

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test BACK-OFFICE — Commande CMD-1042                                                              │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  Statut actuel : En préparation                                                                       │
│                                                                                                      │
│  EXPÉDITION — Renseignez le numéro de suivi avant de passer à "Expédiée"                             │
│                                                                                                      │
│  Transporteur :     ┌─────────────────────────────────────────────────────────────┐                  │
│                     │  ● Chronopost Express   ○ Colissimo Standard                │                  │
│                     └─────────────────────────────────────────────────────────────┘                  │
│                                                                                                      │
│  Numéro de suivi :  ┌─────────────────────────────────────────────────────────────┐                  │
│                     │  XK123456789FR                                              │                  │
│                     └─────────────────────────────────────────────────────────────┘                  │
│                                                                                                      │
│  ┌──────────────────────────────────────────────────────────────────────────────────────────────┐    │
│  │  ✉  Un email de suivi sera envoyé automatiquement à thomas.mercier@mercier-elec.fr           │    │
│  └──────────────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                                      │
│  ┌─────────────────────────────────┐                                                                  │
│  │  [ Passer à "Expédiée" → ]      │                                                                  │
│  └─────────────────────────────────┘                                                                  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (email responsive)

```
┌───────────────────────────┐
│ [LOGO Company-Test]            │
├───────────────────────────┤
│ Bonjour Thomas,           │
│                           │
│ Votre commande            │
│ CMD-1042 a été expédiée ! │
│                           │
│ ┌─────────────────────────┐│
│ │ 🚚 Chronopost Express   ││
│ │                         ││
│ │ Suivi :                 ││
│ │ XK123456789FR           ││
│ │                         ││
│ │ Livraison estimée :     ││
│ │ 22/05 avant 13h         ││
│ │                         ││
│ │ ┌─────────────────────┐ ││
│ │ │ [Suivre ma livraison]│ ││
│ │ └─────────────────────┘ ││
│ └─────────────────────────┘│
│                           │
│ [→ Mon espace client]     │
│                           │
│ Merci,                    │
│ L'équipe Company-Test          │
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| CTA "Suivre ma livraison" bien visible | Nielsen #1 — Visibilité | Thomas sur chantier = besoin d'accès rapide — 1 clic vers le suivi Chronopost |
| Date de livraison estimée concrète | Nielsen #1 — Visibilité | "22/05 avant 13h" permet à Thomas de planifier la réception sur le chantier |
| Double accès suivi : email + espace client | Nielsen #7 — Flexibilité | Thomas peut ne pas conserver l'email — l'espace client reste la source de vérité |
| Avertissement admin avant envoi email | Prévention erreur | Isabelle voit clairement que le clic déclenche l'email — confirmation implicite |
| Numéro de suivi copié dans l'espace client | Nielsen #4 — Cohérence | Même information dans email ET espace client — pas de divergence possible |
| Message si numéro manquant (pas de vide silencieux) | Nielsen #1 — Visibilité | Thomas ne doit pas penser que la commande est bloquée — message rassurant |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Email automatique expédition | `OrderShippedSubscriber` — event `commerce_order.ship.post_transition` |
| Template email HTML | `templates/emails/expedition-tracking.html.twig` via `hook_mail()` |
| Lien tracking URL | `str_replace('{tracking_number}', ...)` → URL Chronopost / La Poste |
| Champ numéro suivi back-office | `field_tracking_number` (string) + `field_tracking_carrier` (list) sur `commerce_order` |
| Lien "Suivre" dans espace client | `field_tracking_number` — formatter URL avec lien externe |
| Timeline statut commande | `OrderTransitionLog` ou `field_status_history` custom |
| Envoi via SendGrid | `mailsystem` + `symfony_mailer` — SendGrid SMTP dans `settings.php` |
