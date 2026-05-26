# Wireframe — WF-018 — Facture PDF

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-018 — Génération et téléchargement de la facture PDF post-commande
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px (point d'accès UI) + Maquette PDF (A4)

---

## Desktop — Accès à la facture depuis l'espace commande

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test                  [Rechercher un produit...]        Thomas Mercier ▼  🛒 Panier (0)           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  Mes commandes > CMD-1039 — Commande livrée                                                          │
│                                                                                                      │
│  ┌───────────────────────────────────────────────────────────────────────────────────────────────┐   │
│  │  Commande CMD-1039 — 18/05/2026 — BC-2026-0140           [Statut : Livré ✓]                  │   │
│  ├───────────────────────────────────────────────────────────────────────────────────────────────┤   │
│  │                                                                                               │   │
│  │  [timeline et articles — voir WF-012]                                                        │   │
│  │                                                                                               │   │
│  ├───────────────────────────────────────────────────────────────────────────────────────────────┤   │
│  │  DOCUMENTS DE COMMANDE                                                                        │   │
│  │                                                                                               │   │
│  │  ┌─────────────────────────────────────────────────────────────────────────────────────────┐ │   │
│  │  │  📄  Facture FAC-2026-1039.pdf                              [✓ Disponible]               │ │   │
│  │  │      Générée le 21/05/2026 à 14h22 (après confirmation de livraison)                    │ │   │
│  │  │                                                                                         │ │   │
│  │  │  ┌──────────────────────────────────┐   ┌──────────────────────────────────────────┐   │ │   │
│  │  │  │  [📥  Télécharger le PDF ]        │   │  [✉  Renvoyer par email ]                │   │ │   │
│  │  │  └──────────────────────────────────┘   └──────────────────────────────────────────┘   │ │   │
│  │  └─────────────────────────────────────────────────────────────────────────────────────────┘ │   │
│  └───────────────────────────────────────────────────────────────────────────────────────────────┘   │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — Maquette ASCII de la facture PDF (format A4)

```
┌──────────────────────────────────────────────────────────────────┐
│  PAGE A4 — FACTURE PDF Company-Test                                   │
├──────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────────────────────────┐  ┌─────────────────────┐  │
│  │  [LOGO Company-Test]                  │  │  FACTURE            │  │
│  │  Company-Test SAS                     │  │  N° FAC-2026-1039   │  │
│  │  12 rue de l'Industrie           │  │  Date : 21/05/2026  │  │
│  │  75010 Paris                     │  └─────────────────────┘  │
│  │  SIRET : 398 754 621 000 47      │                           │
│  │  TVA : FR 12 398 754 621         │                           │
│  └──────────────────────────────────┘                           │
│                                                                  │
│  ───────────────────────────────────────────────────────────    │
│                                                                  │
│  FACTURÉ À                             N° BC CLIENT             │
│  Dupont Travaux Publics                BC-2026-0140             │
│  Thomas Mercier                                                  │
│  14 rue du Chantier                    Commande : CMD-1039      │
│  69003 Lyon                            Date commande : 18/05/2026│
│  SIRET : 412 987 654 000 18                                      │
│                                                                  │
│  ───────────────────────────────────────────────────────────    │
│                                                                  │
│  ┌─────────────────────────────────┬──────┬──────────┬────────┐ │
│  │ Désignation                     │ Qté  │ PU HT    │ Total HT│ │
│  ├─────────────────────────────────┼──────┼──────────┼────────┤ │
│  │ Câble NYY-J 4x16mm²             │  5   │  48,50 € │242,50 €│ │
│  │ REF-AG-4520 — Bobine 100m       │      │          │        │ │
│  ├─────────────────────────────────┼──────┼──────────┼────────┤ │
│  │ Tableau électrique IP65         │  2   │ 134,75 € │269,50 €│ │
│  │ REF-AG-9102 — Pièce unitaire    │      │          │        │ │
│  ├─────────────────────────────────┼──────┼──────────┼────────┤ │
│  │ Frais de livraison              │  1   │  12,00 € │ 12,00 €│ │
│  └─────────────────────────────────┴──────┴──────────┴────────┘ │
│                                                                  │
│                              ┌───────────────────────────────┐  │
│                              │ Sous-total HT      524,00 €   │  │
│                              │ TVA 20%            104,80 €   │  │
│                              ├───────────────────────────────┤  │
│                              │ TOTAL TTC          628,80 €   │  │
│                              └───────────────────────────────┘  │
│                                                                  │
│  Conditions de règlement : Paiement CB en ligne — réglé         │
│  Date de règlement : 18/05/2026                                  │
│                                                                  │
│  ───────────────────────────────────────────────────────────    │
│                                                                  │
│  MENTIONS LÉGALES                                                │
│  Company-Test SAS — Capital 250 000 € — RCS Paris B 398 754 621      │
│  Siège social : 12 rue de l'Industrie — 75010 Paris             │
│  N° TVA intracommunautaire : FR 12 398 754 621                  │
│  En cas de retard de paiement, une pénalité de 3× le taux       │
│  légal sera appliquée. Indemnité forfaitaire : 40 €              │
│  (Art. L441-6 Code de commerce)                                  │
│                                                                  │
│  ───────────────────────────────────────────────────────────    │
│  Page 1/1                                    FAC-2026-1039       │
└──────────────────────────────────────────────────────────────────┘
```

---

### État 3 — Facture non encore disponible (commande en cours)

```
┌──────────────────────────────────────────────────────────────────────────────────────┐
│  DOCUMENTS DE COMMANDE                                                               │
├──────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                      │
│  📄  Facture — En attente de génération                        [ Non disponible ]    │
│      La facture sera générée automatiquement                                         │
│      après confirmation de livraison.                                                │
│                                                                                      │
│      Un email avec la facture en pièce jointe vous sera envoyé                      │
│      dès que votre commande sera marquée comme livrée.                               │
│                                                                                      │
└──────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (lien téléchargement accessible depuis liste et détail)

```
┌───────────────────────────┐
│ ≡  Company-Test          🛒 (0)│
├───────────────────────────┤
│ CMD-1039 — 18/05/2026     │
│ [Livré ✓]                 │
├───────────────────────────┤
│                           │
│  DOCUMENTS                │
│  ──────────────────────   │
│                           │
│ ┌─────────────────────────┐│
│ │ 📄 FAC-2026-1039.pdf    ││
│ │    Disponible           ││
│ │                         ││
│ │ [📥 Télécharger]        ││
│ │ [✉ Renvoyer par email]  ││
│ └─────────────────────────┘│
│                           │
│ ─────────────────────     │
│ Câble NYY-J ×5  242,50 €  │
│ Tableau IP65 ×2  269,50 €  │
│ Livraison         12,00 €  │
│ ──────────────────────     │
│ TOTAL TTC        628,80 €  │
│                           │
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Numérotation automatique (FAC-AAAA-N°CMD) | Conformité comptable | Format cohérent et séquentiel — obligatoire pour la comptabilité client (CAC40 = contrôles internes stricts) |
| N° BC client visible sur la facture | Pain point métier identifié | Le service comptabilité de Thomas rapproche les factures fournisseurs par N° BC — sans ce champ, la facture est rejetée |
| Facture générée APRÈS confirmation livraison | Règle fiscale française | Conformité article 289 CGI — la facture doit correspondre à la livraison réelle des biens |
| TVA 20% détaillée ligne par ligne | Obligation légale (art. 289 CGI) | Facture conforme exigée pour la déductibilité TVA du client |
| Mentions légales obligatoires en bas | Obligation Code de commerce | Pénalités de retard, indemnité forfaitaire 40 €, RCS — obligatoires sur toute facture B2B française |
| Bouton [Renvoyer par email] | Nielsen #3 — Contrôle utilisateur | Thomas peut perdre l'email initial — accès à la re-livraison sans contacter le support |
| Facture indisponible = message explicatif | Nielsen #9 — Aide à la récupération | Thomas comprend QUAND la facture sera disponible — pas de frustration devant un lien grisé sans explication |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Génération PDF | `commerce_invoice` (module) ou `dompdf` / `wkhtmltopdf` custom service |
| Déclenchement génération | `OrderTransitionSubscriber` — event `order.fulfilled` → `InvoiceGeneratorService::generate()` |
| Numérotation automatique | Séquence custom `invoice_number_sequence` — format `FAC-{YEAR}-{ORDER_ID}` |
| Champ N° BC sur facture | `order.field_purchase_order_number` → inclus dans le template PDF Twig |
| Template facture | Fichier Twig `invoice.html.twig` — rendu DOMpdf |
| Lien téléchargement | Route `/commandes/{order_id}/facture/pdf` — StreamedResponse PDF |
| Bouton [Renvoyer par email] | AJAX callback → `MailManager::mail()` — template `invoice_download` avec pièce jointe |
| Statut disponibilité | Champ `field_invoice_status` — valeurs : `pending / available` |
| Email automatique | `InvoiceReadySubscriber` — envoi automatique dès génération du PDF |
