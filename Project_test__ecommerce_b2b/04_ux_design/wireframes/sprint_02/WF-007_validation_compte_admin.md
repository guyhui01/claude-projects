# Wireframe — WF-007 — Validation compte admin

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-007 — Validation des comptes acheteurs B2B par l'administrateur
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px + Mobile 375px

---

## Desktop — État nominal (3 demandes en attente)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test BACK-OFFICE                                      Isabelle Royer [Admin] ▼  [Déconnexion]    │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌────────────────────┐  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ NAVIGATION ADMIN   │  │  Validation des comptes B2B                                            │  │
│  ├────────────────────┤  ├────────────────────────────────────────────────────────────────────────┤  │
│  │ > Commandes        │  │                                                                        │  │
│  │ > Comptes B2B  [3] │  │  Comptes en attente de validation : [3]                                │  │
│  │   · En attente [3] │  │                                                                        │  │
│  │   · Validés        │  │  ┌──────────────┬─────────────────────┬──────────────┬──────────────┬─────────────┬───────────────────────┐  │
│  │   · Refusés        │  │  │ Raison soc.  │ Email               │ SIRET        │ Contact      │ Date demande│ Actions               │  │
│  │ > Produits         │  │  ├──────────────┼─────────────────────┼──────────────┼──────────────┼─────────────┼───────────────────────┤  │
│  │ > Export           │  │  │ Dupont TP    │ t.mercier@dupont.fr │ 41298765400  │ T. Mercier   │ 18/05/2026  │ [Voir] [Valider] [✗]  │  │
│  │                    │  │  ├──────────────┼─────────────────────┼──────────────┼──────────────┼─────────────┼───────────────────────┤  │
│  │                    │  │  │ BTP Moreau   │ m.durand@btpmo.fr   │ 55234871200  │ M. Durand    │ 19/05/2026  │ [Voir] [Valider] [✗]  │  │
│  │                    │  │  ├──────────────┼─────────────────────┼──────────────┼──────────────┼─────────────┼───────────────────────┤  │
│  │                    │  │  │ Chantiers3D  │ j.klein@c3d.fr      │ 78345620100  │ J. Klein     │ 20/05/2026  │ [Voir] [Valider] [✗]  │  │
│  └────────────────────┘  │  └──────────────┴─────────────────────┴──────────────┴──────────────┴─────────────┴───────────────────────┘  │
│                           │                                                                        │
│                           │  [← Page précédente]   Page 1 / 1   [Page suivante →]                 │
│                           └────────────────────────────────────────────────────────────────────────┘
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — Détail dossier : Fiche Thomas Mercier

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test BACK-OFFICE                                      Isabelle Royer [Admin] ▼  [Déconnexion]    │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌────────────────────┐  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ NAVIGATION ADMIN   │  │  [← Retour à la liste]   Dossier d'inscription                         │  │
│  ├────────────────────┤  ├────────────────────────────────────────────────────────────────────────┤  │
│  │ > Commandes        │  │                                                                        │  │
│  │ > Comptes B2B  [3] │  │  ┌──────────────────────────────────────────────────────────────────┐ │  │
│  │   · En attente [3] │  │  │  INFORMATIONS SOCIÉTÉ                                            │ │  │
│  │   · Validés        │  │  ├──────────────────────────────────────────────────────────────────┤ │  │
│  │   · Refusés        │  │  │  Raison sociale  : Dupont Travaux Publics                        │ │  │
│  │ > Produits         │  │  │  SIRET           : 412 987 654 00018                             │ │  │
│  │ > Export           │  │  │  Adresse         : 14 rue du Chantier, 69003 Lyon                │ │  │
│  │                    │  │  │  Secteur         : Travaux Publics / BTP                         │ │  │
│  └────────────────────┘  │  ├──────────────────────────────────────────────────────────────────┤ │
│                           │  │  CONTACT RÉFÉRENT                                                │ │
│                           │  ├──────────────────────────────────────────────────────────────────┤ │
│                           │  │  Nom             : Thomas Mercier                                │ │
│                           │  │  Email           : t.mercier@dupont-tp.fr                        │ │
│                           │  │  Téléphone       : +33 6 12 34 56 78                             │ │
│                           │  │  Fonction        : Responsable Achats                            │ │
│                           │  ├──────────────────────────────────────────────────────────────────┤ │
│                           │  │  PIÈCES JOINTES                                                  │ │
│                           │  │  [Kbis_dupont_tp.pdf]   [extrait_URSSAF.pdf]                     │ │
│                           │  └──────────────────────────────────────────────────────────────────┘ │
│                           │                                                                        │
│                           │  Date de demande : 18/05/2026 à 09h42                                 │
│                           │                                                                        │
│                           │  ┌───────────────┐  ┌────────────────────────┐  ┌──────────────────┐ │
│                           │  │  [✓ Valider]  │  │ [? Demander complément]│  │  [✗ Refuser]     │ │
│                           │  └───────────────┘  └────────────────────────┘  └──────────────────┘ │
│                           └────────────────────────────────────────────────────────────────────────┘
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 3 — Modal de refus (motif obligatoire)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  [Fond grisé — overlay]                                                                              │
│                                                                                                      │
│             ┌───────────────────────────────────────────────────────────┐                           │
│             │  Refuser la demande de compte                          [X]│                           │
│             ├───────────────────────────────────────────────────────────┤                           │
│             │                                                           │                           │
│             │  Société : Dupont Travaux Publics                         │                           │
│             │  Contact : Thomas Mercier                                 │                           │
│             │                                                           │                           │
│             │  Motif du refus *                                         │                           │
│             │  ┌─────────────────────────────────────────────────────┐  │                           │
│             │  │  Sélectionner un motif...                         ▼ │  │                           │
│             │  └─────────────────────────────────────────────────────┘  │                           │
│             │    · SIRET invalide ou introuvable                         │                           │
│             │    · Pièces justificatives manquantes                      │                           │
│             │    · Activité non conforme au périmètre                    │                           │
│             │    · Doublon de compte existant                            │                           │
│             │    · Autre (préciser ci-dessous)                           │                           │
│             │                                                           │                           │
│             │  Commentaire complémentaire (facultatif)                  │                           │
│             │  ┌─────────────────────────────────────────────────────┐  │                           │
│             │  │                                                     │  │                           │
│             │  │                                                     │  │                           │
│             │  └─────────────────────────────────────────────────────┘  │                           │
│             │                                                           │                           │
│             │  ⚠ Un email de refus sera envoyé automatiquement.         │                           │
│             │                                                           │                           │
│             │  ┌──────────────────────┐     ┌──────────────────────┐   │                           │
│             │  │   [Annuler]          │     │  [Confirmer le refus]│   │                           │
│             │  └──────────────────────┘     └──────────────────────┘   │                           │
│             └───────────────────────────────────────────────────────────┘                           │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Mobile — 375px (état nominal — contexte secondaire)

