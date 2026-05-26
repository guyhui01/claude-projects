# Wireframe — WF-001 — Catalogue par catégorie

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-001 — Navigation catalogue par catégorie
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — 1280px

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ HEADER                                                                      │
│ [Logo Company-Test]        [Catalogue] [Mon compte ▼]    🛒 Panier (3)  [Déco]  │
├─────────────────────────────────────────────────────────────────────────────┤
│ BREADCRUMB                                                                  │
│ Accueil > Catalogue > Câbles FTTH                                           │
├──────────────┬──────────────────────────────────────────────────────────────┤
│ SIDEBAR      │ LISTE PRODUITS                                               │
│ FILTRES      │                                                              │
│              │  Câbles FTTH  (12 produits)              [Trier par ▼]      │
│ Catégories   │  ─────────────────────────────────────────────────────────  │
│ ┌──────────┐ │                                                              │
│ │●Câbles   │ │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│ │  FTTH(12)│ │  │  [IMG]      │  │  [IMG]      │  │  [IMG]      │        │
│ │○Boîtiers │ │  │─────────────│  │─────────────│  │─────────────│        │
│ │  fibres  │ │  │ Câble 4FO   │  │ Câble 8FO   │  │ Câble 12FO  │        │
│ │  (8)     │ │  │ G657A2      │  │ G657A2      │  │ LSZH        │        │
│ │○Accessoir│ │  │ Réf: FTTH-04│  │ Réf: FTTH-08│  │ Réf: FTTH-12│        │
│ │  es (0)  │ │  │             │  │             │  │             │        │
│ └──────────┘ │  │ 12,50€ HT/m │  │ 18,90€ HT/m │  │ 24,50€ HT/m│        │
│              │  │ [+ Panier]  │  │ [+ Panier]  │  │ [+ Panier] │        │
│              │  └─────────────┘  └─────────────┘  └─────────────┘        │
│              │                                                              │
│              │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│              │  │  [IMG]      │  │  [IMG]      │  │  [IMG]      │        │
│              │  │─────────────│  │─────────────│  │─────────────│        │
│              │  │ Câble 24FO  │  │ Câble Drop  │  │ Câble armé  │        │
│              │  │ ...         │  │ ...         │  │ ...         │        │
│              │  └─────────────┘  └─────────────┘  └─────────────┘        │
│              │                                                              │
│              │  ←  1  2  3  4  →                                           │
├──────────────┴──────────────────────────────────────────────────────────────┤
│ FOOTER                                                                      │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Cas : Catégorie vide (Accessoires)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ BREADCRUMB : Accueil > Catalogue > Accessoires                              │
├──────────────┬──────────────────────────────────────────────────────────────┤
│ SIDEBAR      │                                                              │
│ (identique)  │         [Icône boîte vide]                                   │
│              │                                                              │
│              │    Aucun produit disponible dans cette catégorie             │
│              │                                                              │
│              │    [ ← Retour au catalogue complet ]                         │
└──────────────┴──────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px

```
┌───────────────────────┐
│ [≡] [Logo]    [🛒 3]  │
├───────────────────────┤
│ Accueil > Câbles FTTH │
├───────────────────────┤
│ [Filtrer ▼] [Trier ▼] │
├───────────────────────┤
│ Câbles FTTH (12)      │
├───────────────────────┤
│ ┌─────────────────┐   │
│ │ [IMG]           │   │
│ │ Câble 4FO G657  │   │
│ │ Réf: FTTH-04    │   │
│ │ 12,50€ HT/m     │   │
│ │ [Ajouter panier]│   │
│ └─────────────────┘   │
│ ┌─────────────────┐   │
│ │ [IMG]           │   │
│ │ Câble 8FO G657  │   │
│ │ ...             │   │
│ └─────────────────┘   │
│    [Voir plus ↓]      │
└───────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Prix produit | Toujours affiché HT + unité (€/m) | Obligation B2B — TVA déclarée côté acheteur |
| Prix masqué | Remplacer prix par "Connectez-vous" si anonyme | Confidentialité tarifs négociés |
| Sidebar catégories | Radio buttons — une seule catégorie active | Évite confusion filtrage multiple |
| Compteur résultats | "X produits" affiché sous le titre catégorie | Orientation utilisateur (heuristique Nielsen #1) |
| Catégorie vide | Message + lien retour catalogue | Éviter cul-de-sac de navigation |
| Breadcrumb | Chaque niveau = lien cliquable | Heuristique Nielsen #3 — liberté de navigation |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|--------------|----------------------|
| Grille produits | Views — format "Grid" |
| Sidebar filtres | Views exposed filters |
| Breadcrumb | Easy Breadcrumb module |
| Compteur résultats | Views — "Items per page" summary |
| Pagination | Views built-in pagination |
