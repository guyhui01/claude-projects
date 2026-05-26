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
│            Company-Test SAS — Siège · Paris 15e                     │
│            42 ans · 8 ans chez Company-Test · Bac+2 BTS Commerce    │
└─────────────────────────────────────────────────────────────────────┘
```

## Profil — Isabelle

| Champ | Détail |
|-------|--------|
| Entreprise | Company-Test SAS — siège Paris |
| Rôle | Assistante Administration des Ventes (ADV) |
| Localisation | Paris 15e — bureau fixe |
| Appareils | PC bureau Windows — aucun usage mobile professionnel |
| Maturité digitale | Avancée sur les outils métier (ERP, CRM, Excel), peu habituée aux portails web |
| Charge actuelle | 10-15 nouvelles demandes de compte B2B / semaine + suivi ~80 commandes actives |

---

## Citation — Isabelle

> *"Je reçois les demandes de compte par email, je les valide à la main dans notre CRM. Avec 10-15 nouvelles demandes par semaine et le suivi des commandes en parallèle, je passe ma journée à jongler entre ma boîte mail, notre ERP et mon tableau Excel. Je n'ai aucune vue globale en temps réel."*

---

## Jobs To Be Done (JTBD) — Isabelle

| Priorité | Job | Contexte | Résultat attendu |
|----------|-----|----------|-----------------|
| **#1** | **Valider/refuser les comptes B2B rapidement** | Chaque matin — pile de demandes entrantes | Voir SIRET + raison sociale + secteur en un coup d'œil, cliquer "Valider" ou "Refuser" avec motif |
| **#2** | **Traiter les commandes sans multi-outil** | Tout au long de la journée | Un seul écran pour voir les commandes, mettre à jour les statuts, déclencher les livraisons |
| **#3** | **Exporter les commandes pour la comptabilité** | Fin de semaine / fin de mois | Export CSV prêt à importer dans l'ERP — aucune ressaisie manuelle |
| **#4** | **Notifier les acheteurs des changements de statut** | Quand une commande est expédiée ou retardée | Envoi automatique — elle ne veut pas rédiger des emails individuels |
| **#5** | **Avoir une vue globale du pipe** | En réunion hebdo avec le Dir. Commercial | Dashboard synthétique : commandes en attente, en cours, expédiées, anomalies |

---

## Frustrations actuelles (sans la plateforme)

- 📧 Reçoit les demandes de compte par email → les saisit manuellement dans le CRM → perd 20 min/demande
- 📞 Appelle les acheteurs pour vérifier leur SIRET quand le format est incorrect
- 📊 Maintient un tableau Excel des commandes en parallèle du CRM → données souvent désynchronisées
- 🔄 Copie-colle les N° de suivi transporteur dans des emails manuels
- ❌ Aucune alerte automatique si une commande est bloquée depuis plus de 48h

---

## Attentes prioritaires — Isabelle

```
MUST HAVE pour Isabelle                  NICE TO HAVE
──────────────────────────────────       ─────────────────────────────
✓ Dashboard validation comptes B2B       ~ Intégration directe CRM
✓ Contexte complet par demande           ~ Application mobile
  (SIRET, raison sociale, secteur)       ~ Reporting hebdo automatique
✓ Mise à jour statut commandes           ~ Gestion des avoirs / retours
✓ Export CSV commandes (1 clic)          ~ API connecteur ERP
✓ Notifications automatiques acheteurs
```

---

## Parcours type — Isabelle (Happy Path)

```
Lundi 9h00 — Bureau Paris

1. Se connecte avec son rôle admin Company-Test
2. Voit le dashboard : 3 comptes en attente de validation
3. Clique sur "Fibre Nord SARL" → voit SIRET 12345678901234, secteur "Installateur fibre"
4. Vérifie SIRET sur le registre RNCS (fenêtre externe) → OK
5. Clique "Valider" → l'acheteur reçoit automatiquement l'email d'activation
6. Répète pour les 2 autres demandes (8 min total pour 3 validations)
7. Consulte les commandes du jour : 12 nouvelles commandes
8. Met à jour le statut de 5 commandes "En cours" → "Expédiées" avec N° Chronopost
   → Les acheteurs reçoivent automatiquement leur email de suivi
9. Exporte CSV des commandes de la semaine → importe dans ERP
⏱ Durée traitement quotidien : ~45 min vs 2h30 avant la plateforme
```

---

## Liens entre personas

| Thomas (acheteur) veut | Isabelle (admin) doit |
|------------------------|----------------------|
| Compte validé rapidement | Valider les demandes en < 24h |
| Prix B2B visible dès connexion | Avoir configuré son compte avec les bons tarifs |
| Confirmation commande immédiate | Traiter et confirmer la commande |
| Numéro de suivi transporteur | Mettre à jour le statut et déclencher la notif |
