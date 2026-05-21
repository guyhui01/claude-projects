# Rétrospective — Sprint 4

## Informations
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 4 — Canal e-Commerce B2B Complet |
| Date | 2026-06-24 |
| Durée | 1h30 |
| Facilitateur | Scrum Master |
| Participants | PO · SM · Dev1 · Dev2 · Dev3 · Dev4 |
| Format | Start / Stop / Continue + Actions |

---

## Résultat Sprint 4

| Indicateur | Valeur |
|-----------|--------|
| SP planifiés | 16 |
| SP livrés | 16 |
| Sprint Goal atteint | ✅ Oui — canal e-commerce B2B complet |
| Vélocité mesurée | 16 pts |
| US livrées | US-019 · US-021 · US-003 · US-008 |
| US non livrées | Aucune ✅ |
| Incidents recette | 0 critique · 0 majeur |
| Milestone M4 | ✅ System Demo ART validée |
| Checklist Go-Live DSI | ✅ Validée sans réserve |

---

## Format : Start / Stop / Continue

### ✅ CONTINUE — Ce qui a bien fonctionné

| # | Observation | Voté par |
|---|-------------|----------|
| C1 | **Checklist Go-Live DSI** : instaurée au Sprint 4, elle a structuré la préparation à la mise en production. Marc T. (DSI) a validé tous les points sans réserve en Sprint Review. Aucune surprise sur les aspects sécurité/RGPD/monitoring. | Dev4 · SM · PO |
| C2 | **Tests E2E Behat** : la suite de tests Behat couvre maintenant tout le flux commande. 3 régressions détectées automatiquement en CI avant merge, aucune n'a atteint la Sprint Review. | Dev1 · Dev2 · QA |
| C3 | **Matrice de test carte × banque** : US-019 intègre des données transporteur variées (Chronopost Express, Standard, Colissimo). Aucun incident recette sur le calcul des frais de livraison. | Dev3 · QA |
| C4 | **Refinement mid-sprint** : la session a préparé l'IP Sprint (US-004, US-020, US-022, US-023). L'équipe est entrée en IP Sprint avec toutes les US à DoR complète. | PO · Dev4 |
| C5 | **Gate DoR strict** : 4 sprints consécutifs sans démarrage d'US hors DoR. La règle est maintenant une évidence pour toute l'équipe. | Équipe |

---

### 🛑 STOP — Ce qu'on arrête

| # | Observation | Voté par |
|---|-------------|----------|
| S1 | **Dépendance à une donnée externe reçue tardivement** : la grille tarifaire transporteur (nécessaire pour US-019) a été reçue par email à J-3 avant la fin du sprint. Dev3 a dû interrompre US-003 pour traiter l'import urgent. Le risque était identifié mais non formellement géré. | Dev3 · Dev4 · SM |
| S2 | **Grille tarifaire transporteur non versionée en amont** : la grille Excel reçue de Chronopost n'était pas dans le dépôt projet. En cas de litige ou de question du PO, aucune traçabilité. | Dev3 · PO |

---

### 🚀 START — Ce qu'on démarre

| # | Proposition | Voté par |
|---|-------------|----------|
| T1 | **Contractualiser la réception des données métier à J-14 avant le sprint** : toute donnée externe (grille tarifaire, référentiel produit, configuration partenaire) doit être reçue et validée par le PO au plus tard J-14 avant le début du sprint qui en dépend. Formalisé dans le DoR du PI suivant. | Dev3 · Dev4 · SM · PO |
| T2 | **Versioning des fichiers de configuration métier** : grilles tarifaires, templates email, paramètres Stripe — tout versioné dans le dépôt Git projet avec date de réception et validé par le PO. | Dev2 · PO |
| T3 | **Recensement des dépendances externes dès le PI Planning** : liste des dépendances transporteurs, partenaires API, données métier — avec propriétaire et date de livraison attendue. Intégrée au Risk Board ART. | SM · PO |

---

## Actions décidées

| ID | Action | Responsable | Échéance | Statut |
|----|--------|-------------|----------|--------|
| A1 | Formaliser la règle "données métier à J-14" dans le DoR du PI suivant | PO + SM | Avant IP Sprint Planning | À faire |
| A2 | Versionner dans Git les fichiers de configuration métier Sprint 4 (grille Chronopost, templates SendGrid) | Dev2 + Dev3 | 2026-06-27 | À faire |
| A3 | Préparer le recensement des dépendances externes pour le PI Planning suivant (Risk Board ART) | SM + PO | IP Sprint — semaine 9 | À faire |
| A4 | Documenter le retour d'expérience US-019 (API Chronopost) pour capitalisation | Dev3 | 2026-06-30 | À faire |

---

## Vélocité & capacité

| Métrique | Sprint 4 | IP Sprint (prévision) |
|----------|-----------|-----------------------|
| SP livrés | 16 | 13 (planifiés) |
| US reportées | 0 | — |
| Absentéisme | 0 | 0 prévu |
| Capacité | 4 dev × 2 semaines | identique |
| Qualité | 0 incident recette | Objectif maintenu |

> **Note PO** : 16 SP livrés, 0 incident, Milestone M4 validé. La meilleure performance du PI. La maturité de l'équipe sur les processus (DoR, BDD, Behat, checklist Go-Live) est clairement visible. L'IP Sprint doit maintenir ce niveau de qualité pour préparer la mise en production.

---

## Satisfaction équipe

| Critère | Note /5 | Commentaire |
|---------|---------|-------------|
| Clarté des US | 5/5 | DoR parfaite sur les 4 US |
| Qualité des livrables | 5/5 | 0 incident recette — premier sprint à 5/5 |
| Collaboration équipe | 5/5 | Réactivité sur la grille tarifaire, System Demo réussie |
| Confiance IP Sprint | 4.5/5 | Légère inquiétude sur la densité IP Sprint (stabilisation + 4 US) |

---

## Décisions actées

1. **Canal e-commerce B2B complet en recette** — prêt pour UAT avec clients pilotes Company-Test en IP Sprint.
2. **Règle J-14 pour données métier** — intégrée au DoR du PI suivant.
3. **Versioning des configs métier** — mis en place immédiatement.
4. **Risk Board ART pour PI suivant** — dépendances externes recensées dès le PI Planning.
5. **IP Sprint** : objectif qualité maintenu — 0 régression sur le périmètre Sprint 1-4 pendant la stabilisation.
