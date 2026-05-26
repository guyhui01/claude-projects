# Wireframe — WF-017 — Page Succès Paiement 3DS

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-016 — Paiement CB 3D Secure (Stripe)
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px
> Sprint : S3

---

## Desktop — État nominal (paiement 3DS validé)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌─────────────────────────────────────────────────────────────────────────────────────────────┐    │
│  │                                                                                             │    │
│  │                    🔒 ✅  Paiement sécurisé validé                                          │    │
│  │                                                                                             │    │
│  │           Votre authentification 3D Secure a été confirmée par votre banque.               │    │
│  │                   Votre commande CMD-2026-00847 est confirmée.                             │    │
│  │                                                                                             │    │
│  └─────────────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                                      │
│  ┌─────────────────────────────────────────────────────────┐  ┌──────────────────────────────────┐  │
│  │  DÉTAILS DE LA TRANSACTION                              │  │  FACTURE                         │  │
│  ├─────────────────────────────────────────────────────────┤  ├──────────────────────────────────┤  │
│  │                                                         │  │                                  │  │
│  │  N° transaction Stripe  : pi_3Qx8aB2eZvKYlo2C          │  │  ✅ Facture en cours de           │  │
│  │  Carte                  : Visa ****4892                 │  │     génération...                │  │
│  │  Montant débité         : 308,90 € TTC                  │  │                                  │  │
│  │  Date                   : 26/05/2026 à 09h16            │  │  Vous recevrez votre facture     │  │
│  │  Statut 3DS             : ✅ Authentifié (frictionless) │  │  PDF par email sous quelques     │  │
│  │                                                         │  │  minutes à :                     │  │
│  ├─────────────────────────────────────────────────────────┤  │  thomas.mercier@fibresudest.fr   │  │
│  │  Commande liée          : CMD-2026-00847                │  │                                  │  │
│  │  N° BC interne          : BC-2026-0447                  │  ├──────────────────────────────────┤  │
│  │                                                         │  │                                  │  │
│  ├─────────────────────────────────────────────────────────┤  │  ┌────────────────────────────┐  │  │
│  │  Câble FTTH 4FO — 500m          187,50 € HT             │  │  │  📄 Télécharger la facture  │  │  │
│  │  Boîtier fibre 8FO — ×5          62,50 € HT             │  │  │     PDF (disponible sous    │  │  │
│  ├─────────────────────────────────────────────────────────┤  │  │     2 min)                  │  │  │
│  │  Sous-total HT                  250,00 €                │  │  └────────────────────────────┘  │  │
│  │  TVA (20%)                       50,00 €                │  │                                  │  │
│  │  Livraison                        8,90 €                │  └──────────────────────────────────┘  │
│  ├─────────────────────────────────────────────────────────┤                                        │
│  │  TOTAL DÉBITÉ TTC               308,90 €                │  ┌──────────────────────────────────┐  │
│  └─────────────────────────────────────────────────────────┘  │  ACTIONS                         │  │
│                                                               ├──────────────────────────────────┤  │
│                                                               │                                  │  │
│                                                               │  ┌────────────────────────────┐  │  │
│                                                               │  │  🔍 Suivre ma commande      │  │  │
│                                                               │  └────────────────────────────┘  │  │
│                                                               │                                  │  │
│                                                               │  ┌────────────────────────────┐  │  │
│                                                               │  │  ← Retour au catalogue     │  │  │
│                                                               │  └────────────────────────────┘  │  │
│                                                               │                                  │  │
│                                                               └──────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## État 2 — Paiement 3DS échoué (carte refusée)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (3)     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌─────────────────────────────────────────────────────────────────────────────────────────────┐    │
│  │                                                                                             │    │
│  │                    ❌  Paiement non abouti                                                  │    │
│  │                                                                                             │    │
│  │   Votre authentification 3D Secure a échoué ou a été annulée.                             │    │
│  │   Votre commande n'a pas été débitée. Vous pouvez réessayer.                              │    │
│  │                                                                                             │    │
│  │   Code erreur : payment_intent_authentication_failure                                     │    │
│  │                                                                                             │    │
│  │   ┌──────────────────────────────┐    ┌───────────────────────────────────┐               │    │
│  │   │  🔄 Réessayer le paiement   │    │  📞 Contacter Company-Test        │               │    │
│  │   └──────────────────────────────┘    └───────────────────────────────────┘               │    │
│  │                                                                                             │    │
│  └─────────────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                                      │
│  ℹ️  Votre panier a été conservé. Essayez avec une autre carte ou contactez votre banque.           │
│                                                                                                      │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (paiement validé)

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 │
├───────────────────────────┤
│                           │
│  🔒 ✅ Paiement validé !  │
│                           │
│  CMD-2026-00847           │
│  Visa ****4892            │
│  308,90 € TTC débités     │
│  26/05/2026 — 09h16       │
│  3DS : ✅ Authentifié     │
│                           │
├───────────────────────────┤
│  📄 Facture PDF           │
│  → envoyée par email      │
│  (sous 2 min)             │
├───────────────────────────┤
│ ┌─────────────────────────┐│
│ │ 📄 Télécharger facture  ││
│ └─────────────────────────┘│
│ ┌─────────────────────────┐│
│ │ 🔍 Suivre ma commande   ││
│ └─────────────────────────┘│
│ ┌─────────────────────────┐│
│ │ ← Retour au catalogue   ││
│ └─────────────────────────┘│
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Confirmation 3DS explicite ("authentifié par votre banque") | Nielsen #1 — Visibilité état | Thomas doit savoir que c'est la banque qui a validé, pas seulement le site — rassure sur la sécurité |
| N° transaction Stripe visible | Traçabilité B2B | Permet le rapprochement avec le relevé bancaire ou en cas de litige |
| Facture "en cours de génération" avec délai | Nielsen #1 — Feedback | La génération PDF est asynchrone (mPDF + queue) — le message évite l'impression de bug |
| État d'erreur 3DS : panier conservé | Nielsen #9 — Aide à la récupération | L'acheteur ne doit pas repasser par tout le checkout — juste changer de carte |
| Code erreur Stripe affiché | Support technique | En cas de contact avec Company-Test, le code permet un diagnostic rapide |
| CTA "Réessayer" vs "Retour catalogue" | Nielsen #3 — Contrôle utilisateur | Thomas choisit : réessayer immédiatement ou abandonner — pas de décision forcée |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Page succès paiement | `PaymentReturnController::returnPage()` — `commerce_stripe` |
| N° transaction Stripe | `Payment::getRemoteId()` — PaymentIntent ID |
| Statut 3DS | `PaymentIntent::latest_charge.payment_method_details.card.three_d_secure.result` |
| Lien téléchargement facture | Route `/orders/{order}/invoice` — disponible après génération async |
| Génération facture PDF | `InvoiceGeneratorEvent` → `mPDF` → queue worker |
| État erreur paiement | `PaymentDeclinedException` → redirect vers checkout avec message |
| Conservation panier si échec | `Order::state === 'checkout'` — Drupal Commerce workflow |
