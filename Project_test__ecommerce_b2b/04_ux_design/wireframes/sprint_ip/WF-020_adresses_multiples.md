# Wireframe — WF-020 — Adresses de livraison multiples

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-020 — Gestion de plusieurs adresses de livraison dans l'espace client
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px
> Sprint : IP Sprint — Could Have

---

## Desktop — État nominal (carnet d'adresses avec 3 adresses enregistrées)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌────────────────────┐  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ MON COMPTE         │  │  Mes adresses de livraison                                             │  │
│  ├────────────────────┤  ├────────────────────────────────────────────────────────────────────────┤  │
│  │ > Mes commandes    │  │                                                                        │  │
│  │ > Mon profil       │  │  ┌──────────────────────────────┐  ┌──────────────────────────────┐   │  │
│  │ > Mes adresses ●   │  │  │  ★ ADRESSE PAR DÉFAUT        │  │  Chantier Lyon Sud           │   │  │
│  │ > Déconnexion      │  │  │                              │  │                              │   │  │
│  └────────────────────┘  │  │  Siège Électricité Mercier   │  │  45 rue Garibaldi            │   │  │
│                           │  │  14 avenue des Électriciens  │  │  69007 Lyon                  │   │  │
│                           │  │  75015 Paris                 │  │                              │   │  │
│                           │  │                              │  │  [Modifier] [Supprimer]       │   │  │
│                           │  │  [Modifier]                  │  └──────────────────────────────┘   │  │
│                           │  └──────────────────────────────┘                                     │  │
│                           │                                                                        │  │
│                           │  ┌──────────────────────────────┐  ┌──────────────────────────────┐   │  │
│                           │  │  Chantier Bordeaux Nord      │  │  + Ajouter une adresse       │   │  │
│                           │  │                              │  │                              │   │  │
│                           │  │  ZAC Les Chartrons           │  │  Livrez directement          │   │  │
│                           │  │  33300 Bordeaux              │  │  sur vos chantiers.          │   │  │
│                           │  │                              │  │                              │   │  │
│                           │  │  [Modifier] [Supprimer]       │  │  [ + Nouvelle adresse ]      │   │  │
│                           │  └──────────────────────────────┘  └──────────────────────────────┘   │  │
│                           │                                                                        │  │
│                           └────────────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — Formulaire ajout d'une nouvelle adresse

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Mes adresses  >  Ajouter une adresse                                                                 │
│                                                                                                      │
│  ┌────────────────────────────────────────────────────────────────────────────────────────────────┐  │
│  │  Nouvelle adresse de livraison                                                                 │  │
│  ├────────────────────────────────────────────────────────────────────────────────────────────────┤  │
│  │                                                                                                │  │
│  │  Nom du lieu (chantier, dépôt...) *                                                            │  │
│  │  ┌──────────────────────────────────────────────────────────────────────────────────────────┐  │  │
│  │  │  Ex : Chantier Porte de la Défense                                                       │  │  │
│  │  └──────────────────────────────────────────────────────────────────────────────────────────┘  │  │
│  │                                                                                                │  │
│  │  Adresse *                                                                                     │  │
│  │  ┌──────────────────────────────────────────────────────────────────────────────────────────┐  │  │
│  │  │  1 place de la Défense                                                                   │  │  │
│  │  └──────────────────────────────────────────────────────────────────────────────────────────┘  │  │
│  │                                                                                                │  │
│  │  Complément d'adresse                                                                          │  │
│  │  ┌──────────────────────────────────────────────────────────────────────────────────────────┐  │  │
│  │  │  Bâtiment A — Rez-de-chaussée                                                            │  │  │
│  │  └──────────────────────────────────────────────────────────────────────────────────────────┘  │  │
│  │                                                                                                │  │
│  │  Code postal *        Ville *                                                                  │  │
│  │  ┌──────────────┐     ┌────────────────────────────────────────────────────────────────────┐  │  │
│  │  │  92800       │     │  Puteaux                                                           │  │  │
│  │  └──────────────┘     └────────────────────────────────────────────────────────────────────┘  │  │
│  │                                                                                                │  │
│  │  ☐ Définir comme adresse par défaut                                                           │  │
│  │                                                                                                │  │
│  │  ┌──────────────────────────────┐    ┌──────────────────────────────────────────────────┐     │  │
│  │  │  [← Annuler]                 │    │  [ Enregistrer cette adresse ]                   │     │  │
│  │  └──────────────────────────────┘    └──────────────────────────────────────────────────┘     │  │
│  │                                                                                                │  │
│  └────────────────────────────────────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 3 — Sélection adresse au checkout (plusieurs adresses disponibles)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  CHECKOUT — Étape 1 : Adresse de livraison                                                            │
│                                                                                                      │
│  Sélectionnez une adresse de livraison :                                                              │
│                                                                                                      │
│  ● ★ Siège Électricité Mercier — 14 av. des Électriciens, 75015 Paris   (défaut)                     │
│  ○ Chantier Lyon Sud — 45 rue Garibaldi, 69007 Lyon                                                  │
│  ○ Chantier Bordeaux Nord — ZAC Les Chartrons, 33300 Bordeaux                                        │
│                                                                                                      │
│  ──────────────────────────────────────────────────────────────────────────────────────              │
│  ○ Utiliser une nouvelle adresse                                                                     │
│    ┌────────────────────────────────────────────────────────────────────────────────────────┐        │
│    │  [Formulaire nouvelle adresse — apparaît si option sélectionnée]                       │        │
│    └────────────────────────────────────────────────────────────────────────────────────────┘        │
│                                                                                                      │
│  ┌─────────────────────────────────────────┐                                                          │
│  │  [ Continuer vers Livraison →  ]         │                                                          │
│  └─────────────────────────────────────────┘                                                          │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (carnet d'adresses en liste scrollable)

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 (0)│
├───────────────────────────┤
│ Mes adresses              │
├───────────────────────────┤
│                           │
│ ┌─────────────────────────┐│
│ │ ★ ADRESSE PAR DÉFAUT    ││
│ │ Siège Électricité       ││
│ │ Mercier                 ││
│ │ 14 av. Électriciens     ││
│ │ 75015 Paris             ││
│ │ [Modifier]              ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ Chantier Lyon Sud       ││
│ │ 45 rue Garibaldi        ││
│ │ 69007 Lyon              ││
│ │ [Modifier] [Supprimer]  ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ Chantier Bordeaux Nord  ││
│ │ ZAC Les Chartrons       ││
│ │ 33300 Bordeaux          ││
│ │ [Modifier] [Supprimer]  ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │  [ + Nouvelle adresse ] ││
│ └─────────────────────────┘│
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Label "Nom du lieu" au lieu de "Entreprise" | Vocabulaire utilisateur | Thomas pense "chantier Lyon" pas "raison sociale du destinataire" — JTBD chantier |
| Adresse ★ par défaut non supprimable | Nielsen #5 — Prévention des erreurs | Empêcher la suppression accidentelle de la seule adresse utilisable en checkout |
| Formulaire nouvelle adresse inline au checkout | Nielsen #8 — Minimalisme | Pas de redirection vers /mes-adresses depuis le tunnel d'achat — Thomas reste dans le flux |
| Cartes adresses avec nom du chantier en titre | Affordance mobile | Thomas identifie ses chantiers au premier coup d'œil sans lire l'adresse complète |
| Option "Nouvelle adresse" dans le checkout | Nielsen #7 — Flexibilité | Premier chantier non encore enregistré — Thomas ne doit pas quitter le tunnel |
| Maximum 5 adresses (non affiché mais limite back) | Contrainte système | Évite la liste interminable — force la gestion du carnet d'adresses |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Carnet d'adresses | `profile` entity (commerce) — bundle `customer` — plusieurs profils par user |
| Adresse par défaut | `profile.is_default` — booléen — marquage visuel ★ |
| Formulaire ajout adresse | `ProfileForm` — route `/user/{user}/addresses/add` |
| Sélecteur checkout | `ShippingInformationPane` — liste profils `customer` du user courant |
| Formulaire inline checkout | `commerce_shipping` — `addressbook` widget — option "new address" conditionnelle |
| Suppression (sauf défaut) | `profile.access` — vérification `is_default` avant suppression |
