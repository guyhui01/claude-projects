# Architecture Technique — Company-Test e-Commerce B2B

## Stack
| Couche | Technologie | Version |
|--------|-------------|---------|
| CMS | Drupal | 10.x (LTS) |
| E-commerce | Drupal Commerce | 2.x |
| Langage | PHP | 8.2 |
| Base de données | MySQL | 8.0 |
| Cache | Redis | 7.x |
| Serveur web | Nginx | 1.24 |
| PSP | Stripe | SDK PHP 13.x |
| Email transactionnel | SendGrid | SDK PHP 8.x |
| Transporteur | Chronopost API / Colissimo | REST JSON |
| Gestionnaire de paquets | Composer | 2.x |
| Gestion config | CMI (Config Management Initiative) | natif Drupal |
| Tests | PHPUnit 10 + Behat 3.x | — |
| CI/CD | GitHub Actions | — |

---

## Modules Contrib requis

| Module | Usage | Composer |
|--------|-------|----------|
| `commerce` | Commerce 2.x core | `drupal/commerce` |
| `commerce_product` | Catalogue produits | inclus commerce |
| `commerce_cart` | Panier | inclus commerce |
| `commerce_checkout` | Tunnel de commande | inclus commerce |
| `commerce_payment` | Intégration PSP | inclus commerce |
| `commerce_stripe` | Stripe gateway | `drupal/commerce_stripe` |
| `commerce_price` | Gestion des prix B2B | inclus commerce |
| `commerce_order` | Gestion commandes + workflow | inclus commerce |
| `views` | Listes produits, back-office | natif Drupal core |
| `content_moderation` | Workflow statut comptes B2B | natif Drupal core |
| `workflows` | Définition des transitions | natif Drupal core |
| `easy_breadcrumb` | Fil d'Ariane | `drupal/easy_breadcrumb` |
| `sendgrid_integration` | Emails transactionnels | `drupal/sendgrid_integration` |
| `flood_control` | Blocage tentatives connexion | `drupal/flood_control` |
| `token` | Tokens dans emails | `drupal/token` |
| `pathauto` | URLs propres | `drupal/pathauto` |
| `admin_toolbar` | Back-office ergonomie | `drupal/admin_toolbar` |

---

## Module custom principal

**`Company-Test_b2b`** — module principal du projet

```
web/modules/custom/Company-Test_b2b/
  ├── Company-Test_b2b.info.yml
  ├── Company-Test_b2b.module          # hooks généraux
  ├── Company-Test_b2b.routing.yml     # routes back-office
  ├── Company-Test_b2b.permissions.yml # permissions custom
  ├── Company-Test_b2b.services.yml    # services DI
  ├── Company-Test_b2b.install         # install/update hooks
  ├── config/install/             # config YAML initiale
  ├── src/
  │   ├── Controller/             # controllers back-office
  │   ├── Form/                   # formulaires custom
  │   ├── Plugin/Constraint/      # SiretConstraint
  │   ├── EventSubscriber/        # login, order events
  │   ├── Service/                # AccountValidationService
  │   └── Mail/                   # templates emails
  └── templates/                  # templates Twig custom
```

---

## Rôles Drupal

| Rôle | Machine name | Permissions clés |
|------|-------------|-----------------|
| Acheteur B2B | `b2b_buyer` | Voir tarifs B2B, ajouter au panier, passer commande |
| Admin Company-Test | `Company-Test_admin` | Valider/refuser comptes, gérer commandes, export CSV |
| Commercial Company-Test | `Company-Test_sales` | Voir commandes, mettre à jour statuts |
| Anonyme | `anonymous` | Voir produits, pas de tarifs |

---

## Schéma entités principales

```
User (acheteur B2B)
  ├── field_raison_sociale (string)
  ├── field_siret (string, 14 chiffres)
  ├── field_telephone (string)
  ├── field_compte_statut (list: en_attente / actif / refuse)
  └── field_motif_refus (text, optionnel)

Commerce Product (Câble FTTH / Boîtier fibre)
  ├── type: cable_ftth | boitier_fibre
  ├── field_fiche_technique (file PDF)
  └── variations:
       ├── field_reference (string, SKU)
       ├── field_conditionnement (list: bobine 100m / 500m / 1000m)
       └── price (B2B role-based)

Commerce Order (Commande B2B)
  ├── field_purchase_order_number (string)
  ├── state: draft / pending / processing / shipped / completed / canceled
  └── order_items → product_variation + quantity + unit_price

```

---

## Flux e-mail transactionnels (SendGrid)

| Événement | Template SendGrid | Déclencheur |
|-----------|------------------|-------------|
| Inscription B2B | `b2b_registration_confirm` | `hook_user_insert()` |
| Notif admin nouvelle demande | `b2b_admin_new_request` | `hook_user_insert()` |
| Compte activé | `b2b_account_activated` | Transition statut → actif |
| Compte refusé | `b2b_account_refused` | Transition statut → refuse |
| Confirmation commande | `b2b_order_confirm` | `OrderEvent::PLACE` |
| Statut commande mis à jour | `b2b_order_status_update` | Transition workflow commande |

---

## ADR-001 — Choix du PSP : Stripe vs PayPlug

**Date** : 2026-05-20 · **Statut** : Accepté · **Propriétaire** : Tech Lead + PO

**Contexte** : Spike 1 jour (timebox) en Sprint 1 pour évaluer les PSP compatibles Drupal Commerce 2.x. Deux candidats : Stripe (US, international) et PayPlug (français, RGPD-first).

