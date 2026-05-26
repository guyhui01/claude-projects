# Reporting Qualité — Company-Test e-Commerce B2B

> PI-2026-Q3 TERMINÉ · Dernière mise à jour : 2026-07-14

## Définitions opérationnelles

| Métrique | Définition |
|----------|-----------|
| **US testées** | Nombre de US ayant au moins un scénario BDD exécuté + cas de test joués dans le sprint |
| **US validées** | US acceptées par le PO en Sprint Review (DoD complète : code + tests + staging + recette PO) |
| **Anomalies** | Total anomalies ouvertes au cours du sprint (Critique + Majeur + Mineur) |
| **Critiques ouvertes fin sprint** | Anomalies de sévérité Critique non fermées à la clôture du sprint (cible = 0) |
| **Couv. tests** | Coverage PHPUnit sur code custom (modules `Company-Test_*`) — lignes de code couvertes |

**Source des données** : Jenkins/GitHub Actions (coverage PHPUnit) · Behat HTML report · `registre_anomalies.md` · Sprint Review PO sign-off

---

## Métriques par sprint

| Sprint | US testées | US validées | Taux validation | Anomalies | Critiques fin sprint | Couv. tests |
|--------|-----------|-------------|----------------|-----------|---------------------|-------------|
| S1 | 5 | 4 | 80% | 2 (Mineur) | 0 | 68% |
| S2 | 7 | 7 | 100% | 3 (1 Majeur · 2 Mineur) | 0 | 74% |
| S3 | 5 | 5 | 100% | 2 (1 Majeur/3DS · 1 Mineur) | 0 en fin sprint | 81% |
| S4 | 6 | 6 | 100% | 2 (1 Majeur/tarif · 1 Mineur) | 0 en fin sprint | 84% |
| IP | 4 | 4 | 100% | 0 | 0 | 87% |
| **PI Total** | **27** | **26** | **96%** | **9** | **0** | **87%** |

> **Note S1 (80%)** : US-007 (validation compte admin) non livrée en S1 — reportée S2 suite à dépendance UX non résolue. Sprint Goal atteint malgré le report.

---

## KPIs qualité — Résultats vs Cibles

| KPI | Cible | S1 | S2 | S3 | S4 | IP | **Résultat PI** |
|-----|-------|-----|-----|-----|-----|-----|----------------|
| Couverture tests custom | ≥ 80% | 🟡 68% | 🟡 74% | ✅ 81% | ✅ 84% | ✅ 87% | ✅ **87%** |
| Taux US validées en sprint | ≥ 90% | 🟡 80% | ✅ 100% | ✅ 100% | ✅ 100% | ✅ 100% | ✅ **96%** |
| Anomalies critiques ouvertes fin sprint | 0 | ✅ 0 | ✅ 0 | ✅ 0 | ✅ 0 | ✅ 0 | ✅ **0** |
| Taux de détection shift-left (sprint) | ≥ 80% | ✅ 100% | ✅ 100% | 🟡 50% | ✅ 100% | ✅ 100% | ✅ **89%** |
| Régressions introduites par sprint | 0 | ✅ 0 | ✅ 0 | ✅ 0 | ✅ 0 | ✅ 0 | ✅ **0** |

> **Note S3 (détection 50%)** : L'anomalie 3DS Visa (ANO-001) a été détectée en staging S3 — non détectée en tests unitaires en amont car liée à un comportement spécifique carte Visa (vs Mastercard). Résolu dans le sprint.

> **Légende** : ✅ Cible atteinte · 🟡 Sous cible · 🔴 Cible manquée

---

## Seuils d'alerte

| KPI | Vert ✅ | Orange 🟡 | Rouge 🔴 | Action si rouge |
|-----|--------|----------|---------|----------------|
| Couverture tests | ≥ 80% | 70-79% | < 70% | Bloquer merge · Sprint dédié tests |
| Taux US validées | ≥ 90% | 80-89% | < 80% | PO + SM : re-planification immédiate |
| Critiques ouvertes fin sprint | 0 | — | ≥ 1 | Arrêt sprint · résolution avant review |
| Détection shift-left | ≥ 80% | 70-79% | < 70% | Revoir stratégie tests + DoR |

---

## Anomalies PI — Synthèse

| ID | Sprint détecté | Sévérité | Titre | Résolution |
|----|---------------|---------|-------|-----------|
| ANO-001 | S3 | Majeur | Paiement 3DS bloqué carte Visa BNP | Résolu S3 — matrice de test élargie |
| ANO-002 | S4 | Majeur | Grille tarifaire négociée non appliquée (client multi-site) | Résolu S4 — fix service `PriceResolver` |
| ANO-003 | S2 | Mineur | Email confirmation — encoding UTF-8 caractères accentués | Résolu S2 |
| ANO-004 | S2 | Mineur | Pagination catalogue — page 2 vide si filtre actif | Résolu S3 |
| ANO-005 | S2 | Mineur | Dashboard admin — tri date commande inversé | Résolu S2 |
| ANO-006 | S3 | Mineur | Facture PDF — logo Company-Test manquant sur certaines configs | Résolu S4 |
| ANO-007 | S1 | Mineur | Formulaire inscription — champ SIRET pré-rempli si back navigateur | Résolu S1 |
| ANO-008 | S1 | Mineur | Fiche produit — breadcrumb manquant en mobile | Résolu S2 |
| ANO-009 | S4 | Mineur | Export CSV — montants avec virgule au lieu de point (locale FR) | Résolu IP |

> Détail complet : `../anomalies/registre_anomalies.md`

---

## Couverture BDD Gherkin — État final

| Feature | US couvertes | Scénarios | Statut |
|---------|-------------|-----------|--------|
| FEAT-001 Catalogue | US-001, US-002, US-003, US-004 | ~22 | ✅ |
| FEAT-002 Comptes B2B | US-005, US-006, US-007, US-008 | ~22 | ✅ |
| FEAT-003 Commande | US-009, US-010, US-011, US-012 | ~23 | ✅ |
| FEAT-004 Back-office | US-013, US-014, US-015 | ~18 | ✅ |
| FEAT-005 Paiement | US-016, US-018 | ~11 | ✅ (US-017 Phase 2) |
| FEAT-006 Livraison | US-019, US-020, US-021 | ~16 | ✅ |
| FEAT-007 Onboarding | US-022, US-023 | ~10 | ✅ |
| **Total** | **22/23 US** (US-017 → P2) | **~122 scénarios** | ✅ |
