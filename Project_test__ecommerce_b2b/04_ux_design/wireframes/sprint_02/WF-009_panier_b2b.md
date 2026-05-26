# Wireframe — WF-009 — Panier B2B

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-009 — Gestion du panier acheteur B2B
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État nominal (panier avec articles)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (3)  [↗]     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  Mon panier                                              [← Continuer mes achats]                   │
│  ─────────────────────────────────────────────────────────────────────────────────────────────────  │
│                                                                                                      │
│  ┌──────────────────────┬──────────────────┬──────────────────┬────────────┬──────────────┬───────┐  │
│  │ Produit              │ Référence        │ Conditionnement  │ Quantité   │ Prix HT/m    │ Total │  │
│  ├──────────────────────┼──────────────────┼──────────────────┼────────────┼──────────────┼───────┤  │
│  │ [img] Câble          │ REF-AG-4520      │ Bobine 100m      │ [−] [ 3 ] [+] │  48,50 €   │ 145,50 € │
│  │ électrique NYY-J     │                  │                  │            │  HT/bobine   │ HT    │  │
│  │ 4x16mm²              │                  │                  │            │              │ [🗑]  │  │
│  ├──────────────────────┼──────────────────┼──────────────────┼────────────┼──────────────┼───────┤  │
│  │ [img] Gaine ICTA     │ REF-AG-2210      │ Couronne 25m     │ [−] [ 10] [+] │   7,20 €   │  72,00 € │
│  │ Ø16 grise            │                  │                  │            │  HT/couronne │ HT    │  │
│  │                      │                  │                  │            │              │ [🗑]  │  │
│  ├──────────────────────┼──────────────────┼──────────────────┼────────────┼──────────────┼───────┤  │
│  │ [img] Disjoncteur    │ REF-AG-7801      │ Pièce unitaire   │ [−] [ 5 ] [+] │  22,00 €   │ 110,00 € │
│  │ diff 40A 30mA        │                  │                  │            │  HT/pièce    │ HT    │  │
│  │                      │                  │                  │            │              │ [🗑]  │  │
│  └──────────────────────┴──────────────────┴──────────────────┴────────────┴──────────────┴───────┘  │
│                                                                                                      │
│  ┌──────────────────────────────────────────────────────────────────────────────────────────────┐    │
│  │                                                             Sous-total HT    327,50 €         │    │
│  │                                                             ──────────────────────────────    │    │
│  │                                                             TVA (20%)         65,50 €         │    │
│  │                                                             Livraison         À calculer       │    │
│  │                                                                                               │    │
│  │                                                    ┌─────────────────────────────────────┐   │    │
│  │                                                    │  [ Passer commande →  393,00 € TTC ]│   │    │
│  │                                                    └─────────────────────────────────────┘   │    │
│  └──────────────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                                      │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — Panier vide

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  Mon panier                                                                                          │
│  ─────────────────────────────────────────────────────────────────────────────────────────────────  │
│                                                                                                      │
│                          ┌───────────────────────────────────────────┐                              │
│                          │                                           │                              │
│                          │         [  🛒  ]                          │                              │
│                          │                                           │                              │
│                          │   Votre panier est vide                   │                              │
│                          │                                           │                              │
│                          │   Parcourez notre catalogue pour          │                              │
│                          │   ajouter des produits.                   │                              │
│                          │                                           │                              │
│                          │   ┌─────────────────────────────────┐     │                              │
│                          │   │   [ Accéder au catalogue →  ]   │     │                              │
│                          │   └─────────────────────────────────┘     │                              │
│                          │                                           │                              │
│                          └───────────────────────────────────────────┘                              │
│                                                                                                      │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 3 — Accès anonyme (redirect vers login)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]              [Se connecter]  [Créer un compte]  │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│                          ┌───────────────────────────────────────────────────┐                      │
│                          │                                                   │                      │
│                          │  🔒  Accès réservé aux acheteurs B2B               │                      │
│                          │                                                   │                      │
│                          │  Vous devez être connecté avec un compte          │                      │
│                          │  acheteur validé pour accéder au panier.          │                      │
│                          │                                                   │                      │
│                          │  ┌───────────────────────┐  ┌───────────────────┐│                      │
│                          │  │  [ Se connecter ]      │  │ [ Créer un compte]││                      │
│                          │  └───────────────────────┘  └───────────────────┘│                      │
│                          │                                                   │                      │
│                          └───────────────────────────────────────────────────┘                      │
│                                                                                                      │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (état nominal)

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 (3)│
├───────────────────────────┤
│ Mon panier                │
├───────────────────────────┤
│                           │
│ ┌─────────────────────────┐│
│ │ [img] Câble NYY-J 4x16  ││
│ │ REF-AG-4520             ││
│ │ Bobine 100m             ││
│ │ 48,50 € HT/bobine       ││
│ │                         ││
│ │   [−]  [ 3 ]  [+]       ││
│ │              145,50 € HT││
│ │                    [🗑] ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ [img] Gaine ICTA Ø16    ││
│ │ REF-AG-2210             ││
│ │ Couronne 25m            ││
│ │ 7,20 € HT/couronne      ││
│ │                         ││
│ │   [−]  [ 10]  [+]       ││
│ │               72,00 € HT││
│ │                    [🗑] ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ [img] Disjoncteur 40A   ││
│ │ REF-AG-7801             ││
│ │ Pièce unitaire          ││
│ │ 22,00 € HT/pièce        ││
│ │                         ││
│ │   [−]  [  5]  [+]       ││
│ │              110,00 € HT││
│ │                    [🗑] ││
│ └─────────────────────────┘│
│                           │
│                           │
│ ┌─────────────────────────┐│
│ │ Sous-total HT  327,50 € ││
│ │ ─────────────────────── ││
│ │ [Passer commande →]     ││
│ │     393,00 € TTC        ││
│ └─────────────────────────┘│
│   ↑ Sticky en bas d'écran  │
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Prix affichés HT uniquement | Convention B2B obligatoire | Les acheteurs B2B raisonnent toujours en HT — afficher TTC serait source de confusion dans le contexte professionnel |
| Total ligne recalculé en temps réel (Ajax) | Nielsen #1 — Visibilité de l'état | Thomas voit immédiatement l'impact d'un changement de quantité sans recharger la page |
| Stepper quantité [−] [n] [+] | Nielsen #3 — Contrôle utilisateur | Saisie directe + boutons ± — adapté aux quantités importantes du B2B |
| Accès restreint `b2b_buyer` avec message explicite | Nielsen #9 — Messages d'erreur clairs | Un visiteur non connecté comprend pourquoi il ne peut pas accéder et comment débloquer la situation |
| CTA [Continuer mes achats] toujours présent | Nielsen #3 — Liberté et contrôle | Thomas consulte souvent plusieurs chantiers — retour catalogue sans friction |
| CTA sticky mobile en bas | Mobile best practice Google UX | Sur chantier, Thomas accède au CTA d'une main sans scroller — zone pouce accessible |
| Bouton [🗑] (supprimer article) avec confirmation | Nielsen #9 — Prévention des erreurs | Suppression accidentelle d'une ligne importante à éviter — confirmation légère au tap |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Liste articles panier | `commerce_cart` — `OrderItem` entities |
| Stepper quantité Ajax | `commerce_cart` — AJAX callback `updateCartForm` |
| Total recalcul temps réel | Commerce Price Resolver + `AjaxResponse` |
| Restriction accès anonyme | `B2bCartAccessSubscriber` — `AccessResult::forbidden()` sur route `commerce_cart.page` |
| Bouton [Passer commande] | Lien vers `commerce_checkout.form` route |
| Affichage prix HT | Price formatter avec `price_display = excluding_tax` |
| Panier vide — lien catalogue | Vue catalogue Drupal — route `view.product_catalog.page` |
| CTA sticky mobile | CSS `position: sticky; bottom: 0` sur bloc récapitulatif |