| Critère | Stripe | PayPlug |
|---------|--------|---------|
| Module Drupal Commerce | `drupal/commerce_stripe` — mature, 50k+ installs | `drupal/commerce_payplug` — moins maintenu |
| Support 3DS2 (PSD2) | Natif — `PaymentIntents` API | Natif |
| RGPD / Hébergement données | Hébergement US (clauses SCCs) | Hébergement FR — RGPD simplifié |
| Frais transaction | 1,4% + 0,25€ (UE) | 1,2% + 0,25€ (FR) |
| Documentation développeur | Excellente | Correcte |
| Support 3DS carte Visa BNP | ✅ Confirmé après correction ANO-001 | Non testé |
| Webhook HMAC | ✅ Natif | ✅ Natif |

**Décision** : **Stripe retenu**. La maturité du module Drupal Commerce, la qualité de la documentation et la richesse de l'API 3DS2 l'emportent sur l'avantage RGPD de PayPlug. Les SCCs Stripe couvrent les exigences RGPD validées par le DPO le 2026-05-28.

**Conséquences** : SDK Stripe PHP 13.x — voir `composer.json`. Données de paiement hébergées chez Stripe (certifié PCI-DSS niveau 1) — aucune donnée carte stockée côté Drupal.

---

## ADR-002 — Architecture V1 couplée vs Headless dès le départ

**Date** : 2026-04-15 · **Statut** : Accepté · **Propriétaire** : PO + Tech Lead

**Contexte** : Choix entre lancer en V1 avec Drupal + Twig (couplé) ou directement en headless (Next.js + JSON:API).

**Décision** : **V1 couplée retenue**. Timeline de 10 semaines incompatible avec la mise en place d'un frontend Next.js (setup + apprentissage équipe + 2 pipelines CI/CD). L'équipe est Drupal-native — Twig est une force, pas une contrainte.

**Déclencheurs Go/No-go headless Phase 2** : voir section "Roadmap Phase 2" ci-dessous.

---

## Roadmap Phase 2 — Migration Headless

> **Contexte** : V1 = architecture couplée (Drupal + Twig). Phase 2 envisage un frontend découplé pour UX mobile-first et expérience acheteur enrichie.

### Schéma cible headless

```
┌─────────────────────────────────────────────────────┐
│                   FRONTEND (Phase 2)                 │
│   Next.js 14 App Router  ·  React  ·  Tailwind CSS  │
│   Storefront UI  ·  TypeScript  ·  Vercel / CDN      │
└────────────────────┬────────────────────────────────┘
                     │ JSON:API / GraphQL
                     │ OAuth2 (Simple OAuth)
┌────────────────────▼────────────────────────────────┐
│                  BACKEND — Drupal 10                 │
│   Drupal Commerce 2.x  ·  PHP 8.3  ·  Symfony 6.4  │
│   JSON:API  ·  Webhooks  ·  SendGrid  ·  Stripe     │
└────────────────────┬────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────┐
│                DONNÉES & CACHE                       │
│   MySQL 8.0  ·  Redis 7.x  ·  CDN (Cloudflare)     │
└─────────────────────────────────────────────────────┘
```

### Comparaison V1 vs Phase 2

| Critère | V1 — Couplé (Twig) | Phase 2 — Headless |
|---------|-------------------|-------------------|
| Stack frontend | PHP + Twig | Next.js + React + TypeScript |
| Agent DEV requis | AGENT-DEV-DRUPAL-PHP | + AGENT-DEV-TYPESCRIPT-IA |
| Temps de mise en œuvre | ✅ Baseline | +30-40% complexité |
| UX mobile | Responsive HTML | App-like, SPA |
| Performance frontend | Bonne | Excellente (SSR/SSG Next.js) |
| SEO | Natif Drupal | Next.js SSR (équivalent) |
| Complexité CI/CD | 1 pipeline | 2 pipelines (Drupal + Next.js) |
| Équipe requise | 4 dev Drupal | 4 dev Drupal + 2 dev React |
| Recommandé si | V1, timeline serrée | App mobile, UX riche, PI suivant |

### Prérequis techniques Phase 2

```
Côté Drupal (déjà prévu en V1) :
  ✅ JSON:API activé (module core)
  ✅ Simple OAuth (Bearer token)
  ✅ CORS configuré (services.yml)
  ⬜ jsonapi_extras (filtrer les champs exposés)
  ⬜ Decoupled Router (résolution des URLs)
  ⬜ Subrequests (batch de requêtes)

Côté Next.js (Phase 2) :
  ⬜ next-drupal SDK (https://next-drupal.org)
  ⬜ Storefront UI (composants Commerce)
  ⬜ Zustand / Jotai (state panier client)
  ⬜ Stripe.js Elements (3DS côté client)
```

### Déclencheurs de décision (Go/No-go Phase 2)

| Signal | Seuil recommandé |
|--------|-----------------|
| Trafic mobile acheteurs B2B | > 30% des sessions |
| Plaintes UX sur mobile | Récurrence Sprint 3-4 |
| Demande app mobile Company-Test | Validée par Direction Commerciale |
| Budget Phase 2 alloué | +2 dev React / +1 sprint setup |

---

## Conventions de nommage

| Élément | Convention | Exemple |
|---------|-----------|---------|
| Module custom | `Company-Test_*` | `Company-Test_b2b` |
| Hooks | `Company-Test_b2b_hook_name()` | `Company-Test_b2b_form_alter()` |
| Services | `Company-Test_b2b.service_name` | `Company-Test_b2b.account_validation` |
| Config YAML | `Company-Test_b2b.settings` | `Company-Test_b2b.settings.yml` |
| Templates Twig | `Company-Test-b2b--*.html.twig` | `Company-Test-b2b--product-card.html.twig` |
| Branches git | `feature/US-XXX-titre-court` | `feature/US-005-creation-compte-b2b` |
