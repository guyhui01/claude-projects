# Wireframe — WF-013 — Dashboard back-office commandes

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-013 — Tableau de bord de gestion des commandes (admin Isabelle Royer)
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État nominal (commandes du jour)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test BACK-OFFICE                                      Isabelle Royer [Admin] ▼  [Déconnexion]    │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌────────────────────┐  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ NAVIGATION ADMIN   │  │  Gestion des commandes                                                 │  │
│  ├────────────────────┤  ├────────────────────────────────────────────────────────────────────────┤  │
│  │ > Commandes    [!] │  │                                                                        │  │
│  │ > Comptes B2B  [3] │  │  ┌──────────────┐  ┌──────────────┐  ┌─────────────────┐  ┌────────┐  │  │
│  │ > Produits         │  │  │ Commandes     │  │ CA du jour   │  │ En attente      │  │À expé- │  │  │
│  │ > Export           │  │  │ aujourd'hui   │  │              │  │                 │  │dier    │  │  │
│  │                    │  │  │               │  │              │  │                 │  │        │  │  │
│  │                    │  │  │     12        │  │  4 820 € HT  │  │       5         │  │   3    │  │  │
│  │                    │  │  └──────────────┘  └──────────────┘  └─────────────────┘  └────────┘  │  │
│  │                    │  │                                                                        │  │
│  │                    │  │  ─────────────────────────────────────────────────────────────────     │  │
│  │                    │  │  FILTRES                                                               │  │
│  │                    │  │                                                                        │  │
│  │                    │  │  Statut                   Date de              Acheteur                │  │
│  │                    │  │  ┌──────────────────────┐  ┌─────┐  ┌─────┐   ┌──────────────────────┐ │  │
│  │                    │  │  │ Tous les statuts   ▼ │  │Du   │  │Au   │   │ Rechercher...      ↵ │ │  │
│  │                    │  │  └──────────────────────┘  └─────┘  └─────┘   └──────────────────────┘ │  │
│  │                    │  │    · Tous                                                              │  │
│  │                    │  │    · En attente                  [Appliquer les filtres]               │  │
│  │                    │  │    · En préparation                                                    │  │
│  │                    │  │    · Expédié                                                           │  │
│  │                    │  │    · Livré                                                             │  │
│  │                    │  │    · Annulé                                                            │  │
│  └────────────────────┘  │                                                                        │
│                           │  ─────────────────────────────────────────────────────────────────     │
│                           │  LISTE DES COMMANDES                        [Exporter CSV ↓]          │
│                           │                                                                        │
│                           │  ┌───────────┬──────────────┬──────────────┬──────────┬──────────┬──────────┬──────────────────┬──────────────────────┐ │
│                           │  │ N° commande│ Acheteur    │ Raison soc.  │ Date     │ Montant HT│ N° BC   │ Statut           │ Actions              │ │
│                           │  ├───────────┼──────────────┼──────────────┼──────────┼──────────┼──────────┼──────────────────┼──────────────────────┤ │
│                           │  │ CMD-1042  │ T. Mercier   │ Dupont TP    │ 20/05    │  327,50 €│ BC-2026-0142│ [En attente]  │ [Voir] [Changer]     │ │
│                           │  ├───────────┼──────────────┼──────────────┼──────────┼──────────┼──────────┼──────────────────┼──────────────────────┤ │
│                           │  │ CMD-1041  │ M. Durand    │ BTP Moreau   │ 20/05    │  890,00 €│ BC-0089   │ [En préparation] │ [Voir] [Changer]     │ │
│                           │  ├───────────┼──────────────┼──────────────┼──────────┼──────────┼──────────┼──────────────────┼──────────────────────┤ │
│                           │  │ CMD-1040  │ J. Klein     │ Chantiers3D  │ 19/05    │ 1 205,00 €│ BC-0301  │ [Expédié]        │ [Voir] [Changer]     │ │
│                           │  ├───────────┼──────────────┼──────────────┼──────────┼──────────┼──────────┼──────────────────┼──────────────────────┤ │
│                           │  │ CMD-1039  │ T. Mercier   │ Dupont TP    │ 18/05    │  512,00 €│ BC-2026-0140│ [Livré]       │ [Voir]               │ │
│                           │  ├───────────┼──────────────┼──────────────┼──────────┼──────────┼──────────┼──────────────────┼──────────────────────┤ │
│                           │  │ CMD-1038  │ A. Bernard   │ Elec Services│ 18/05    │  240,00 €│ BC-0211   │ [Annulé]         │ [Voir]               │ │
│                           │  └───────────┴──────────────┴──────────────┴──────────┴──────────┴──────────┴──────────────────┴──────────────────────┘ │
│                           │                                                                        │
│                           │  Affichage 1-5 sur 37 commandes                                        │
│                           │  [← Précédent]   [1] [2] [3] ... [8]   [Suivant →]                    │
│                           │                                                                        │
│                           └────────────────────────────────────────────────────────────────────────┘
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

