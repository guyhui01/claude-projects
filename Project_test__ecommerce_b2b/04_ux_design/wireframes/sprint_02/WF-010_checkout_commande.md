# Wireframe — WF-010 — Checkout 3 étapes

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-010 — Processus de commande en 3 étapes (Adresse / Bon de commande / Paiement)
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — Stepper navigation (état nominal — Étape 1)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (3)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌─────────────────────────────────────────────────────────────────────────────────────────────┐    │
│  │                                                                                             │    │
│  │   [●  1. Adresse] ──────── [○  2. Bon de commande] ──────── [○  3. Paiement]               │    │
│  │      ACTIF                      futur                            futur                     │    │
│  │                                                                                             │    │
│  └─────────────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                                      │
│  ┌───────────────────────────────────────────────────────┐  ┌──────────────────────────────────────┐│
│  │  ÉTAPE 1 — Adresse de livraison                       │  │  RÉCAPITULATIF PANIER                ││
│  ├───────────────────────────────────────────────────────┤  ├──────────────────────────────────────┤│
│  │                                                       │  │  Câble NYY-J 4x16 ×3    145,50 € HT ││
│  │  Nom du chantier *                                    │  │  Gaine ICTA Ø16 ×10      72,00 € HT ││
│  │  ┌─────────────────────────────────────────────────┐  │  │  Disjoncteur 40A ×5     110,00 € HT ││
│  │  │  Chantier Porte de la Défense                   │  │  ├──────────────────────────────────────┤│
│  │  └─────────────────────────────────────────────────┘  │  │  Sous-total HT          327,50 €    ││
│  │                                                       │  │  TVA (20%)               65,50 €    ││
│  │  Adresse *                                            │  │  Livraison               À calculer ││
│  │  ┌─────────────────────────────────────────────────┐  │  ├──────────────────────────────────────┤│
│  │  │  12 avenue Charles de Gaulle                    │  │  │  TOTAL TTC              À calculer  ││
│  │  └─────────────────────────────────────────────────┘  │  └──────────────────────────────────────┘│
│  │                                                       │                                          │
│  │  Complément d'adresse                                 │                                          │
│  │  ┌─────────────────────────────────────────────────┐  │                                          │
│  │  │  Bâtiment A — Accès livraison quai 3            │  │                                          │
│  │  └─────────────────────────────────────────────────┘  │                                          │
│  │                                                       │                                          │
│  │  Code postal *             Ville *                    │                                          │
│  │  ┌───────────────┐         ┌──────────────────────┐   │                                          │
│  │  │  92800        │         │  Puteaux              │   │                                          │
│  │  └───────────────┘         └──────────────────────┘   │                                          │
│  │                                                       │                                          │
│  │  Pays                                                 │                                          │
│  │  ┌─────────────────────────────────────────────────┐  │                                          │
│  │  │  France                                       ▼ │  │                                          │
│  │  └─────────────────────────────────────────────────┘  │                                          │
│  │                                                       │                                          │
│  │  ┌─────────────────────────────────────────────────┐  │                                          │
│  │  │             [ Continuer →  ]                    │  │                                          │
│  │  └─────────────────────────────────────────────────┘  │                                          │
│  └───────────────────────────────────────────────────────┘                                          │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — Étape 2 : Bon de commande (champ obligatoire)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (3)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌─────────────────────────────────────────────────────────────────────────────────────────────┐    │
│  │   [✓  1. Adresse] ──────── [●  2. Bon de commande] ──────── [○  3. Paiement]               │    │
│  │      COMPLÉTÉ                    ACTIF                            futur                     │    │
│  └─────────────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                                      │
│  ┌───────────────────────────────────────────────────────┐  ┌──────────────────────────────────────┐│
│  │  ÉTAPE 2 — Numéro de bon de commande                  │  │  RÉCAPITULATIF PANIER                ││
│  ├───────────────────────────────────────────────────────┤  ├──────────────────────────────────────┤│
│  │                                                       │  │  Câble NYY-J 4x16 ×3    145,50 € HT ││
│  │  Numéro de bon de commande interne *  [?]             │  │  Gaine ICTA Ø16 ×10      72,00 € HT ││
│  │  ┌─────────────────────────────────────────────────┐  │  │  Disjoncteur 40A ×5     110,00 € HT ││
│  │  │  BC-2026-0142  (pré-rempli si disponible)        │  │  ├──────────────────────────────────────┤│
│  │  └─────────────────────────────────────────────────┘  │  │  Sous-total HT          327,50 €    ││
│  │                                                       │  │  Livraison               12,00 €    ││
│  │  [?] Tooltip : "Votre numéro de bon de commande       │  ├──────────────────────────────────────┤│
│  │       interne (ex : BC-2026-0142). Ce numéro          │  │  TOTAL TTC              473,40 €    ││
│  │       apparaîtra sur votre facture."                  │  └──────────────────────────────────────┘│
│  │                                                       │                                          │
│  │  ℹ Ce champ est obligatoire pour valider              │                                          │
│  │    votre commande B2B.                                │                                          │
│  │                                                       │                                          │
│  │  ┌────────────────┐    ┌──────────────────────────┐   │                                          │
│  │  │  [← Retour]    │    │     [ Continuer → ]       │   │                                          │
│  │  └────────────────┘    └──────────────────────────┘   │                                          │
│  └───────────────────────────────────────────────────────┘                                          │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 3 — Erreur : N° BC vide à la soumission