```
┌───────────────────────────┐
│ ≡  BACK-OFFICE Company-Test    │
├───────────────────────────┤
│ Comptes en attente  [3]   │
├───────────────────────────┤
│                           │
│ ┌─────────────────────────┐│
│ │ Dupont Travaux Publics  ││
│ │ T. Mercier              ││
│ │ Demandé le 18/05/2026   ││
│ │ [Voir détail →]         ││
│ ├─────────────────────────┤│
│ │ ← Swipe gauche          ││
│ │   [✗ Refuser]           ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ BTP Moreau              ││
│ │ M. Durand               ││
│ │ Demandé le 19/05/2026   ││
│ │ [Voir détail →]         ││
│ └─────────────────────────┘│
│                           │
│ ┌─────────────────────────┐│
│ │ Chantiers3D             ││
│ │ J. Klein                ││
│ │ Demandé le 20/05/2026   ││
│ │ [Voir détail →]         ││
│ └─────────────────────────┘│
│                           │
└───────────────────────────┘
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Badge compteur `[3]` sur menu nav | Nielsen #1 — Visibilité de l'état du système | Isabelle doit voir immédiatement le nombre de dossiers à traiter sans entrer dans la section |
| Bouton [Refuser] désactivé sans motif sélectionné | Nielsen #5 — Prévention des erreurs | Empêcher un refus non documenté — obligatoire pour traçabilité et conformité RGPD |
| Modal de confirmation avant refus | Nielsen #9 — Aide à la reconnaissance d'erreurs | Action irréversible (email envoyé) — l'utilisateur doit confirmer explicitement |
| Dropdown motif standardisé | Nielsen #4 — Cohérence et standards | Harmonise les libellés pour les futurs filtres et reporting |
| Bouton [Demander complément] | Nielsen #10 — Aide et documentation | Alternative intermédiaire entre validation et refus — réduit les refus injustifiés |
| Pièces jointes cliquables | Nielsen #7 — Flexibilité | Isabelle peut vérifier les documents sans quitter la fiche |
| Mobile = contexte secondaire | Priorité back-office = desktop | Un admin sur chantier reste un cas d'usage marginal — liste simplifiée suffisante |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Liste "Comptes en attente" | Views admin filtrée sur `user.field_account_status = pending` |
| Badge compteur menu | Hook `hook_menu_links_alter` + requête COUNT sur users en attente |
| Fiche détail | Custom admin page — `AccountValidationController::detail()` |
| Boutons [Valider] / [Refuser] | `AccountValidationService::approve()` / `::reject()` |
| Workflow états | Drupal State Machine — états : `pending → approved / rejected / pending_complement` |
| Modal motif refus | Drupal Dialog API (jQuery UI) ou CKEditor modal |
| Envoi email automatique | `MailManager::mail()` avec template `account_rejected` |
| Swipe mobile | Gesture JS (touch event) — déclenchement action contextuelle |
