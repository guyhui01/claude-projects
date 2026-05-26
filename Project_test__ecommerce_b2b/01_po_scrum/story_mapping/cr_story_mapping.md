# Compte-Rendu — Atelier Story Mapping
## Projet : Company-Test e-Commerce B2B — Drupal

---

## Informations

| Champ | Valeur |
|-------|--------|
| Date | 2026-04-15 (en amont du PI-2026-Q3) |
| Durée | 2h30 |
| Lieu | Salle de réunion Company-Test + Miro (remote Dev4) |
| Animateur | PO — Guy H. |
| Rédacteur CR | BA — Marie L. |

---

## Participants

| Rôle | Nom | Présence |
|------|-----|---------|
| Product Owner | Guy H. (Adservio) | ✅ Présentiel |
| Business Analyst | Marie L. (Company-Test) | ✅ Présentiel |
| UX/UI Designer | Sophie M. (Company-Test) | ✅ Présentiel |
| Dev Lead Drupal | Thomas B. | ✅ Présentiel |
| Dev Back-end | Dev3 (Company-Test) | 🖥️ Remote (Miro) |
| Direction Commerciale | Rémi D. (sponsor) | ✅ Présentiel — 1ère heure uniquement |

---

## Objectifs de l'atelier

1. Cartographier le parcours utilisateur complet de l'acheteur B2B et de l'admin Company-Test
2. Identifier les activités, tâches et user stories à haut niveau
3. Définir le **walking skeleton** (MVP minimal fonctionnel)
4. Aligner PO, BA, UX et DEV sur le périmètre V1 avant le PI Planning

---

## Méthode utilisée

**Story Mapping (Jeff Patton)** — 3 niveaux :
- **Niveau 1 — Activités** (backbone) : grandes étapes du parcours utilisateur
- **Niveau 2 — Tâches** : actions concrètes dans chaque activité
- **Niveau 3 — User Stories** : découpages en stories INVEST pour le backlog

Outil : post-its Miro + tableau blanc physique
Livrable : `story_map.md` + backlog initial MoSCoW

---

## Déroulé de l'atelier

### Phase 1 — Cadrage (15 min) — avec Rémi D.

**PO** : "On commence par poser le persona central. Qui est l'acheteur B2B Company-Test ?"

**Rémi D. (Direction Commerciale)** : "C'est un responsable achats ou un chef de chantier chez un installateur télécoms ou un opérateur fibre. Il commande des câbles FTTH et des boîtiers en grande quantité. Aujourd'hui il appelle ou envoie un mail, il veut passer commande en autonomie 24h/24."

**BA** : "Est-ce qu'il est familier avec les e-commerce B2B ?"
**Rémi D.** : "Oui, certains utilisent déjà des portails fournisseurs. Il s'attend à voir ses tarifs négociés dès la connexion."

**UX/UI** : "Donc le tarif B2B visible dès la fiche produit, c'est non-négociable ?"
**Rémi D.** : "Absolument. C'est la première chose qu'il regarde."

> ✅ **Décision actée** : Le tarif B2B visible dès la fiche produit pour tout acheteur connecté est un critère de go/no-go de la recette finale.

*Rémi D. quitte la réunion à 9h15.*

---

### Phase 2 — Construction du Backbone (30 min)

**PO** (au tableau) : "On liste les grandes activités dans l'ordre chronologique du parcours. Qui commence ?"

**UX/UI** : "Le tout début, c'est la découverte. Avant même de s'inscrire, l'acheteur arrive sur le site. Est-ce qu'on a une vitrine publique ?"
**BA** : "Oui — les produits sont visibles mais sans tarif pour les anonymes."
**DEV Lead** : "Techniquement c'est un contrôle d'accès Drupal sur le champ prix. Simple."

**PO** : "Donc backbone : Découvrir → S'inscrire → Se connecter → Commander → Payer → Suivre. Et côté admin : Valider les comptes → Gérer les commandes."

