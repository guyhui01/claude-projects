# Wireframe — WF-012 — Historique commandes acheteur

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-012 — Consultation de l'historique des commandes par l'acheteur B2B
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État nominal (liste des commandes de Thomas)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌────────────────────┐  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ MON COMPTE         │  │  Mes commandes                                                         │  │
│  ├────────────────────┤  ├────────────────────────────────────────────────────────────────────────┤  │
│  │ > Mes commandes    │  │                                                                        │  │
│  │ > Mon profil       │  │  Filtrer par statut :                     Période :                   │  │
│  │ > Mes adresses     │  │  ┌──────────────────────────────────────┐  ┌──────────┐  ┌──────────┐  │  │
│  │ > Déconnexion      │  │  │  Tous les statuts                  ▼ │  │  Du      │  │  Au      │  │  │
│  └────────────────────┘  │  └──────────────────────────────────────┘  └──────────┘  └──────────┘  │  │
│                           │                                                                        │  │
│                           │  ┌────────────┬──────────┬───────────┬──────────────┬─────────────────┬────────┐ │
│                           │  │ N° commande│ Date     │ Montant HT│ N° BC        │ Statut          │ Détail │ │
│                           │  ├────────────┼──────────┼───────────┼──────────────┼─────────────────┼────────┤ │
│                           │  │ CMD-1042   │ 20/05/26 │ 327,50 €  │ BC-2026-0142 │ [En attente]    │ [Voir] │ │
│                           │  ├────────────┼──────────┼───────────┼──────────────┼─────────────────┼────────┤ │
│                           │  │ CMD-1039   │ 18/05/26 │ 512,00 €  │ BC-2026-0140 │ [Livré]         │ [Voir] │ │
│                           │  ├────────────┼──────────┼───────────┼──────────────┼─────────────────┼────────┤ │
│                           │  │ CMD-1036   │ 10/05/26 │  98,00 €  │ BC-2026-0138 │ [Livré]         │ [Voir] │ │
│                           │  ├────────────┼──────────┼───────────┼──────────────┼─────────────────┼────────┤ │
│                           │  │ CMD-1031   │ 02/05/26 │ 1 205,00 €│ BC-2026-0135 │ [Livré]         │ [Voir] │ │
│                           │  ├────────────┼──────────┼───────────┼──────────────┼─────────────────┼────────┤ │
│                           │  │ CMD-1024   │ 14/04/26 │ 430,00 €  │ BC-2026-0128 │ [Livré]         │ [Voir] │ │
│                           │  └────────────┴──────────┴───────────┴──────────────┴─────────────────┴────────┘ │
│                           │                                                                        │
│                           │  Affichage 1-5 sur 12 commandes                                        │
│                           │  [← Précédent]   [1] [2] [3]   [Suivant →]                            │
│                           │                                                                        │
│                           └────────────────────────────────────────────────────────────────────────┘
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — Vue détail commande CMD-1039 (livrée — avec timeline + facture)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  [← Retour à mes commandes]                                                                          │
│                                                                                                      │
│  ┌───────────────────────────────────────────────────────────────────────────────────────────────┐   │
│  │  Commande CMD-1039 — 18/05/2026 — BC-2026-0140                           [Statut : Livré ✓]  │   │
│  ├───────────────────────────────────────────────────────────────────────────────────────────────┤   │
│  │                                                                                               │   │
│  │  SUIVI DE COMMANDE                                                                            │   │
│  │                                                                                               │   │
│  │  [●]──────────[●]──────────────[●]──────────────[●]                                          │   │
│  │  Confirmée   En préparation   Expédiée         Livrée                                        │   │
│  │  18/05        19/05            20/05            21/05                                         │   │
│  │                                                                                               │   │
│  │  ✓ Commande confirmée le 18/05/2026 à 10h15                                                  │   │
│  │  ✓ En préparation le 19/05/2026 à 08h30                                                      │   │
│  │  ✓ Expédiée le 20/05/2026 — N° suivi : [1Z999AA10123456784 →] (lien UPS)                    │   │
│  │  ✓ Livrée le 21/05/2026 à 14h22                                                              │   │
│  │                                                                                               │   │
│  ├───────────────────────────────────────────────────────────────────────────────────────────────┤   │
│  │  ARTICLES COMMANDÉS                                                                           │   │
│  │  ┌──────────────────────────────────────────────────────────────┬─────────┬──────────┬───────┐ │
│  │  │ Produit                                                      │ Qté     │ Prix HT  │ Total │ │
│  │  ├──────────────────────────────────────────────────────────────┼─────────┼──────────┼───────┤ │
│  │  │ Câble NYY-J 4x16mm² — REF-AG-4520 — Bobine 100m             │ 5       │ 48,50 €  │242,50 € │
│  │  ├──────────────────────────────────────────────────────────────┼─────────┼──────────┼───────┤ │
│  │  │ Tableau électrique IP65 — REF-AG-9102                        │ 2       │134,75 €  │269,50 € │
│  │  └──────────────────────────────────────────────────────────────┴─────────┴──────────┴───────┘ │
│  │                                                                                               │   │
│  │  Sous-total HT  512,00 €  · TVA (20%)  102,40 €  · Livraison  12,00 €                       │   │
│  │  TOTAL TTC      626,40 €                                                                     │   │
│  │                                                                                               │   │
│  ├───────────────────────────────────────────────────────────────────────────────────────────────┤   │
│  │  Livraison : Chantier Lyon Sud — 45 rue Garibaldi — 69007 Lyon                               │   │
│  │                                                                                               │   │
│  │  ┌──────────────────────────────────────────────────────────┐                               │   │
│  │  │  [📄  Télécharger la facture PDF — FAC-2026-1039.pdf ]   │                               │   │
│  │  └──────────────────────────────────────────────────────────┘                               │   │
│  └───────────────────────────────────────────────────────────────────────────────────────────────┘   │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 3 — Liste vide (première connexion / aucune commande passée)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌────────────────────┐  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ MON COMPTE         │  │  Mes commandes                                                         │  │
│  ├────────────────────┤  ├────────────────────────────────────────────────────────────────────────┤  │
│  │ > Mes commandes    │  │                                                                        │  │
│  │ > Mon profil       │  │                                                                        │  │
│  │ > Mes adresses     │  │            [  📦  ]                                                    │  │
│  │ > Déconnexion      │  │                                                                        │  │
│  └────────────────────┘  │       Vous n'avez pas encore passé de commande.                       │  │
│                           │                                                                        │  │
│                           │       Parcourez notre catalogue et commandez vos                      │  │
│                           │       fournitures électriques directement en ligne.                   │  │
│                           │                                                                        │  │
│                           │       ┌──────────────────────────────────────────┐                   │  │
│                           │       │   [ Découvrir le catalogue →  ]          │                   │  │
│                           │       └──────────────────────────────────────────┘                   │  │
│                           │                                                                        │  │
│                           └────────────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (liste verticale + détail accessible)

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 (0)│
├───────────────────────────┤
│ Mes commandes             │
│ Filtrer: [Tous statuts ▼] │
├───────────────────────────┤
│                           │
│ ┌─────────────────────────┐│
│ │ CMD-1042                ││
│ │ 20/05/2026              ││
│ │ BC-2026-0142            ││
│ │ 327,50 € HT             ││
│ │ [En attente]            ││
│ │              [Voir →]   ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ CMD-1039                ││
│ │ 18/05/2026              ││
│ │ BC-2026-0140            ││
│ │ 512,00 € HT             ││
│ │ [Livré ✓]               ││
│ │ [📄 Facture]  [Voir →]  ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ CMD-1036                ││
│ │ 10/05/2026              ││
│ │ BC-2026-0138            ││
│ │ 98,00 € HT              ││
│ │ [Livré ✓]               ││
│ │ [📄 Facture]  [Voir →]  ││
│ └─────────────────────────┘│
│                           │
│ [Afficher 12 commandes]   │
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Filtres statut + date sur la liste | Nielsen #7 — Flexibilité et efficacité | Thomas cherche souvent une commande par période (début de mois) ou statut (commandes en cours) |
| Colonne N° BC dans la liste | Pain point métier — identifié Journey Map | Le N° BC est le référentiel interne de Thomas — il cherche ses commandes PAR N° BC autant que par date |
| Timeline complète sur détail d'une commande livrée | Nielsen #1 — Visibilité de l'état | Toutes les dates jalons visibles = preuve de livraison utilisable en cas de litige |
| Numéro de suivi cliquable | Nielsen #7 — Efficacité | Lien direct vers le site transporteur — Thomas ne retape pas le numéro |
| Bouton [Télécharger la facture PDF] sur détail | Nielsen #4 — Cohérence | Accessible depuis la liste (mobile) ET le détail (desktop) — double point d'accès |
| État vide avec CTA positif | Nielsen #9 — Aide et documentation | Message bienveillant + invitation à agir — évite la frustration d'un écran vide sans explication |
| Montants HT dans la liste (TTC en détail) | Convention B2B | Liste = vue rapide acheteur → HT. Détail = facture complète → HT + TVA + TTC |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Liste commandes acheteur | Views — `commerce_order` — filtre `uid = current_user` + filtres exposés |
| Filtre statut | Views filter — `order_state` — select exposé |
| Filtre période | Views filter — `placed` — date range exposé avec date_popup |
| Vue détail commande | `OrderViewController` — custom route `/mon-compte/commandes/{order_id}` |
| Timeline statut avec dates | `OrderTransitionLog` entity ou custom field `field_status_history` |
| Numéro suivi cliquable | `field_tracking_number` — formatter URL (lien vers transporteur) |
| Lien facture PDF | `commerce_invoice` ou module custom — lien vers `InvoicePdfController::download()` |
| État vide | Views no result behavior — texte + lien catalogue personnalisés |
| Pagination | Views pager — 5 items par page par défaut |
