# Wireframe — WF-014 — Suivi commande + mise à jour statut

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-014 — Suivi des commandes acheteur + mise à jour statut par l'admin
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — Vue acheteur Thomas : liste "Mes commandes"

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌────────────────────┐  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ MON COMPTE         │  │  Mes commandes                                                         │  │
│  ├────────────────────┤  ├────────────────────────────────────────────────────────────────────────┤  │
│  │ > Mes commandes    │  │                                                                        │  │
│  │ > Mon profil       │  │  ┌────────────┬──────────┬──────────┬──────────┬──────────────────────┬────────┐ │
│  │ > Mes adresses     │  │  │ N° commande│ Date     │ Montant  │ N° BC    │ Statut               │ Détail │ │
│  │ > Déconnexion      │  │  ├────────────┼──────────┼──────────┼──────────┼──────────────────────┼────────┤ │
│  └────────────────────┘  │  │ CMD-1042   │ 20/05/26 │ 327,50 €HT│ BC-2026-0142│ [En attente]    │ [Voir] │ │
│                           │  ├────────────┼──────────┼──────────┼──────────┼──────────────────────┼────────┤ │
│                           │  │ CMD-1039   │ 18/05/26 │ 512,00 €HT│ BC-2026-0140│ [Livré]        │ [Voir] │ │
│                           │  ├────────────┼──────────┼──────────┼──────────┼──────────────────────┼────────┤ │
│                           │  │ CMD-1036   │ 10/05/26 │  98,00 €HT│ BC-2026-0138│ [Livré]        │ [Voir] │ │
│                           │  └────────────┴──────────┴──────────┴──────────┴──────────────────────┴────────┘ │
│                           │                                                                        │
│                           └────────────────────────────────────────────────────────────────────────┘
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — Vue détail commande Thomas avec timeline statut

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  [← Retour à mes commandes]                                                                          │
│                                                                                                      │
│  ┌───────────────────────────────────────────────────────────────────────────────────────────────┐   │
│  │  Commande CMD-1042 — 20/05/2026 — BC-2026-0142                                               │   │
│  ├───────────────────────────────────────────────────────────────────────────────────────────────┤   │
│  │                                                                                               │   │
│  │  SUIVI DE COMMANDE                                                                            │   │
│  │                                                                                               │   │
│  │  [●]──────────[○]──────────────[○]──────────────[○]                                          │   │
│  │  Confirmée   En préparation   Expédiée         Livrée                                        │   │
│  │  20/05/2026                                                                                   │   │
│  │                                                                                               │   │
│  │  ✓ Commande confirmée le 20/05/2026 à 14h32                                                  │   │
│  │  ◌ En préparation — en cours de traitement                                                   │   │
│  │  ◌ Expédiée — vous recevrez un email avec le numéro de suivi                                 │   │
│  │  ◌ Livrée                                                                                    │   │
│  │                                                                                               │   │
│  ├───────────────────────────────────────────────────────────────────────────────────────────────┤   │
│  │  ARTICLES COMMANDÉS                                                                           │   │
│  │  Câble NYY-J 4x16mm² — REF-AG-4520 — 3 bobines — 145,50 € HT                                │   │
│  │  Gaine ICTA Ø16 grise — REF-AG-2210 — 10 couronnes — 72,00 € HT                             │   │
│  │  Disjoncteur diff 40A 30mA — REF-AG-7801 — 5 pièces — 110,00 € HT                           │   │
│  ├───────────────────────────────────────────────────────────────────────────────────────────────┤   │
│  │  Sous-total HT   327,50 €  · TVA (20%)  65,50 €  · Livraison  12,00 €                       │   │
│  │  TOTAL TTC       405,00 €                                                                    │   │
│  ├───────────────────────────────────────────────────────────────────────────────────────────────┤   │
│  │  Livraison : Chantier Porte de la Défense — 12 av. Charles de Gaulle — 92800 Puteaux         │   │
│  │  Numéro de suivi : —                                                                         │   │
│  └───────────────────────────────────────────────────────────────────────────────────────────────┘   │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 3 — Vue admin : formulaire mise à jour statut commande CMD-1042

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test BACK-OFFICE                                      Isabelle Royer [Admin] ▼  [Déconnexion]    │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  [← Retour à la liste des commandes]   CMD-1042 — Dupont TP — T. Mercier                             │
│                                                                                                      │
│  ┌───────────────────────────────────────────────────────┐  ┌──────────────────────────────────────┐ │
│  │  MISE À JOUR DU STATUT                                │  │  RÉCAPITULATIF COMMANDE              │ │
│  ├───────────────────────────────────────────────────────┤  ├──────────────────────────────────────┤ │
│  │                                                       │  │  Acheteur  : Thomas Mercier          │ │
│  │  Statut actuel : [En attente]                         │  │  Société   : Dupont Travaux Publics  │ │
│  │                                                       │  │  Email     : t.mercier@dupont-tp.fr  │ │
│  │  Nouveau statut *                                     │  │  Date      : 20/05/2026 à 14h32      │ │
│  │  ┌─────────────────────────────────────────────────┐  │  │  Montant   : 327,50 € HT             │ │
│  │  │  Sélectionner un statut...                    ▼ │  │  │  N° BC     : BC-2026-0142            │ │
│  │  └─────────────────────────────────────────────────┘  │  └──────────────────────────────────────┘ │
│  │    · En préparation                                   │                                          │
│  │    · Expédié  ← (champ tracking obligatoire)          │                                          │
│  │    · Livré                                            │                                          │
│  │    · Annulé                                           │                                          │
│  │                                                       │                                          │
│  │  Numéro de suivi transporteur *                       │                                          │
│  │  (obligatoire si statut = Expédié)                    │                                          │
│  │  ┌─────────────────────────────────────────────────┐  │                                          │
│  │  │  ex : 1Z999AA10123456784 (UPS)                  │  │                                          │
│  │  └─────────────────────────────────────────────────┘  │                                          │
│  │                                                       │                                          │
│  │  ☑  Notifier le client par email                      │                                          │
│  │                                                       │                                          │
│  │  ┌────────────────┐    ┌──────────────────────────┐   │                                          │
│  │  │  [Annuler]     │    │[Enregistrer et notifier →]│   │                                          │
│  │  └────────────────┘    └──────────────────────────┘   │                                          │
│  └───────────────────────────────────────────────────────┘                                          │
│                                                                                                      │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 4 — Confirmation notification envoyée

