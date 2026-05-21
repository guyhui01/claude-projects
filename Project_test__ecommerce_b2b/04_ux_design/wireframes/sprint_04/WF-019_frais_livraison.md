# Wireframe — WF-019 — Calcul frais de livraison automatique

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-019 — Calcul automatique des frais de livraison (Chronopost / Colissimo)
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État nominal (étape Livraison du checkout, méthodes affichées)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (3)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌─────────────────────────────────────────────────────────────────────────────────────────────┐    │
│  │   [✓  1. Adresse] ──────── [●  2. Livraison] ──────── [○  3. Paiement]                      │    │
│  └─────────────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                                      │
│  ┌───────────────────────────────────────────────────────┐  ┌──────────────────────────────────────┐│
│  │  MÉTHODE DE LIVRAISON                                 │  │  RÉCAPITULATIF                       ││
│  ├───────────────────────────────────────────────────────┤  ├──────────────────────────────────────┤│
│  │                                                       │  │  Câble NYY-J 4x16 ×3    145,50 € HT ││
│  │  Livraison vers : Chantier Porte de la Défense        │  │  Gaine ICTA Ø16 ×10      72,00 € HT ││
│  │  92400 Courbevoie                                     │  │  Disjoncteur 40A ×5     110,00 € HT ││
│  │  [Modifier l'adresse]                                 │  ├──────────────────────────────────────┤│
│  │                                                       │  │  Sous-total HT           327,50 €   ││
│  │  Poids estimé : 4,2 kg                                │  │  TVA (20%)                65,50 €   ││
│  │                                                       │  │  Livraison               [En cours] ││
│  │  ─────────────────────────────────────────────────   │  ├──────────────────────────────────────┤│
│  │                                                       │  │  TOTAL TTC               [En cours] ││
│  │  ● Chronopost Express 24h              12,00 € HT     │  └──────────────────────────────────────┘│
│  │    Livraison estimée : demain avant 13h               │                                          │
│  │    Recommandé pour les commandes urgentes             │                                          │
│  │                                                       │                                          │
│  │  ○ Colissimo Standard 3-5 jours         7,50 € HT     │                                          │
│  │    Livraison estimée : 24/05/2026                     │                                          │
│  │    Pour les commandes non urgentes                    │                                          │
│  │                                                       │                                          │
│  │  ─────────────────────────────────────────────────   │                                          │
│  │  ℹ  Tarifs calculés selon le poids et code postal.   │                                          │
│  │     Les frais de port affichés incluent le           │                                          │
│  │     conditionnement des câbles.                      │                                          │
│  │                                                       │                                          │
│  │  ┌──────────────────────────────┐                    │                                          │
│  │  │  [ Continuer vers Paiement →]│                    │                                          │
│  │  └──────────────────────────────┘                    │                                          │
│  └───────────────────────────────────────────────────────┘                                          │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — Calcul en cours (appel API Chronopost)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  MÉTHODE DE LIVRAISON                                                                                 │
│                                                                                                      │
│  Livraison vers : 92400 Courbevoie · Poids : 4,2 kg                                                  │
│                                                                                                      │
│  ┌────────────────────────────────────────────────────────────────────────────────────────────┐      │
│  │  ⟳  Calcul des frais de livraison en cours...                                              │      │
│  │     Veuillez patienter quelques secondes.                                                  │      │
│  └────────────────────────────────────────────────────────────────────────────────────────────┘      │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 3 — API Chronopost indisponible (fallback grille tarifaire locale)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  MÉTHODE DE LIVRAISON                                                                                 │
│                                                                                                      │
│  ⚠  Tarifs indicatifs (service en ligne temporairement indisponible)                                 │
│                                                                                                      │
│  ● Chronopost Express 24h              12,00 € HT  (tarif estimé)                                   │
│    Délai indicatif : J+1                                                                             │
│                                                                                                      │
│  ○ Colissimo Standard                   7,50 € HT  (tarif estimé)                                   │
│    Délai indicatif : 3-5 jours                                                                       │
│                                                                                                      │
│  ℹ  Le tarif final sera confirmé à la validation de la commande.                                    │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 4 — Récapitulatif mis à jour après sélection méthode

```
┌────────────────────────────────────────┐
│  RÉCAPITULATIF                         │
├────────────────────────────────────────┤
│  Sous-total HT          327,50 €       │
│  TVA (20%)               65,50 €       │
│  Livraison Chronopost    12,00 €       │
├────────────────────────────────────────┤
│  TOTAL TTC              405,00 €       │
└────────────────────────────────────────┘
```

---

## Mobile — 375px (méthodes de livraison empilées)

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 (3)│
├───────────────────────────┤
│  [✓ 1.Adresse] [●2.Livr.] │
│  [○ 3.Paiement]           │
├───────────────────────────┤
│                           │
│ Livraison vers :          │
│ 92400 Courbevoie          │
│ Poids : 4,2 kg            │
│ [Modifier]                │
│                           │
│ ┌─────────────────────────┐│
│ │ ● Chronopost Express    ││
│ │   Livraison J+1         ││
│ │   12,00 € HT            ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ ○ Colissimo 3-5 jours   ││
│ │   7,50 € HT             ││
│ └─────────────────────────┘│
│                           │
│ ─────────────────────     │
│ Sous-total HT  327,50 €   │
│ Livraison       12,00 €   │
│ TVA (20%)       67,90 €   │
│ ─────────────────────     │
│ TOTAL TTC      407,40 €   │
│                           │
│ ┌─────────────────────────┐│
│ │ [ Continuer →  407,40 €]││
│ └─────────────────────────┘│
│   ↑ Sticky en bas d'écran  │
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| 2 méthodes de livraison max au checkout | Nielsen #8 — Esthétique et minimalisme | Trop de choix = paralysie décisionnelle pour Thomas sous pression (chantier) |
| Délai estimé affiché avec la date concrète | Nielsen #1 — Visibilité | "Demain avant 13h" est actionnable — "J+1" est abstrait — Thomas planifie ses réceptions |
| Total TTC mis à jour dynamiquement | Nielsen #1 — Visibilité de l'état | Le montant final change quand Thomas change de méthode — pas d'opacité sur le coût final |
| Message fallback discret (pas d'erreur bloquante) | Nielsen #9 — Aide à la récupération | API indisponible ≠ tunnel cassé — Thomas peut continuer avec un tarif estimé |
| Calcul loading spinner avant affichage tarifs | Nielsen #1 — Feedback système | Appel API Chronopost peut prendre 2-3 secondes — indicateur = confiance dans le système |
| Poids estimé affiché | Transparence B2B | Thomas comprend la base du calcul — réduit les demandes SAV "pourquoi ce prix de port ?" |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Étape Livraison checkout | `commerce_checkout` — pane `ShippingInformationPane` |
| Méthodes de livraison | `ChronopostShippingMethod` + `ColissimoShippingMethod` (plugins Commerce Shipping) |
| Calcul frais temps réel | `ShippingRateCalculatorService` — API Chronopost + cache Redis TTL 3600s |
| Fallback grille locale | `ShippingRateCalculatorService::getFallbackRate()` — catch API exception |
| Spinner loading | Commerce Checkout AJAX + CSS `throbber` custom |
| Récapitulatif mis à jour | Event `ShippingRatesEvent` → recalcul order summary AJAX |
| Délai estimé | `getEstimatedDeliveryDate()` dans `ChronopostShippingMethod` |