Légende badges statut :
- [En attente]     = fond jaune / texte orange
- [En préparation] = fond bleu / texte bleu foncé
- [Expédié]        = fond violet / texte violet
- [Livré]          = fond vert / texte vert
- [Annulé]         = fond gris / texte gris

---

## États d'erreur / messages contextuels

### État 2 — Filtres sans résultat

```
┌────────────────────────────────────────────────────────────────────┐
│  LISTE DES COMMANDES                        [Exporter CSV ↓]       │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│                    [  🔍  ]                                        │
│                                                                    │
│        Aucune commande ne correspond à vos filtres.               │
│                                                                    │
│        Statut : Expédié · Période : 01/01 → 01/01                 │
│                                                                    │
│        ┌──────────────────────────────────────┐                   │
│        │     [ Réinitialiser les filtres ]     │                   │
│        └──────────────────────────────────────┘                   │
│                                                                    │
└────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (cards par commande — version simplifiée)

```
┌───────────────────────────┐
│ ≡  BACK-OFFICE Company-Test    │
├───────────────────────────┤
│ Commandes                 │
│ Filtrer par statut: [Tous▼]│
├───────────────────────────┤
│                           │
│ ┌─────────────────────────┐│
│ │ CMD-1042                ││
│ │ T. Mercier — Dupont TP  ││
│ │ 20/05/2026 · 327,50 € HT││
│ │ BC-2026-0142            ││
│ │ [En attente]            ││
│ │ [Voir →]  [Changer ↕]   ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ CMD-1041                ││
│ │ M. Durand — BTP Moreau  ││
│ │ 20/05/2026 · 890,00 € HT││
│ │ BC-0089                 ││
│ │ [En préparation]        ││
│ │ [Voir →]  [Changer ↕]   ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ CMD-1040                ││
│ │ J. Klein — Chantiers3D  ││
│ │ 19/05/2026 · 1205 € HT  ││
│ │ BC-0301                 ││
│ │ [Expédié]               ││
│ │ [Voir →]                ││
│ └─────────────────────────┘│
│                           │
│ [Afficher 37 commandes]   │
│                           │
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| KPIs en haut de page (4 compteurs) | Nielsen #1 — Visibilité de l'état du système | Isabelle voit en un coup d'oeil la charge du jour sans scroller — décision immédiate sur les priorités |
| Badges colorés par statut | Nielsen #1 & #4 — Cohérence | Code couleur intuitif et cohérent avec la vue acheteur (Thomas voit les mêmes couleurs) |
| Filtres combinables (statut + date + acheteur) | Nielsen #7 — Flexibilité et efficacité | Isabelle filtre par statut le matin, par acheteur lors d'un appel client — 3 axes de recherche |
| Bouton [Exporter CSV] positionné en haut du tableau | Nielsen #7 — Efficacité | Accès rapide à l'export depuis la liste filtrée — sans navigation supplémentaire |
| Pagination (37 commandes, 5 par page) | Bonne pratique admin | Eviter la surcharge cognitive avec des listes infinies — 5 lignes lisibles sur 1280px |
| Message vide avec [Réinitialiser les filtres] | Nielsen #9 — Aide à la récupération d'erreur | Isabelle comprend pourquoi la liste est vide et peut agir sans frustration |
| Colonne N° BC visible dans le tableau | Pain point métier identifié | Le N° BC est la clé de rapprochement avec la comptabilité chez les clients CAC40 |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Tableau commandes | Views admin — `commerce_order` — filtre exposé multi-critères |
| KPIs (4 compteurs) | Drupal Blocks personnalisés — requêtes SQL/EntityQuery sur `commerce_order` |
| Filtre statut dropdown | Views filter — `order_state` field — states exposés |
| Filtre date picker | Views filter — `placed` field — Between date avec date_popup |
| Filtre acheteur autocomplete | Views filter — `uid` — autocomplete widget |
| Badges statut colorés | Views field formatter personnalisé — CSS class par state |
| Bouton [Exporter CSV] | Views data export (module) — ou lien `commerce_order` export custom |
| Pagination | Views pager — 5 items par page |
| Changement statut depuis liste | Views bulk operation ou lien inline vers `OrderStatusForm` |
| Theme admin | Custom admin theme (Claro base) — surcharge CSS |
