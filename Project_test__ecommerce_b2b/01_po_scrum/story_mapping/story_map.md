# Story Map — Company-Test e-Commerce B2B

## Informations
| Champ | Valeur |
|-------|--------|
| Date | 2026-04-15 |
| Méthode | Story Mapping — Jeff Patton |
| Outil | Miro + tableau blanc |
| Source | CR atelier → `cr_story_mapping.md` |

---

## Personas

| Persona | Rôle | Objectif principal |
|---------|------|--------------------|
| **Acheteur B2B** | Responsable achats / Chef de chantier installateur télécoms | Commander des câbles FTTH et boîtiers fibres en autonomie, voir ses tarifs négociés |
| **Admin Company-Test** | Responsable commercial / ADV | Valider les comptes clients, traiter et suivre les commandes |

---

## Story Map

### 🧭 SWIMLANE 1 — Acheteur B2B

```
ACTIVITÉS   │ Découvrir      │ S'inscrire       │ Se connecter    │ Commander          │ Payer           │ Suivre
(Backbone)  │ le catalogue   │ un compte B2B    │                 │                    │                 │
────────────┼────────────────┼──────────────────┼─────────────────┼────────────────────┼─────────────────┼──────────────
TÂCHES      │ Naviguer par   │ Remplir          │ Se connecter    │ Ajouter au panier  │ Saisir CB 3DS   │ Voir statut
            │ catégorie      │ le formulaire    │ email + mdp     │                    │ (Stripe)        │ commande
            │                │ d'inscription    │                 │                    │                 │
            │ Consulter une  │ Valider le SIRET │ Message si      │ Saisir N° bon      │                 │ Recevoir N°
            │ fiche produit  │ (regex 14 ch.)   │ compte en att.  │ de commande        │                 │ de suivi
            │                │                  │                 │                    │                 │
            │ Voir le tarif  │ Recevoir email   │ Message si      │ Valider commande   │                 │ Historique
            │ B2B HT         │ de confirmation  │ compte refusé   │                    │                 │ commandes
            │                │                  │                 │                    │                 │
            │ Filtrer les    │                  │ Blocage après   │ Recevoir email     │                 │
            │ produits       │                  │ 5 tentatives    │ confirmation       │                 │
            │                │                  │                 │                    │                 │
            │ Télécharger    │                  │ Récupération    │                    │                 │
            │ fiche tech PDF │                  │ mot de passe    │                    │                 │
```

---

### 🔧 SWIMLANE 2 — Admin Company-Test

```
ACTIVITÉS   │ Gérer les comptes B2B              │ Gérer les commandes
(Backbone)  │                                    │
────────────┼────────────────────────────────────┼──────────────────────────────────────
TÂCHES      │ Recevoir notif nouvelle demande    │ Voir dashboard commandes
            │                                    │
            │ Voir liste demandes en attente     │ Mettre à jour statut commande
            │ (badge compteur)                   │
            │                                    │ Notifier l'acheteur (email)
            │ Valider un compte → email activ.   │
            │                                    │ Générer facture PDF
            │ Rejeter avec motif → email refus   │
            │                                    │ Exporter commandes CSV
            │ Bloquer rejet sans motif           │
```

---

## Découpage en Releases (Sprints)

