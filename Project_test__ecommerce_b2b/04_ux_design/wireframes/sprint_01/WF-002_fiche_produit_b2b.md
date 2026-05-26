# Wireframe — WF-002 — Fiche Produit B2B

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-002 — Fiche produit complète + tarif B2B
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État : Acheteur B2B connecté

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ HEADER                                                                      │
│ [Logo Company-Test]     [Catalogue] [Mes commandes]  🛒 Panier (2)  Thomas M. ▼ │
├─────────────────────────────────────────────────────────────────────────────┤
│ BREADCRUMB                                                                  │
│ Accueil > Catalogue > Câbles FTTH > Câble FTTH 4FO G657A2                  │
├────────────────────────────┬────────────────────────────────────────────────┤
│ GALERIE PRODUIT (gauche)   │ INFORMATIONS PRODUIT (droite)                 │
│                            │                                               │
│  ┌──────────────────────┐  │  Câble FTTH 4FO G657A2                        │
│  │                      │  │  Référence : FTTH-04-G657A2                   │
│  │                      │  │                                               │
│  │     [IMAGE           │  │  ┌─────────────────────────────────────┐      │
│  │      PRODUIT]        │  │  │  Conditionnement    Prix HT/m       │      │
│  │                      │  │  │  ─────────────────  ─────────────── │      │
│  │                      │  │  │  ○ Bobine 100m      14,90 €         │      │
│  └──────────────────────┘  │  │  ● Bobine 500m      12,50 €  ★ Pop │      │
│                            │  │  ○ Bobine 1000m     10,80 €         │      │
│  [img1] [img2] [img3]      │  └─────────────────────────────────────┘      │
│                            │                                               │
│                            │  Quantité : [─] [ 500 ] [+]  unité : m       │
│                            │                                               │
│                            │  ┌─────────────────────────────────────┐      │
│                            │  │  Prix total estimé : 6 250,00 € HT  │      │
│                            │  └─────────────────────────────────────┘      │
│                            │                                               │
│                            │  [    Ajouter au panier    ]                  │
│                            │                                               │
│                            │  📄 Télécharger la fiche technique (PDF)      │
│                            │                                               │
│                            │  ✉ Contacter un commercial                    │
├────────────────────────────┴────────────────────────────────────────────────┤
│ DESCRIPTION TECHNIQUE                                                       │
│ Type de fibre : G657A2 · Gaine : LSZH · Rayon de courbure min : 5mm       │
│ Utilisation : intérieur/extérieur · Temp. -20°C à +70°C                   │
├─────────────────────────────────────────────────────────────────────────────┤
│ PRODUITS COMPLÉMENTAIRES                                                    │
│ [Boîtier 4FO]  [Connecteurs SC/APC]  [Outils dénudage]                    │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Desktop — État : Visiteur anonyme (prix masqué)

```
├────────────────────────────┬────────────────────────────────────────────────┤
│ GALERIE (identique)        │ INFORMATIONS PRODUIT                          │
│                            │                                               │
│                            │  Câble FTTH 4FO G657A2                        │
│                            │  Référence : FTTH-04-G657A2                   │
│                            │                                               │
│                            │  ┌─────────────────────────────────────────┐  │
│                            │  │  🔒  Tarifs réservés aux acheteurs B2B  │  │
│                            │  │                                         │  │
│                            │  │  [ Créer un compte B2B ]                │  │
│                            │  │  [ Se connecter ]                       │  │
│                            │  └─────────────────────────────────────────┘  │
│                            │                                               │
│                            │  📄 Télécharger la fiche technique (PDF)      │
└────────────────────────────┴────────────────────────────────────────────────┘
```

---

## Mobile — 375px (acheteur connecté)

```
┌───────────────────────┐
│ [≡] [Logo]    [🛒 2]  │
├───────────────────────┤
│ > Câbles FTTH > ...   │
├───────────────────────┤
│ ┌─────────────────┐   │
│ │  [IMAGE PRODUIT]│   │
│ └─────────────────┘   │
│ [◀] ● ○ ○ [▶]         │
├───────────────────────┤
│ Câble FTTH 4FO G657   │
│ Réf: FTTH-04-G657A2   │
├───────────────────────┤
│ Conditionnement :     │
│ [Bobine 500m ▼]       │
│                       │
│ Prix : 12,50 € HT/m   │
├───────────────────────┤
│ Quantité :            │
│ [─] [  500  ] [+]  m  │
│                       │
│ Total : 6 250€ HT     │
├───────────────────────┤
│ [Ajouter au panier]   │
├───────────────────────┤
│ 📄 Fiche technique    │
└───────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Sélecteur conditionnement | Radio buttons + prix par option | Permettre comparaison immédiate — décision rapide |
| Prix total dynamique | Calculé en temps réel (quantité × prix) | Réduction friction cognitive — Thomas voit l'impact budget |
| Quantité | Champ numérique + stepper ─/+ | Standard e-commerce B2B — saisie rapide |
| PDF fiche technique | Lien disponible même pour anonymes | SEO + acquisition — document non sensible |
| Prix masqué | CTA double : créer compte + connexion | Conversion nouveaux prospects |
| Conditionnement populaire | Badge "★ Pop" sur option la plus commandée | Social proof — aide à la décision |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|--------------|----------------------|
| Galerie images | Field formatter Media + Slick slider |
| Sélecteur variations | Commerce Product Variation widget |
| Calcul prix total | JS inline ou Drupal Ajax (variation change) |
| PDF fiche technique | Field File formatter — download link |
| Produits complémentaires | Views block — Related products |
