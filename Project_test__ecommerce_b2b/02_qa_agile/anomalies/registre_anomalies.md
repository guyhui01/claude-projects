# Registre des Anomalies — Company-Test e-Commerce B2B

> PI-2026-Q3 TERMINÉ · Dernière mise à jour : 2026-07-14

## Définitions

| Champ | Description |
|-------|-------------|
| **ID** | ANO-XXX (séquentiel) |
| **Titre** | Description courte du problème |
| **US liée** | ID de la User Story concernée |
| **Sévérité** | Critique / Majeur / Mineur / Cosmétique |
| **Priorité** | Haute / Moyenne / Basse |
| **Statut** | Nouveau · En cours · Corrigé · Fermé · Rejeté |
| **Sprint détecté** | Sprint où l'anomalie a été détectée |
| **Sprint corrigé** | Sprint de correction effective |
| **Assigné à** | Développeur responsable du correctif |

## Workflow anomalie

```
Nouveau → En cours → Corrigé (staging) → Fermé (prod)
                   ↘ Rejeté (si non-reproductible ou hors spec)
```

**Critères de transition :**
- **Nouveau → En cours** : Développeur assigné, sprint cible défini
- **En cours → Corrigé** : Fix mergé, tests unitaires passants, déployé staging
- **Corrigé → Fermé** : PO validé en staging + déployé en production
- **→ Rejeté** : PO confirme que c'est un comportement attendu ou hors périmètre V1

## Escalade anomalies critiques

| Délai | Action | Qui |
|-------|--------|-----|
| Critique ouverte > 4h | Notification PO + Tech Lead | SM |
| Critique ouverte > 24h | Arrêt sprint · réunion urgente | PO + SM + Tech Lead |
| Critique en production | War room immédiat · rollback si nécessaire | Toute l'équipe |

---

## Registre complet — PI-2026-Q3

| ID | Titre | US | Sévérité | Priorité | Statut | Sprint détecté | Sprint corrigé | Assigné |
|----|-------|-----|----------|---------|--------|---------------|---------------|---------|
| ANO-001 | Paiement 3DS bloqué pour cartes Visa BNP Paribas | US-016 | Majeur | Haute | ✅ Fermé | S3 | S3 | Dev3 |
| ANO-002 | Grille tarifaire négociée non appliquée (compte multi-site) | US-008 | Majeur | Haute | ✅ Fermé | S4 | S4 | Dev Lead |
| ANO-003 | Email confirmation — encoding UTF-8 caractères accentués (é, è, ç) | US-011 | Mineur | Moyenne | ✅ Fermé | S2 | S2 | Dev2 |
| ANO-004 | Pagination catalogue — page 2 vide si filtre catégorie actif | US-001 | Mineur | Moyenne | ✅ Fermé | S2 | S3 | Dev1 |
| ANO-005 | Dashboard admin — tri par date commande inversé (plus ancien en premier) | US-013 | Mineur | Basse | ✅ Fermé | S2 | S2 | Dev3 |
| ANO-006 | Facture PDF — logo Company-Test absent sur configs Apache non-standard | US-018 | Mineur | Moyenne | ✅ Fermé | S3 | S4 | Dev2 |
| ANO-007 | Formulaire inscription — champ SIRET pré-rempli si retour navigateur (cache) | US-005 | Mineur | Basse | ✅ Fermé | S1 | S1 | Dev1 |
| ANO-008 | Fiche produit — breadcrumb absent en vue mobile (375px) | US-002 | Mineur | Basse | ✅ Fermé | S1 | S2 | Dev4 |
| ANO-009 | Export CSV — montants avec virgule décimale au lieu de point (locale FR) | US-015 | Mineur | Moyenne | ✅ Fermé | S4 | IP | Dev2 |

---

## Analyse des anomalies majeures

### ANO-001 — Paiement 3DS bloqué Visa BNP
**Description** : La redirection 3DS2 échouait silencieusement pour les cartes Visa émises par BNP Paribas. L'acheteur voyait un message générique "Paiement refusé" sans indication de la cause. Les cartes Mastercard n'étaient pas affectées.

**Cause racine** : Le module `commerce_stripe` v1.0.x utilisait un paramètre `return_url` non conforme aux exigences BNP Paribas pour la vérification 3DS. Stripe SDK retournait un PaymentIntent status `requires_action` non géré.

**Correctif** : Mise à jour `commerce_stripe` v1.1.2 + ajout d'une matrice de test cartes × banques émetteurs (Visa BNP, Visa Société Générale, Mastercard Crédit Agricole). Tests Behat enrichis pour couvrir les cas 3DS declined.

**Impact découverte** : Détecté en staging S3 lors des tests avec les cartes de test Stripe. Non impactant en production (pas encore live), mais corrigé avant le go-live.

---

### ANO-002 — Grille tarifaire négociée non appliquée (multi-site)
**Description** : Pour les acheteurs B2B avec plusieurs comptes liés (groupe multi-sites), la grille tarifaire négociée n'était appliquée qu'au premier compte créé. Les comptes suivants du même groupe voyaient les tarifs catalogue standard.

**Cause racine** : Le service `PriceResolver` résolvait le tarif uniquement en fonction de l'`uid` Drupal individuel, sans remonter au groupe parent. La notion de "groupe client" n'était pas dans le schéma entité V1.

**Correctif** : Ajout d'un champ `field_client_group` sur l'entité User + modification du `PriceResolver` pour remonter au groupe si le champ est renseigné. Solution temporaire V1 (mapping manuel par admin) — solution automatique prévue Phase 2 via ERP.

---

## Métriques qualité PI

| Indicateur | Valeur | Cible | Résultat |
|-----------|--------|-------|---------|
| Taux de détection en sprint (shift-left) | 89% | ≥ 80% | ✅ |
| Délai moyen correction anomalie Majeur | < 5j | ≤ 24h | 🟡 (ANO-001 et ANO-002 nécessitaient investigation) |
| Délai moyen correction anomalie Mineur | < 2 sprints | — | ✅ |
| Anomalies critiques ouvertes fin sprint | 0 | 0 | ✅ |
| Anomalies en production (post go-live) | 0 | 0 | ✅ |
| Total anomalies PI | 9 | — | Référence V1 |

## Template — Créer une anomalie

```markdown
### ANO-XXX — [Titre court descriptif]

**URL / Écran** : [URL staging ou chemin Drupal]
**Navigateur / OS** : [ex: Chrome 124 · Windows 11]
**Reproductible** : Toujours / Parfois / Une seule fois
**US liée** : US-XXX

**Étapes pour reproduire** :
1. [Action 1]
2. [Action 2]
3. [Résultat observé]

**Résultat attendu** : [Comportement correct]
**Résultat obtenu** : [Comportement bugué]
**Capture d'écran** : [Joindre si visuel]

**Sévérité proposée** : Critique / Majeur / Mineur / Cosmétique
```
