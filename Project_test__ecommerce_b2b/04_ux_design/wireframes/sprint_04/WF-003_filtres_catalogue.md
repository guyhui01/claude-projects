# Wireframe — WF-003 — Filtres catalogue avancés (AJAX)

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-003 — Filtres produits par référence, type de câble et conditionnement
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État nominal (filtres actifs, résultats rafraîchis AJAX)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (2)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  Catalogue  >  Câbles FTTH                                                                            │
├─────────────────────────────────────────┬────────────────────────────────────────────────────────────┤
│  FILTRES                               │  Résultats : 12 produits trouvés                           │
│  ─────────────────────────────────────  │                                                            │
│  Recherche par référence                │  Filtres actifs :                                          │
│  ┌─────────────────────────────────┐   │  [OM4 ×] [Bobine 100m ×] [Réinitialiser tout]              │
│  │ REF-AG-...                  [✗] │   │  ────────────────────────────────────────────              │
│  └─────────────────────────────────┘   │                                                            │
│                                        │  ┌────────────────────────────────────────────────────┐   │
│  Type de fibre                          │  │ [img] Câble OS1 9/125 — Ref REF-AG-1001         │   │
│  ○ Tous                                │  │ Bobine 100m · OS1 · Mono-mode                   │   │
│  ● OM3 50/125                          │  │ Prix HT : 32,50 €/bobine (tarif B2B)            │   │
│  ○ OM4 50/125                          │  │                                     [Ajouter au panier] │
│  ○ OM5 50/125                          │  └────────────────────────────────────────────────────┘   │
│  ○ OS1 9/125 (mono-mode)               │                                                            │
│                                        │  ┌────────────────────────────────────────────────────┐   │
│  Conditionnement                        │  │ [img] Câble OM4 50/125 — Ref REF-AG-2042        │   │
│  ☑ Bobine 100m                         │  │ Bobine 100m · OM4 · Multi-mode                  │   │
│  ☑ Bobine 300m                         │  │ Prix HT : 48,50 €/bobine (tarif B2B)            │   │
│  ☐ Bobine 500m                         │  │                                     [Ajouter au panier] │
│  ☐ Câble à l'unité (m)                 │  └────────────────────────────────────────────────────┘   │
│                                        │                                                            │
│  ┌───────────────────────────────────┐ │  ┌────────────────────────────────────────────────────┐   │
│  │  [ Appliquer les filtres ]        │ │  │ [img] Câble OM4 50/125 — Ref REF-AG-2043        │   │
│  └───────────────────────────────────┘ │  │ Bobine 300m · OM4 · Multi-mode                  │   │
│                                        │  │ Prix HT : 138,00 €/bobine (tarif B2B)           │   │
│                                        │  │                                     [Ajouter au panier] │
│                                        │  └────────────────────────────────────────────────────┘   │
│                                        │                                                            │
│                                        │  Affichage 1-3 sur 12    [1] [2] [3] [4] [Suivant →]      │
└─────────────────────────────────────────┴────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — Aucun résultat pour la combinaison de filtres

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)           │
├─────────────────────────────────────────┬────────────────────────────────────────────────────────────┤
│  FILTRES                               │  Résultats : 0 produit trouvé                              │
│  [idem état nominal]                   │                                                            │
│                                        │  Filtres actifs : [OM5 ×] [Bobine 500m ×]                  │
│                                        │                                                            │
│                                        │  ┌────────────────────────────────────────────────────┐   │
│                                        │  │                                                    │   │
│                                        │  │   [  🔍  ]                                         │   │
│                                        │  │                                                    │   │
│                                        │  │   Aucun produit ne correspond à vos filtres.       │   │
│                                        │  │                                                    │   │
│                                        │  │   Essayez de modifier ou réinitialiser vos         │   │
│                                        │  │   critères de recherche.                           │   │
│                                        │  │                                                    │   │
│                                        │  │   ┌──────────────────────────────────────────┐    │   │
│                                        │  │   │   [ Réinitialiser tous les filtres ]     │    │   │
│                                        │  │   └──────────────────────────────────────────┘    │   │
│                                        │  │                                                    │   │
│                                        │  └────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────┴────────────────────────────────────────────────────────────┘
```

---

### État 3 — Chips filtres actifs (suppression individuelle)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Filtres actifs :  [OM4 ×]  [Bobine 100m ×]  [Bobine 300m ×]  [REF-AG-20 ×]  [Réinitialiser tout]  │
│                                                                                                      │
│  ⟳  Chargement des résultats...   (indicateur AJAX — spinner discret)                                │
│  ──────────────────────────────────────────────────────────────────────                              │
│  [Liste résultats rafraîchie sans rechargement de page]                                              │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (filtres en accordéon)

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 (2)│
├───────────────────────────┤
│ Câbles FTTH               │
│                           │
│ ┌─────────────────────────┐│
│ │ Filtres  ▼              ││
│ └─────────────────────────┘│
│                           │
│ Filtres actifs :          │
│ [OM4 ×] [100m ×]          │
│                           │
│ 12 produits — [Afficher]  │
├───────────────────────────┤
│ ── Accordéon ouvert ──    │
│                           │
│ Référence                 │
│ ┌─────────────────────────┐│
│ │ REF-AG-...              ││
│ └─────────────────────────┘│
│                           │
│ Type de fibre             │
│ ○ Tous  ● OM4  ○ OM5      │
│                           │
│ Conditionnement           │
│ ☑ Bobine 100m             │
│ ☑ Bobine 300m             │
│ ☐ Bobine 500m             │
│                           │
│ ┌─────────────────────────┐│
│ │  [ Appliquer (12) ]     ││
│ └─────────────────────────┘│
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Chips filtres actifs avec croix individuelle | Nielsen #3 — Contrôle utilisateur | Thomas peut supprimer un filtre précis sans tout réinitialiser — gain de temps sur mobile chantier |
| AJAX sans rechargement | Nielsen #1 — Visibilité de l'état + Performance | Résultats immédiats — pas de perte de contexte de page (position scroll, état accordéon) |
| Spinner discret pendant AJAX | Nielsen #1 — Visibilité de l'état | Feedback minimal mais suffisant — ne bloque pas l'UI |
| URL mise à jour avec query params (deep-linking) | Accessibilité + partage | Thomas peut copier l'URL et la partager avec un collègue ou la retrouver en historique |
| Accordéon filtres sur mobile | Mobile best practice | Libère l'espace pour les résultats sur 375px — filtres repliés par défaut |
| "Réinitialiser tout" visible en permanence | Nielsen #3 — Contrôle utilisateur | Sortie de secours toujours accessible quand les filtres donnent 0 résultat |
| Badge quantité dans le bouton Appliquer mobile | Nielsen #1 — Visibilité | Thomas voit le nombre de résultats AVANT de fermer l'accordéon — décision éclairée |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Panneau filtres | Views Exposed Form — filtres exposés : `sku`, `field_fiber_type`, `field_packaging` |
| Résultats catalogue | Views Block AJAX — `catalog_by_category` — `use_ajax: true` |
| Chips filtres actifs | JS custom `catalog-filters.js` — `updateActiveFilterChips()` |
| Deep-linking URL | `window.history.replaceState()` sur event `ajaxSuccess` |
| Accordéon mobile | CSS media query + `catalog-filters.css` — toggle accordéon |
| Spinner AJAX | Drupal AJAX API — `throbber` automatique + custom CSS positionnement |
| Taxonomies filtres | `taxonomy.vocabulary.fiber_type` + `taxonomy.vocabulary.packaging` |
