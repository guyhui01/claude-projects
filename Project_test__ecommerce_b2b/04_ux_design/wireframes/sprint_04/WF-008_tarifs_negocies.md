# Wireframe — WF-008 — Tarifs négociés spécifiques par client B2B

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-008 — Affichage des prix négociés sur la fiche produit et le panier
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État nominal (Thomas Mercier avec tarif négocié actif)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  Catalogue  >  Câbles FTTH  >  Câble NYY-J 4x16mm²                                                   │
│                                                                                                      │
│  ┌──────────────────────────┐  ┌──────────────────────────────────────────────────────────────────┐  │
│  │                          │  │  Câble électrique NYY-J 4x16mm² — Bobine 100m                   │  │
│  │   [IMAGE PRODUIT]        │  │  Réf. : REF-AG-4520                                             │  │
│  │                          │  │                                                                  │  │
│  │   REF-AG-4520            │  │  ┌────────────────────────────────────────────────────────────┐  │  │
│  │                          │  │  │  💰 Votre tarif négocié                                    │  │  │
│  │                          │  │  │                                                            │  │  │
│  │                          │  │  │   Prix public HT    ~~58,50 €~~   (barré)                  │  │  │
│  │                          │  │  │   Prix B2B standard  48,50 €     (barré, gris)             │  │  │
│  │                          │  │  │                                                            │  │  │
│  │                          │  │  │   ★ Votre prix négocié :   38,90 € HT / bobine            │  │  │
│  │                          │  │  │      Économie : -9,60 € vs tarif B2B (-19,8%)             │  │  │
│  └──────────────────────────┘  │  └────────────────────────────────────────────────────────────┘  │  │
│                                │                                                                  │  │
│                                │  Conditionnement :                                               │  │
│                                │  ● Bobine 100m (38,90 € HT)                                     │  │
│                                │  ○ Bobine 300m (110,00 € HT)                                    │  │
│                                │  ○ Bobine 500m (178,00 € HT)                                    │  │
│                                │                                                                  │  │
│                                │  Quantité :  [−] [ 1 ] [+]   (min. commande : 1 bobine)         │  │
│                                │                                                                  │  │
│                                │  ┌──────────────────────────────────────────────────────────┐   │  │
│                                │  │   [ Ajouter au panier — 38,90 € HT  →  ]                 │   │  │
│                                │  └──────────────────────────────────────────────────────────┘   │  │
│                                └──────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — Acheteur B2B sans tarif négocié (prix B2B standard)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher...]        Jean Dupont ▼  🛒 Panier (0)                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌──────────────────────────┐  ┌──────────────────────────────────────────────────────────────────┐  │
│  │  [IMAGE PRODUIT]         │  │  Câble électrique NYY-J 4x16mm² — Bobine 100m                   │  │
│  │  REF-AG-4520             │  │                                                                  │  │
│  │                          │  │  Prix HT : 48,50 € / bobine                                     │  │
│  │                          │  │  (tarif B2B enregistré)                                         │  │
│  │                          │  │                                                                  │  │
│  └──────────────────────────┘  │  Quantité : [−] [ 1 ] [+]                                       │  │
│                                │                                                                  │  │
│                                │  ┌──────────────────────────────────────────────────────────┐   │  │
│                                │  │   [ Ajouter au panier — 48,50 € HT  →  ]                 │   │  │
│                                │  └──────────────────────────────────────────────────────────┘   │  │
│                                └──────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 3 — Back-office admin — Gestion des prix négociés

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test BACK-OFFICE — Administration                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  Utilisateurs  >  Thomas Mercier  >  Prix négociés                                                    │
│                                                                                                      │
│  ┌────────────────────────────────────────────────────────────────────────────────────────────────┐  │
│  │  Prix négociés pour : Thomas Mercier (ID#42) — Électricité Mercier SARL                       │  │
│  ├──────────────────┬──────────────────────────────────────────┬──────────────┬──────────────────┤  │
│  │  Variation       │  Produit                                  │  Prix HT (€) │  Action          │  │
│  ├──────────────────┼──────────────────────────────────────────┼──────────────┼──────────────────┤  │
│  │  REF-AG-4520     │  Câble NYY-J 4x16mm² Bobine 100m         │  38,90 €     │  [Modifier] [✗]  │  │
│  ├──────────────────┼──────────────────────────────────────────┼──────────────┼──────────────────┤  │
│  │  REF-AG-4521     │  Câble NYY-J 4x16mm² Bobine 300m         │  105,00 €    │  [Modifier] [✗]  │  │
│  ├──────────────────┼──────────────────────────────────────────┼──────────────┼──────────────────┤  │
│  │  REF-AG-7801     │  Disjoncteur 40A 30mA Pièce              │  18,50 €     │  [Modifier] [✗]  │  │
│  ├──────────────────┼──────────────────────────────────────────┼──────────────┼──────────────────┤  │
│  │  [ Variation...] │  [Saisir ou choisir un produit...]        │  [0,00     ] │  [+ Ajouter]     │  │
│  └──────────────────┴──────────────────────────────────────────┴──────────────┴──────────────────┘  │
│                                                                                                      │
│  ┌─────────────────────────────────────────────────┐                                                 │
│  │   [ Enregistrer les prix négociés ]             │                                                 │
│  └─────────────────────────────────────────────────┘                                                 │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (tarif négocié mis en avant)

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 (0)│
├───────────────────────────┤
│ Câble NYY-J 4x16mm²       │
│ REF-AG-4520               │
├───────────────────────────┤
│ [IMAGE PRODUIT]           │
├───────────────────────────┤
│                           │
│ ┌─────────────────────────┐│
│ │ 💰 Votre tarif négocié  ││
│ │                         ││
│ │ ~~48,50 €~~ (barré)     ││
│ │                         ││
│ │ ★ 38,90 € HT/bobine     ││
│ │ Éco. -19,8%             ││
│ └─────────────────────────┘│
│                           │
│ Conditionnement :         │
│ ● Bobine 100m             │
│ ○ Bobine 300m             │
│                           │
│ Qté : [−] [1] [+]        │
│                           │
│ ┌─────────────────────────┐│
│ │ [Ajouter — 38,90 € HT] ││
│ └─────────────────────────┘│
│   ↑ Sticky en bas d'écran  │
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Bloc tarif négocié mis en évidence (fond coloré) | Nielsen #1 — Visibilité + Motivation | Thomas doit identifier immédiatement qu'il bénéficie d'un avantage — différenciation visuelle forte |
| Affichage barré du tarif standard | Convention e-commerce B2B | Valorise le prix négocié par contraste — Thomas voit l'économie réalisée sans calcul mental |
| Montant économisé en % et €  | Déclencheur psychologique | Renforce la fidélité client — Thomas valorise sa relation commerciale avec Company-Test |
| Fallback silencieux vers tarif B2B standard | Nielsen #7 — Flexibilité | L'acheteur sans prix négocié ne voit aucun message d'erreur — comportement transparent |
| Back-office — autocomplete variation produit | Efficacité admin | Isabelle Royer saisit le début de la référence SKU sans naviguer dans tout le catalogue |
| Badge "★ Votre prix négocié" | Personnalisation | Sentiment d'accord commercial exclusif — renforce la relation B2B long terme |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Bloc prix négocié sur fiche produit | `CustomerPriceSubscriber` — override `PriceCalculateEvent` — priorité +10 |
| Affichage prix barré | `commerce_price` — formatter `calculated_price` + Twig custom |
| Calcul économie (-19,8%) | Twig — `((standard - negotiated) / standard * 100)|round(1)` |
| Badge "Votre tarif négocié" | Condition Twig sur `field_prix_negocie` de l'utilisateur courant |
| Back-office `/admin/Company-Test/prix-negocies/{user}` | `NegotiatedPriceAdminForm` — entity_autocomplete variation |
| Persistance prix JSON | `field_prix_negocie` — Map field sur User — `json_encode` / `json_decode` |
| Sticky CTA mobile | CSS `position: sticky; bottom: 0` sur `.add-to-cart-wrapper` |