```
                  │ Découvrir │ S'inscrire │ Se connecter │ Commander │ Payer  │ Suivre │ Admin comptes │ Admin commandes
──────────────────┼───────────┼────────────┼──────────────┼───────────┼────────┼────────┼───────────────┼────────────────
SPRINT 1          │ Naviguer  │ Formulaire │ Connexion    │           │        │        │ Notif admin   │
(Walking          │ catégorie │ inscription│ email + mdp  │           │        │        │ Liste att.    │
 Skeleton)        │ Fiche     │ SIRET regex│ En attente   │           │        │        │ Valider       │
                  │ produit   │ Email conf.│ Refusé       │           │        │        │ Rejeter+motif │
                  │ Tarif B2B │            │ Blocage 5x   │           │        │        │ Badge compteur│
──────────────────┼───────────┼────────────┼──────────────┼───────────┼────────┼────────┼───────────────┼────────────────
SPRINT 2          │           │            │              │ Panier    │        │        │               │ Dashboard
(Commande         │           │            │              │ N° BC     │        │        │               │ Statut + notif
 bout en bout)    │           │            │              │ Commande  │        │        │               │ Export CSV
                  │           │            │              │ Email conf│        │        │               │
──────────────────┼───────────┼────────────┼──────────────┼───────────┼────────┼────────┼───────────────┼────────────────
SPRINT 3          │           │            │              │           │ CB 3DS │        │               │ Facture PDF
(Paiement         │           │            │              │           │ Stripe │        │               │ Historique
 & facturation)   │           │            │              │           │        │        │               │ commandes
──────────────────┼───────────┼────────────┼──────────────┼───────────┼────────┼────────┼───────────────┼────────────────
SPRINT 4          │ Filtres   │            │              │           │        │ Statut │               │
(Enrichissement)  │ produits  │            │              │           │        │ N° suivi│              │
                  │           │            │              │           │        │ Histo. │               │
──────────────────┼───────────┼────────────┼──────────────┼───────────┼────────┼────────┼───────────────┼────────────────
IP SPRINT         │ Fiche PDF │            │ Récup. mdp   │           │        │ Adr.   │               │
(Could Have)      │           │            │              │           │        │ mult.  │               │
──────────────────┼───────────┼────────────┼──────────────┼───────────┼────────┼────────┼───────────────┼────────────────
PHASE 2           │           │ SIRET API  │              │           │ Paiem. │        │ Tarifs        │ Intégr.
(Hors scope V1)   │           │ INSEE      │              │           │ diff.  │        │ négociés      │ ERP/SAP
                  │           │            │              │           │ 30j    │        │ par client    │
```

---

## Traçabilité Story Map → Backlog

| Activité | Tâche | US ID | Sprint | MoSCoW |
|----------|-------|-------|--------|--------|
| Découvrir | Naviguer par catégorie | US-001 | S1 | Must |
| Découvrir | Fiche produit + tarif B2B | US-002 | S1 | Must |
| Découvrir | Filtres produits | US-003 | S4 | Should |
| Découvrir | Fiche technique PDF | US-004 | IP | Could |
| S'inscrire | Formulaire + SIRET regex | US-005 | S1 | Must |
| Se connecter | Connexion + statuts + blocage | US-006 | S1 | Must |
| Admin comptes | Validation / rejet + emails | US-007 | S1→S2 | Must |
| Découvrir | Tarifs négociés par client | US-008 | S4 | Could |
| Commander | Ajout panier | US-009 | S2 | Must |
| Commander | N° bon de commande | US-010 | S2 | Must |
| Commander | Email confirmation commande | US-011 | S2 | Must |
| Suivre | Historique commandes | US-012 | S3 | Should |
| Admin commandes | Dashboard back-office | US-013 | S2 | Must |
| Admin commandes | Statut + notification client | US-014 | S2 | Must |
| Admin commandes | Export CSV | US-015 | S3 | Should |
| Payer | CB 3D Secure Stripe | US-016 | S3 | Must |
| Payer | Paiement différé 30j | US-017 | Phase 2 | — |
| Admin commandes | Facture PDF | US-018 | S3 | Should |
| Suivre | Frais livraison automatique | US-019 | S4 | Should |
| Suivre | Adresses livraison multiples | US-020 | IP | Could |
| Suivre | N° suivi transporteur | US-021 | S4 | Should |
| Admin comptes | Notif email nouvelle demande | US-022 | IP | Could |
| S'inscrire | Email bienvenue + guide | US-023 | IP | Could |

---

## Décisions clés issues de l'atelier

> Voir détail complet : `cr_story_mapping.md`

- **D3** — SIRET = regex 14 chiffres (API INSEE Phase 2)
- **D5** — N° BC = Must Have, obligatoire au checkout
- **D7** — Paiement différé 30j = Phase 2
- **D8** — Walking skeleton S1 = compte activé + catalogue navigable
