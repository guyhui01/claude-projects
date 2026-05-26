# Wireframe — WF-016 — Paiement Stripe 3D Secure

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-016 — Paiement sécurisé Stripe avec authentification 3D Secure
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État nominal (Stripe Elements — saisie carte)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (3)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌─────────────────────────────────────────────────────────────────────────────────────────────┐    │
│  │   [✓  1. Adresse] ──────── [✓  2. Bon de commande] ──────── [●  3. Paiement]               │    │
│  └─────────────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                                      │
│  ┌───────────────────────────────────────────────────────┐  ┌──────────────────────────────────────┐│
│  │  PAIEMENT SÉCURISÉ                                    │  │  RÉCAPITULATIF FINAL                 ││
│  ├───────────────────────────────────────────────────────┤  ├──────────────────────────────────────┤│
│  │                                                       │  │  Chantier Porte de la Défense        ││
│  │  🔒 Paiement sécurisé SSL — Stripe                    │  │  N° BC : BC-2026-0142               ││
│  │  Vos données bancaires ne sont jamais stockées        │  ├──────────────────────────────────────┤│
│  │  sur nos serveurs.                                    │  │  Câble NYY-J 4x16 ×3    145,50 € HT ││
│  │                                                       │  │  Gaine ICTA Ø16 ×10      72,00 € HT ││
│  │  ┌─────────────────────────────────────────────────┐  │  │  Disjoncteur 40A ×5     110,00 € HT ││
│  │  │  ╔═══════════════════════════════════════════╗   │  │  ├──────────────────────────────────────┤│
│  │  │  ║  STRIPE ELEMENTS — iframe sécurisée       ║   │  │  │  Sous-total HT          327,50 €    ││
│  │  │  ║                                           ║   │  │  │  TVA (20%)               65,50 €    ││
│  │  │  ║  Numéro de carte                          ║   │  │  │  Livraison               12,00 €    ││
│  │  │  ║  ████ ████ ████ ████         [Visa][MC]   ║   │  │  ├──────────────────────────────────────┤│
│  │  │  ║                                           ║   │  │  │  TOTAL TTC              405,00 €    ││
│  │  │  ║  Expiration          CVV                  ║   │  │  └──────────────────────────────────────┘│
│  │  │  ║  MM / AA             ···                  ║   │  │                                          │
│  │  │  ║                                           ║   │                                            │
│  │  │  ╚═══════════════════════════════════════════╝   │                                            │
│  │  └─────────────────────────────────────────────────┘  │                                            │
│  │                                                       │                                            │
│  │  [Visa] [Mastercard] [CB] [Amex]                      │                                            │
│  │                                                       │                                            │
│  │  ┌────────────────┐    ┌──────────────────────────┐   │                                            │
│  │  │  [← Retour]    │    │   [Confirmer et payer →] │   │                                            │
│  │  └────────────────┘    └──────────────────────────┘   │                                            │
│  └───────────────────────────────────────────────────────┘                                            │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — 3DS déclenché : authentification requise

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  [Fond grisé — overlay — page en arrière-plan non cliquable]                                         │
│                                                                                                      │
│         ┌──────────────────────────────────────────────────────────────────┐                        │
│         │  Authentification requise par votre banque                    [X]│                        │
│         ├──────────────────────────────────────────────────────────────────┤                        │
│         │                                                                  │                        │
│         │  🔒 Votre banque demande une vérification supplémentaire          │                        │
│         │     pour confirmer ce paiement (3D Secure).                      │                        │
│         │                                                                  │                        │
│         │  ┌────────────────────────────────────────────────────────────┐  │                        │
│         │  │                                                            │  │                        │
│         │  │   ╔══════════════════════════════════════════════════╗    │  │                        │
│         │  │   ║   IFRAME 3DS — Interface banque émettrice        ║    │  │                        │
│         │  │   ║                                                  ║    │  │                        │
│         │  │   ║   Votre banque : Crédit Agricole                ║    │  │                        │
│         │  │   ║                                                  ║    │  │                        │
│         │  │   ║   Entrez le code reçu par SMS                   ║    │  │                        │
│         │  │   ║   au +33 6 ** ** ** 78                          ║    │  │                        │
│         │  │   ║   ┌──────────────────────────────┐             ║    │  │                        │
│         │  │   ║   │  _ _ _ _ _ _                 │             ║    │  │                        │
│         │  │   ║   └──────────────────────────────┘             ║    │  │                        │
│         │  │   ║   [ Valider ]                                   ║    │  │                        │
│         │  │   ║                                                  ║    │  │                        │
│         │  │   ╚══════════════════════════════════════════════════╝    │  │                        │
│         │  │                                                            │  │                        │
│         │  │   ⟳  En attente de validation...                           │  │                        │
│         │  └────────────────────────────────────────────────────────────┘  │                        │
│         │                                                                  │                        │
│         │  Ne fermez pas cette fenêtre pendant l'authentification.         │                        │
│         └──────────────────────────────────────────────────────────────────┘                        │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 3 — 3DS succès : animation de confirmation

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                                                                                      │
│                   ┌──────────────────────────────────────────────────────┐                          │
│                   │                                                      │                          │
│                   │              ✅                                      │                          │
│                   │                                                      │                          │
│                   │      Authentification réussie !                      │                          │
│                   │                                                      │                          │
│                   │      Paiement en cours de traitement...              │                          │
│                   │                                                      │                          │
│                   │      ⟳  Redirection vers la confirmation...          │                          │
│                   │                                                      │                          │
│                   └──────────────────────────────────────────────────────┘                          │
│                                                                                                      │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 4 — 3DS refusé : authentification échouée

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  ┌────────────────────────────────────────────────────────────────────────────────────┐              │
│  │  ⚠  Authentification 3D Secure échouée                                             │              │
│  │                                                                                    │              │
│  │  L'authentification demandée par votre banque n'a pas abouti.                      │              │
│  │  Cela peut être dû à :                                                             │              │
│  │  · Un code de validation incorrect                                                 │              │
│  │  · Une session expirée (plus de 10 minutes)                                        │              │
│  │                                                                                    │              │
│  │  ┌────────────────────────────────┐    ┌───────────────────────────────────────┐  │              │
│  │  │  [ Réessayer avec cette carte ]│    │  [ Utiliser une autre carte ]         │  │              │
│  │  └────────────────────────────────┘    └───────────────────────────────────────┘  │              │
│  └────────────────────────────────────────────────────────────────────────────────────┘              │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 5 — Paiement refusé (carte invalide / fonds insuffisants)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  ┌────────────────────────────────────────────────────────────────────────────────────┐              │
│  │  ✗  Paiement refusé                                                                │              │
│  │                                                                                    │              │
│  │  Votre paiement n'a pas pu être traité.                                            │              │
│  │                                                                                    │              │
│  │  Raison : Fonds insuffisants sur la carte sélectionnée.                            │              │
│  │                                                                                    │              │
│  │  Que faire ?                                                                       │              │
│  │  · Vérifiez le plafond de votre carte professionnelle                              │              │
│  │  · Contactez votre service comptabilité pour les achats > 500 €                   │              │
│  │                                                                                    │              │
│  │  ┌─────────────────────────────────┐    ┌───────────────────────────────────────┐ │              │
│  │  │  [ Essayer une autre carte ]    │    │  [ Contacter le support ]             │ │              │
│  │  └─────────────────────────────────┘    └───────────────────────────────────────┘ │              │
│  └────────────────────────────────────────────────────────────────────────────────────┘              │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (Stripe Elements natif responsive)

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 (3)│
├───────────────────────────┤
│  Paiement sécurisé        │
│  🔒 SSL — Stripe           │
├───────────────────────────┤
│                           │
│ TOTAL TTC : 405,00 €      │
│ N° BC : BC-2026-0142      │
│                           │
│ ┌─────────────────────────┐│
│ │ ╔═══════════════════╗   ││
│ │ ║ STRIPE ELEMENTS   ║   ││
│ │ ║                   ║   ││
│ │ ║ N° de carte       ║   ││
│ │ ║ ████ ████ ████    ║   ││
│ │ ║ ████              ║   ││
│ │ ║                   ║   ││
│ │ ║ MM/AA    CVV ···  ║   ││
│ │ ╚═══════════════════╝   ││
│ └─────────────────────────┘│
│                           │
│ [Visa][MC][CB][Amex]      │
│                           │
│ ┌─────────────────────────┐│
│ │  [Confirmer et payer →] ││
│ │      405,00 € TTC       ││
│ └─────────────────────────┘│
│   ↑ Sticky en bas d'écran  │
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Stripe Elements iframe isolée | PCI DSS SAQ A — hors scope Drupal | Les données carte transitent directement de l'iframe Stripe vers les serveurs Stripe — Drupal ne voit jamais le PAN |
| Badge "🔒 Paiement sécurisé SSL — Stripe" | Nielsen #1 — Confiance | Rassure Thomas avant de saisir sa carte professionnelle — signe de confiance visible |
| Overlay 3DS non fermable par clic extérieur | Nielsen #5 — Prévention des erreurs | Empêcher une fermeture accidentelle de l'iframe 3DS en cours — paiement abandonné |
| Message "Ne fermez pas cette fenêtre" | Nielsen #9 — Aide à la récupération | Prévient Thomas avant qu'il fasse l'erreur — contexte chantier = distraction fréquente |
| 2 options sur refus 3DS (réessayer / autre carte) | Nielsen #9 — Aide à la récupération d'erreur | L'échec 3DS a 2 causes distinctes — proposer les 2 sorties évite une frustration en impasse |
| Messages d'erreur traduits (pas codes Stripe bruts) | Nielsen #9 — Messages clairs | Les codes Stripe (`card_declined`, `insufficient_funds`) sont intraduisibles pour Thomas |
| CTA sticky mobile | Mobile best practice | Paiement = action critique — disponibilité permanente du bouton sans scroll |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Stripe Elements iframe | `commerce_stripe` — `StripeReviewPane` + Stripe.js SDK |
| Déclenchement 3DS | `stripe.confirmCardPayment()` — géré côté Stripe JS, hors Drupal |
| Iframe 3DS | Modal Stripe 3DS — `stripe.handleNextAction()` — hors scope Drupal |
| Gestion retour 3DS | Webhook Stripe `payment_intent.succeeded` / `payment_intent.payment_failed` |
| Messages d'erreur traduits | `commerce_stripe` — mapping `StripeError` → message i18n FR |
| Page confirmation post-3DS | Route `commerce_checkout.form` — step `complete` — `CheckoutCompletionMessage` |
| Sécurité PCI | Aucun stockage CB côté Drupal — Stripe Token uniquement |
