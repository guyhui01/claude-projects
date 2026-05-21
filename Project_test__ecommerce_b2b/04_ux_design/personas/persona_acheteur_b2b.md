# Persona — Acheteur B2B Company-Test

> Skill : `personas-jtbd.md` · Certification : IDF · Google UX Certificate
> Niveau de fidélité : Mid-fi

---

## Thomas — Responsable Achats Télécoms

```
┌─────────────────────────────────────────────────────────────────────┐
│  [PHOTO]   Thomas Mercier — Responsable Achats                      │
│            Installateur fibre optique — PME 45 personnes            │
│            Lyon · 38 ans · 12 ans d'expérience terrain             │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Profil

| Champ | Détail |
|-------|--------|
| Entreprise | Fibre Sud-Est SARL — installateur fibre optique |
| Rôle | Responsable Achats + Chef de chantier senior |
| Localisation | Lyon, déplacements fréquents sur chantiers |
| Appareils | PC bureau (bureau) · Smartphone Android (chantier) |
| Maturité digitale | Intermédiaire — à l'aise e-commerce grand public, habitué aux portails fournisseurs |

---

## Citation

> *"Je commande les mêmes références chaque semaine. Je veux voir mon prix, ma dispo, et passer commande en 3 clics. Pas remplir un formulaire de devis et attendre 48h."*

---

## Jobs To Be Done (JTBD)

| Job | Contexte | Résultat attendu |
|-----|----------|-----------------|
| **Commander rapidement** | En déplacement sur chantier, besoin urgent de câbles FTTH | Commande passée en < 5 min depuis le smartphone |
| **Vérifier son tarif négocié** | Avant de répondre à un appel d'offres | Voir le prix HT unitaire et par conditionnement immédiatement |
| **Suivre ses commandes** | Plusieurs chantiers en parallèle | Tableau de bord avec statuts en temps réel |
| **Télécharger les fiches techniques** | Pour dossier technique client | Accès direct PDF depuis la fiche produit |
| **Gérer les bons de commande** | Obligation comptable interne | Saisir le N° BC lors de la commande |

---

## Frustrations actuelles (sans la plateforme)

- 📞 Appelle le commercial Company-Test → souvent en déplacement → délai de rappel
- 📧 Envoie un email avec sa liste de produits → réponse sous 24-48h
- 🧾 Reçoit un PDF de devis → doit le valider manuellement → perd du temps
- ❌ Ne sait pas si le stock est disponible avant la livraison
- 📱 Aucun accès mobile — tout passe par email

---

## Attentes prioritaires

```
MUST HAVE pour Thomas                    NICE TO HAVE
─────────────────────────────────        ─────────────────────
✓ Voir son tarif B2B dès connexion       ~ App mobile dédiée
✓ Référence produit visible + SKU        ~ Suggestions de réassort
✓ Ajout rapide au panier (quantité)      ~ Chat avec commercial
✓ Saisir son N° bon de commande          ~ Historique PDF téléchargeable
✓ Confirmation email immédiate           ~ Alertes stock faible
```

---

## Parcours type (Happy Path)

```
Lundi 7h30 — Sur chantier (smartphone)

1. Reçoit email "Votre compte Company-Test est activé"
2. Se connecte → voit son tableau de bord B2B
3. Cherche "câble FTTH 4FO" → catégorie Câbles FTTH
4. Clique sur la fiche → voit prix : 12,50€ HT/m
5. Quantité : 500m → Ajouter au panier
6. Checkout → saisit N° BC : "BC-2026-0447"
7. Confirme → reçoit email de confirmation
⏱ Durée totale : 4 minutes
```

---

## Persona secondaire — Admin Company-Test

```
┌─────────────────────────────────────────────────────────────────────┐
│  [PHOTO]   Isabelle Royer — Assistante Administration des Ventes    │
│            Company-Test SAS — Siège · Paris                             │
│            42 ans · 8 ans chez Company-Test                             │
└─────────────────────────────────────────────────────────────────────┘
```

**Citation** : *"Je reçois les demandes de compte par email, je les valide à la main dans notre CRM. Avec 10-15 nouvelles demandes par semaine c'est ingérable."*

**JTBD** :
- Valider/refuser les comptes B2B rapidement avec le bon contexte (SIRET, raison sociale)
- Traiter les commandes sans jongler entre 3 outils (email, ERP, tableau Excel)
- Avoir une vue globale du pipe commandes en temps réel