```
┌──────────────────────────────────────────────────────────────────────────────────────┐
│  ✅  Statut mis à jour avec succès                                                    │
│                                                                                      │
│  La commande CMD-1042 est maintenant en statut "En préparation".                     │
│  Un email de notification a été envoyé à t.mercier@dupont-tp.fr                      │
│                                                                                      │
│  [← Retour à la liste des commandes]                                                 │
└──────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px — Vue Thomas : timeline verticale

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 (0)│
├───────────────────────────┤
│ CMD-1042 — 20/05/2026     │
│ Montant : 327,50 € HT     │
├───────────────────────────┤
│                           │
│  SUIVI COMMANDE           │
│  ─────────────────────    │
│                           │
│  ● Confirmée              │
│  │ 20/05/2026 à 14h32     │
│  │                        │
│  ○ En préparation         │
│  │ En cours...            │
│  │                        │
│  ○ Expédiée               │
│  │ —                      │
│  │                        │
│  ○ Livrée                 │
│    —                      │
│                           │
│ Numéro de suivi :         │
│ (disponible à l'expédition│
│                           │
│ ┌─────────────────────────┐│
│ │ Détail articles ▼       ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ Câble NYY-J ×3          ││
│ │ Gaine ICTA ×10          ││
│ │ Disjoncteur ×5          ││
│ │ TOTAL TTC : 405,00 €    ││
│ └─────────────────────────┘│
│                           │
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Timeline horizontale (desktop) / verticale (mobile) | Nielsen #1 — Visibilité de l'état | Thomas voit en un regard où en est sa commande — réduit les appels au service client |
| Numéro de suivi cliquable (lien transporteur) | Nielsen #7 — Flexibilité et efficacité | Thomas sur chantier consulte directement le tracking transporteur sans passer par Company-Test |
| Champ numéro tracking obligatoire si statut = Expédié | Nielsen #5 — Prévention des erreurs | Empêche Isabelle d'enregistrer une expédition sans tracking — Thomas ne peut pas suivre sa commande sinon |
| Case à cocher notification email (cochée par défaut) | Nielsen #6 — Reconnaissance > rappel | La notification est l'action attendue dans 99% des cas — décochable par exception |
| Notification email avec adresse visible dans confirmation | Nielsen #1 — Visibilité | Isabelle confirme que le bon destinataire a été notifié — trace visible |
| Vue liste "Mes commandes" = historique simple + statut | Nielsen #4 — Cohérence | Même code couleur statut que le back-office admin — cohérence cross-profil |
| Suivi mobile : tracking visible en haut | Mobile context — Thomas chantier | Première information consultée sur téléphone = où est ma livraison |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Liste "Mes commandes" acheteur | Views — `commerce_order` filtrée sur `uid = current_user` |
| Timeline statut | Custom template Twig — states visuels basés sur `order_state` |
| Numéro de suivi cliquable | Champ `field_tracking_number` — formatter lien (URL transporteur configurable) |
| Formulaire mise à jour statut (admin) | `OrderStatusForm` custom — `OrderWorkflow::apply()` |
| Champ tracking obligatoire si Expédié | Validation JS + Drupal Form Validate — condition sur statut sélectionné |
| Notification email automatique | `OrderShippedSubscriber` — `MailManager::mail()` — template SendGrid `order_shipped` |
| Case notification cochée par défaut | Champ `notify_customer` — default value = TRUE |
| Badge statut coloré | CSS classes `order-state--{state}` — Twig + Views field formatter |
