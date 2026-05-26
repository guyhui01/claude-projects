# Wireframe — WF-004 — Téléchargement Fiche Technique PDF

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-004 — Téléchargement fiche technique PDF depuis la fiche produit
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px
> Sprint : IP Sprint (Could Have)

---

## Desktop — État nominal (fiche technique disponible)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (1)     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  Accueil > Câbles FTTH > Câble FTTH 4FO                                                             │
│                                                                                                      │
│  ┌────────────────────────────────────────────────────────────────────────────────────────────────┐  │
│  │                                                                                                │  │
│  │  [IMAGE                    ]   Câble FTTH 4 fibres optiques — Intérieur/Extérieur             │  │
│  │  [PRODUIT                  ]   Réf. SKU : CXT-FTTH-4FO-500                                   │  │
│  │  [500 × 400px              ]                                                                  │  │
│  │  [placeholder              ]   Conditionnement : ○ Bobine 100m   ● Bobine 500m   ○ Bobine 1km│  │
│  │                                                                                               │  │
│  │                                Prix HT unitaire (tarif B2B) :  0,375 € / m                  │  │
│  │                                Bobine 500m :                   187,50 € HT                   │  │
│  │                                                                                               │  │
│  │                                Quantité :  [  1  ] bobine(s)                                 │  │
│  │                                                                                               │  │
│  │                                ┌───────────────────────────────┐                             │  │
│  │                                │    🛒 Ajouter au panier       │                             │  │
│  │                                └───────────────────────────────┘                             │  │
│  │                                                                                               │  │
│  │  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ │  │
│  │                                                                                               │  │
│  │  📄  DOCUMENTATION TECHNIQUE                                                                 │  │
│  │                                                                                               │  │
│  │  ┌────────────────────────────────────────────────────────────────────────────────────────┐  │  │
│  │  │  📄  Fiche technique CXT-FTTH-4FO — v2.1 (PDF · 1,2 Mo)                              │  │  │
│  │  │                                                                                        │  │  │
│  │  │  Contenu : spécifications mécaniques · résistance traction · atténuation · normes NF  │  │  │
│  │  │                                                                                        │  │  │
│  │  │                              [ ⬇ Télécharger la fiche technique ]                     │  │  │
│  │  └────────────────────────────────────────────────────────────────────────────────────────┘  │  │
│  │                                                                                               │  │
│  └────────────────────────────────────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## État 2 — Fiche technique non disponible (bouton masqué)

```
┌──────────────────────────────────────────────────────────────────────┐
│  📄  DOCUMENTATION TECHNIQUE                                         │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  ℹ️  Fiche technique en cours de numérisation.               │   │
│  │     Contactez votre commercial Company-Test pour obtenir     │   │
│  │     la documentation au format papier.                       │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                                                      │
│  (bouton de téléchargement masqué — champ fichier vide côté Drupal) │
└──────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (fiche disponible)

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 │
├───────────────────────────┤
│ > Câbles > FTTH 4FO       │
├───────────────────────────┤
│ [IMAGE PRODUIT 375×250]   │
│                           │
│ Câble FTTH 4FO            │
│ CXT-FTTH-4FO-500          │
│                           │
│ ○ 100m  ● 500m  ○ 1km     │
│                           │
│ 0,375 € / m HT            │
│ Bobine 500m : 187,50 € HT │
│                           │
│ Qté : [  1  ] bobine(s)   │
│                           │
│ ┌─────────────────────────┐│
│ │  🛒 Ajouter au panier   ││
│ └─────────────────────────┘│
│                           │
├───────────────────────────┤
│ 📄 DOCUMENTATION          │
├───────────────────────────┤
│ Fiche technique v2.1      │
│ PDF · 1,2 Mo              │
│                           │
│ ┌─────────────────────────┐│
│ │ ⬇ Télécharger la fiche ││
│ └─────────────────────────┘│
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Bouton téléchargement conditionnel (si fichier renseigné) | Décision D4 atelier story mapping | "Bouton affiché uniquement si le fichier est renseigné" — évite un lien cassé ou une erreur 404 |
| Mention du format et du poids (PDF · 1,2 Mo) | Nielsen #1 — Visibilité | Thomas sait ce qu'il télécharge avant de cliquer — utile en contexte chantier avec connexion 4G limitée |
| Message de remplacement si fiche absente | Nielsen #9 — Aide à la récupération | 70% du catalogue non numérisé au lancement (CR story mapping) — le message oriente vers l'alternative |
| Section documentation séparée de la fiche produit | Hiérarchie visuelle | La fiche technique est un besoin secondaire après le prix et la commande — positionnée en bas |
| Téléchargement direct (pas de nouvelle page) | JTBD Thomas — rapidité | Sur mobile chantier, chaque clic coûte du temps — téléchargement inline |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Champ fichier PDF | `field_fiche_technique` — type `file`, extensions `.pdf` uniquement |
| Affichage conditionnel | Twig : `{% if product.field_fiche_technique.entity %}` |
| Bouton téléchargement | `file_url_transform_relative(product.field_fiche_technique.entity.uri.value)` |
| Message si fichier absent | Twig `{% else %}` — bloc informatif statique |
| Format fichier affiché | `product.field_fiche_technique.entity.filesize` → filtre `format_bytes` |