**BA** : "Il faut distinguer les deux personas : acheteur B2B et admin Company-Test. Deux colonnes ?"
**PO** : "Non, on fait une lecture chronologique avec une ligne de séparation. Le parcours acheteur d'abord, le parcours admin en dessous."

> ✅ **Décision actée** : Story map en deux swimlanes — Acheteur B2B / Admin Company-Test.

---

### Phase 3 — Détail des tâches par activité (50 min)

*Travail en binômes sur Miro — UX+BA sur le parcours acheteur, PO+DEV sur le parcours admin.*

**Tensions notées pendant la session :**

**DEV Lead** (sur l'activité "S'inscrire") : "Validation SIRET via l'API INSEE — c'est 2 jours minimum de développement, il faut appeler l'API, gérer les erreurs, les cas de SIRET inexistants..."
**PO** : "C'est vraiment bloquant pour V1 ?"
**BA** : "Fonctionnellement, si le SIRET est au bon format, l'admin Company-Test peut vérifier lui-même avant de valider le compte. Ce n'est pas une vérification automatique."
**PO** : "OK. On descope l'API INSEE pour V1 — validation regex 14 chiffres uniquement. On le note clairement sur le post-it."

> ✅ **Décision actée** : Validation SIRET = regex 14 chiffres V1. API INSEE = Phase 2.
> *Note : cette décision a ensuite été confirmée en Planning Poker Sprint 1 (2026-05-20).*

**UX/UI** (sur "Fiche produit") : "Est-ce qu'on a les fiches techniques PDF dès le lancement ?"
**BA** : "Company-Test a les fichiers, mais pas tous numérisés. Peut-être 30% du catalogue au lancement."
**UX/UI** : "On prévoit le lien PDF en Could Have alors — on affiche le bouton uniquement si le fichier est renseigné."
**DEV Lead** : "Drupal — champ fichier optionnel, affiché conditionnel en Twig. Trivial."

> ✅ **Décision actée** : Fiche technique PDF = Could Have (US-004) — bouton conditionnel à l'existence du fichier.

**BA** (sur "Passer commande") : "Le numéro de bon de commande interne — c'est obligatoire pour tous les clients ?"
**Rémi D.** (par téléphone rapide) : "Oui, c'est une obligation comptable pour nos gros clients. Sans N° BC, la commande ne peut pas être traitée côté Company-Test."
**PO** : "Donc c'est Must Have, pas Could Have comme je l'avais noté initialement."

> ✅ **Décision actée** : US-010 (N° bon de commande) = Must Have, champ obligatoire au checkout.

**DEV Lead** (sur "Payer") : "Quel PSP ? Stripe, PayPlug, autre ?"
**PO** : "On fait un spike en Sprint 1 pour trancher. Je bloque 1 jour pour Dev1."
**BA** : "PayPlug est français, réglementaire RGPD plus simple. Stripe est plus puissant côté 3DS."
**DEV Lead** : "Les deux ont un module Drupal Commerce. On évaluera les frais de transaction aussi."

> ✅ **Décision actée** : SPIKE PSP Sprint 1 — 1 jour timebox. *Résultat : Stripe retenu (2026-05-20).*

---

### Phase 4 — Découpage en Releases (25 min)

**PO** : "On tire des lignes horizontales pour définir les releases. Qu'est-ce qui est absolument nécessaire pour que l'acheteur B2B passe sa première commande ?"

**UX/UI** : "Catalogue navigable + compte actif + connexion. Sans ça, rien ne fonctionne."
**BA** : "Et la validation admin — si Company-Test ne peut pas activer les comptes, personne ne commande."
**DEV Lead** : "Sprint 1 = fondations. Sprint 2 = commande bout en bout. Sprint 3 = paiement. Sprint 4 = enrichissement."

**PO** : "Parfait. C'est notre walking skeleton : un acheteur peut créer un compte, le faire valider, se connecter, voir le catalogue et ses tarifs. Pas encore de commande — ça c'est Sprint 2."

> ✅ **Walking skeleton défini** : Sprint 1 = compte B2B activé + catalogue navigable.

**BA** : "Le paiement différé 30j — plusieurs gros clients le demandent."
**PO** : "C'est hors scope V1. Trop de complexité : validation crédit, intégration ERP, juridique. On le met en Phase 2."
**DEV Lead** : "Accord — l'intégration avec leur ERP/SAP serait un projet à part entière."

> ✅ **Décision actée** : US-017 (paiement différé 30j) = Phase 2. Hors scope V1.

---

### Phase 5 — Relecture collective et DoR préliminaire (20 min)

**UX/UI** : "Pour Sprint 1, j'ai besoin de 3 semaines pour les wireframes catalogue et fiche produit avant que les devs démarrent."
**PO** : "Le PI Planning est dans 3 semaines. Tu peux livrer les wireframes avant le Sprint Planning ?"
**UX/UI** : "Catalogue et fiche produit oui. Le checkout, je peux faire un wireframe basse fidélité pour Sprint 2."

> ✅ **Décision actée** : Wireframes catalogue + fiche produit = critère DoR Sprint 1. Wireframes checkout = critère DoR Sprint 2.

**BA** : "Les templates emails — qui les rédige ?"
**PO** : "BA + Direction Commerciale pour les textes. Dev intègre dans SendGrid."
**BA** : "Je bloque ça dans mon planning. 4 templates pour Sprint 1 : confirmation inscription, notif admin, activation compte, refus compte."

> ✅ **Décision actée** : BA rédige les 4 templates email Sprint 1 avant le Sprint Planning.

---

## Décisions actées — Synthèse

| # | Décision | Impacte | Acté par |
|---|----------|---------|---------|
| D1 | Tarif B2B visible pour tout acheteur connecté = critère go/no-go recette | US-002 | PO + Direction Commerciale |
| D2 | Story map en 2 swimlanes : Acheteur B2B / Admin Company-Test | Story map | PO + BA |
| D3 | Validation SIRET = regex 14 chiffres V1 — API INSEE Phase 2 | US-005 | PO + BA + DEV |
| D4 | Fiche technique PDF = Could Have (bouton conditionnel) | US-004 | PO + UX |
| D5 | N° bon de commande = Must Have, champ obligatoire au checkout | US-010 | PO + BA |
| D6 | SPIKE PSP Sprint 1 (1j timebox) → Stripe retenu le 2026-05-20 | US-016 | PO + DEV |
| D7 | US-017 Paiement différé 30j = Phase 2 (hors scope V1) | Backlog | PO + DEV + BA |
| D8 | Walking skeleton Sprint 1 = compte B2B activé + catalogue navigable | Sprint 1 | Équipe |
| D9 | Wireframes catalogue + fiche produit = critère DoR Sprint 1 | DoR | PO + UX |
| D10 | BA rédige 4 templates email avant Sprint Planning Sprint 1 | Sprint 1 | BA |

---

## Actions post-atelier

| ID | Action | Responsable | Échéance | Statut |
|----|--------|-------------|----------|--------|
| A1 | Formaliser le story map en tableau Miro → export `story_map.md` | BA | 2026-04-17 | ✅ Fait |
| A2 | Créer les EPIC et Features dans le backlog Jira | PO | 2026-04-20 | ✅ Fait |
| A3 | Rédiger les User Stories Sprint 1 au format INVEST | PO | 2026-04-25 | ✅ Fait |
| A4 | Livrer wireframes catalogue + fiche produit | UX/UI | 2026-05-08 | ✅ Fait |
| A5 | Rédiger les 4 templates email Sprint 1 | BA | 2026-05-10 | ✅ Fait |
| A6 | Préparer l'environnement DDEV local pour l'équipe | DEV Lead | 2026-05-12 | ✅ Fait |
| A7 | Organiser le PI Planning (2026-05-15) | PO + SM | 2026-05-01 | ✅ Fait |

---

## Prochaine étape
PI Planning — 2026-05-15 → `01_po_scrum/pi_planning/PI-2026-Q3.md`