```
┌────────────────────────────────────────────────────────┐
│  ÉTAPE 2 — Numéro de bon de commande                   │
├────────────────────────────────────────────────────────┤
│                                                        │
│  Numéro de bon de commande interne *  [?]              │
│  ┌──────────────────────────────────────────────────┐  │
│  │                                                  │  │
│  └──────────────────────────────────────────────────┘  │
│  ⚠ Le N° de bon de commande est requis pour            │
│    finaliser votre commande.                           │
│    Renseignez votre référence interne (ex : BC-2026-…) │
│                                                        │
│  ┌────────────────┐    ┌──────────────────────────┐    │
│  │  [← Retour]    │    │   [ Continuer → ]  (grisé)│    │
│  └────────────────┘    └──────────────────────────┘    │
└────────────────────────────────────────────────────────┘
```

---

### État 4 — Étape 3 : Paiement Stripe Elements

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (3)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌─────────────────────────────────────────────────────────────────────────────────────────────┐    │
│  │   [✓  1. Adresse] ──────── [✓  2. Bon de commande] ──────── [●  3. Paiement]               │    │
│  │      COMPLÉTÉ                    COMPLÉTÉ                        ACTIF                     │    │
│  └─────────────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                                      │
│  ┌───────────────────────────────────────────────────────┐  ┌──────────────────────────────────────┐│
│  │  ÉTAPE 3 — Paiement sécurisé                          │  │  RÉCAPITULATIF FINAL                 ││
│  ├───────────────────────────────────────────────────────┤  ├──────────────────────────────────────┤│
│  │                                                       │  │  Adresse livraison :                 ││
│  │  🔒 Paiement sécurisé SSL — Stripe                    │  │  Chantier Porte de la Défense        ││
│  │                                                       │  │  12 av. Charles de Gaulle            ││
│  │  ┌─────────────────────────────────────────────────┐  │  │  92800 Puteaux                      ││
│  │  │  [ STRIPE ELEMENTS — Numéro de carte ]          │  │  ├──────────────────────────────────────┤│
│  │  │  ████ ████ ████ ████                            │  │  │  N° BC : BC-2026-0142               ││
│  │  └─────────────────────────────────────────────────┘  │  ├──────────────────────────────────────┤│
│  │                                                       │  │  Câble NYY-J 4x16       145,50 € HT ││
│  │  ┌────────────────────┐  ┌──────────────────────────┐ │  │  Gaine ICTA Ø16          72,00 € HT ││
│  │  │  MM / AA           │  │  CVV  ···                 │ │  │  Disjoncteur 40A        110,00 € HT ││
│  │  └────────────────────┘  └──────────────────────────┘ │  ├──────────────────────────────────────┤│
│  │                                                       │  │  Sous-total HT          327,50 €    ││
│  │  [Visa] [Mastercard] [CB]  — Champs sécurisés Stripe  │  │  TVA (20%)               65,50 €    ││
│  │                                                       │  │  Livraison               12,00 €    ││
│  │                                                       │  ├──────────────────────────────────────┤│
│  │  ┌────────────────┐    ┌──────────────────────────┐   │  │  TOTAL TTC              405,00 €    ││
│  │  │  [← Retour]    │    │   [Confirmer et payer →] │   │  └──────────────────────────────────────┘│
│  │  └────────────────┘    └──────────────────────────┘   │                                          │
│  └───────────────────────────────────────────────────────┘                                          │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (étapes en accordéon vertical)

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 (3)│
├───────────────────────────┤
│  Finaliser ma commande    │
├───────────────────────────┤
│                           │
│ ┌─────────────────────────┐│
│ │ ✓ 1. Adresse  [modifier]││
│ │   Chantier Porte Défense││
│ │   92800 Puteaux         ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ ● 2. Bon de commande    ││
│ ├─────────────────────────┤│
│ │ N° BC interne *    [?]  ││
│ │ ┌─────────────────────┐ ││
│ │ │ BC-2026-0142        │ ││
│ │ └─────────────────────┘ ││
│ │                         ││
│ │ ┌─────────────────────┐ ││
│ │ │   [ Continuer →  ]  │ ││
│ │ └─────────────────────┘ ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ ○ 3. Paiement (verrouillé│
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ Sous-total HT  327,50 € ││
│ │ TVA             65,50 € ││
│ │ Livraison       12,00 € ││
│ │ TOTAL TTC      405,00 € ││
│ └─────────────────────────┘│
│                           │
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Stepper en haut avec états complété / actif / futur | Nielsen #1 — Visibilité de l'état | Thomas sait exactement où il en est dans le processus — réduit l'abandon en cours de checkout |
| N° BC obligatoire avec message explicite | Pain point Journey Map Thomas | Identifié lors de la cartographie : sans le N° BC, la commande est bloquée en interne — l'exiger ici évite les blocages post-achat |
| Tooltip sur champ N° BC | Nielsen #10 — Aide contextuelle | Format attendu précisé directement sur le champ — réduit les erreurs de saisie |
| Pré-remplissage N° BC depuis dernière commande | Nielsen #6 — Reconnaissance > rappel | Thomas utilise souvent le même préfixe BC — gain de temps en contexte chantier |
| Récapitulatif toujours visible à droite (desktop) | Nielsen #1 — Visibilité | L'acheteur B2B vérifie le total à chaque étape — position fixe à droite rassure |
| Stripe Elements (iframe sécurisée) | PCI DSS — hors scope Drupal | Les données CB ne transitent jamais par Drupal — réduction du scope PCI à SAQ A |
| Bouton [Confirmer et payer] distinct du [Continuer] | Nielsen #4 — Cohérence et conventions | L'action finale de paiement doit être visuellement différente des actions de navigation intermédiaires |
| Accordéon mobile : étapes verrouillées si précédente incomplète | Nielsen #5 — Prévention des erreurs | Empêche Thomas de sauter une étape obligatoire sur mobile (contexte chantier — saisie partielle) |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Stepper 3 étapes | `CheckoutFlowWithPanes` — Drupal Commerce checkout flow |
| Étape 1 — Formulaire adresse | `ShippingInformationPane` — `commerce_shipping` |
| Étape 2 — N° BC | `PurchaseOrderPane` — custom checkout pane |
| Pré-remplissage N° BC | `OrderLastPurchaseOrderResolver` — requête sur dernières commandes |
| Validation N° BC obligatoire | `PurchaseOrderPane::validatePaneForm()` — constraint NotBlank |
| Étape 3 — Stripe Elements | `commerce_stripe` — `StripeReviewPane` |
| Récapitulatif commande | `OrderSummaryBlock` — Drupal Commerce |
| Affichage HT + TVA + Total TTC | `TaxAdjustment` + Price resolvers Commerce |
| Accordéon mobile | CSS/JS — Bootstrap Collapse ou Drupal Behaviors |
