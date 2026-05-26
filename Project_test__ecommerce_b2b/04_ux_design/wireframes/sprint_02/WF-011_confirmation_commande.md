# Wireframe — WF-011 — Page Confirmation Commande

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-011 — Email confirmation commande · US-009 — Panier & processus de commande
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px
> Sprint : S2

---

## Desktop — État nominal (commande confirmée)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌─────────────────────────────────────────────────────────────────────────────────────────────┐    │
│  │                                                                                             │    │
│  │                        ✅  Commande confirmée !                                             │    │
│  │                                                                                             │    │
│  │               Merci Thomas, votre commande a bien été enregistrée.                         │    │
│  │           Un email de confirmation a été envoyé à thomas.mercier@fibresudest.fr             │    │
│  │                                                                                             │    │
│  └─────────────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                                      │
│  ┌─────────────────────────────────────────────────────────┐  ┌──────────────────────────────────┐  │
│  │  RÉCAPITULATIF DE COMMANDE                              │  │  PROCHAINES ÉTAPES               │  │
│  ├─────────────────────────────────────────────────────────┤  ├──────────────────────────────────┤  │
│  │                                                         │  │                                  │  │
│  │  N° commande     : CMD-2026-00847                       │  │  1. Traitement de votre commande │  │
│  │  Date commande   : 26/05/2026 à 09h14                   │  │     ⏱ Sous 2 heures ouvrées      │  │
│  │  N° BC interne   : BC-2026-0447                         │  │                                  │  │
│  │                                                         │  │  2. Expédition Chronopost         │  │
│  ├─────────────────────────────────────────────────────────┤  │     📦 Livraison estimée :        │  │
│  │  Adresse de livraison :                                 │  │     27/05/2026 avant 13h          │  │
│  │  Chantier Porte de la Défense                           │  │                                  │  │
│  │  12 avenue Charles de Gaulle                            │  │  3. Suivi en temps réel           │  │
│  │  92800 Puteaux                                          │  │     📧 Email + N° suivi           │  │
│  │                                                         │  │        dès l'expédition           │  │
│  ├─────────────────────────────────────────────────────────┤  │                                  │  │
│  │  Câble FTTH 4FO — 500m          187,50 € HT             │  └──────────────────────────────────┘  │
│  │  Boîtier fibre 8FO — ×5          62,50 € HT             │                                        │
│  ├─────────────────────────────────────────────────────────┤  ┌──────────────────────────────────┐  │
│  │  Sous-total HT                  250,00 €                │  │  ACTIONS                         │  │
│  │  TVA (20%)                       50,00 €                │  ├──────────────────────────────────┤  │
│  │  Livraison Chronopost             8,90 €                │  │                                  │  │
│  ├─────────────────────────────────────────────────────────┤  │  ┌────────────────────────────┐  │  │
│  │  TOTAL TTC                      308,90 €                │  │  │  📄 Télécharger le bon      │  │  │
│  │  Paiement : CB Visa ****4892                            │  │  │     de commande (PDF)       │  │  │
│  │  Statut paiement : ✅ Validé (3DS2)                     │  │  └────────────────────────────┘  │  │
│  └─────────────────────────────────────────────────────────┘  │                                  │  │
│                                                               │  ┌────────────────────────────┐  │  │
│                                                               │  │  🔍 Suivre ma commande      │  │  │
│                                                               │  └────────────────────────────┘  │  │
│                                                               │                                  │  │
│                                                               │  ┌────────────────────────────┐  │  │
│                                                               │  │  ← Continuer mes achats    │  │  │
│                                                               │  └────────────────────────────┘  │  │
│                                                               │                                  │  │
│                                                               └──────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## État 2 — Commande en cours de traitement (rafraîchissement)

```
┌──────────────────────────────────────────────────────────────────┐
│                                                                  │
│  🔄  Traitement en cours...                                      │
│                                                                  │
│  Votre paiement 3DS est validé. Nous finalisons votre commande. │
│  Cette page se rafraîchira automatiquement.                      │
│                                                                  │
│  [████████████░░░░░░░░] 65%                                      │
│                                                                  │
└──────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 │
├───────────────────────────┤
│                           │
│  ✅ Commande confirmée !  │
│                           │
│  CMD-2026-00847           │
│  26/05/2026 — 09h14       │
│  BC-2026-0447             │
│                           │
├───────────────────────────┤
│  Câble FTTH 4FO 500m      │
│  187,50 € HT              │
│  Boîtier fibre 8FO ×5     │
│   62,50 € HT              │
├───────────────────────────┤
│  Sous-total HT  250,00 €  │
│  TVA             50,00 €  │
│  Livraison        8,90 €  │
│  TOTAL TTC      308,90 €  │
│  CB Visa ****4892 ✅ 3DS   │
├───────────────────────────┤
│  📦 Livraison estimée :   │
│  27/05/2026 avant 13h     │
├───────────────────────────┤
│ ┌─────────────────────────┐│
│ │ 📄 Bon de commande PDF  ││
│ └─────────────────────────┘│
│ ┌─────────────────────────┐│
│ │ 🔍 Suivre ma commande   ││
│ └─────────────────────────┘│
│ ┌─────────────────────────┐│
│ │ ← Continuer mes achats  ││
│ └─────────────────────────┘│
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Message de confirmation centré avec icône ✅ | Nielsen #1 — Visibilité état système | Thomas doit savoir immédiatement que sa commande est validée — contexte chantier, pas de temps pour chercher |
| N° de commande prominent | Nielsen #6 — Reconnaissance > rappel | Référence que Thomas doit communiquer à sa comptabilité — doit être visible sans scrolling |
| N° BC rappelé dans le récapitulatif | Cohérence métier B2B | Thomas utilise ce numéro pour le rapprochement comptable interne |
| Prochaines étapes avec délais explicites | Nielsen #1 — Feedback et transparence | "Sous 2 heures ouvrées" rassure sur le traitement immédiat |
| CTA "Télécharger bon de commande PDF" | JTBD Thomas — obligation comptable | Le BC est une pièce obligatoire pour sa comptabilité — accès direct depuis la confirmation |
| CTA "Suivre ma commande" | JTBD Thomas — suivi chantiers multiples | Thomas gère plusieurs chantiers simultanément — accès rapide au tracking |
| Panier vidé après confirmation | Prévention des erreurs | Évite la double commande accidentelle |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Page confirmation | Route `/checkout/{order}/complete` — `OrderCompletionPage` Drupal Commerce |
| N° commande | `Order::getOrderNumber()` — format CMD-AAAA-XXXXX |
| Statut paiement 3DS | `PaymentIntent::status === 'succeeded'` — Stripe webhook |
| PDF bon de commande | Génération mPDF via `OrderReceiptSubscriber` |
| CTA "Suivre ma commande" | Lien vers `/user/{uid}/orders/{order_id}` |
| Email confirmation auto | `OrderEvent::PLACE` → `SendGrid b2b_order_confirm` template |
