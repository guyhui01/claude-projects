# DoD Qualité — Company-Test e-Commerce B2B

## Definition of Done — Critères par niveau MoSCoW

> La DoD complète s'applique aux US **Must Have**. Les US Should et Could bénéficient d'une DoD allégée documentée ci-dessous.

---

### DoD Must Have — Critères complets

#### Code
- [ ] Code développé et merge request approuvée (au moins 1 reviewer)
- [ ] Tests unitaires PHPUnit écrits et passants — **coverage ≥ 80% des lignes de code custom** (modules `Company-Test_*` uniquement, hors contrib)
- [ ] Aucun warning de linting — standards Drupal Coding Standards (phpcs.xml) + PSR-12 validés

#### Tests fonctionnels
- [ ] Tous les critères d'acceptation validés par le PO en recette staging
- [ ] Scénarios BDD Gherkin exécutés et passants (Behat CI)
- [ ] Tests de régression automatisés passants (GitHub Actions CI pipeline)

#### Déploiement
- [ ] Déployé en environnement staging Drupal
- [ ] Aucun bug **Critique** ou **Majeur** ouvert sur la US (voir sévérités)
- [ ] **Smoke test staging** réussi : catalogue charge < 2s · login → catalogue → panier fonctionnels · aucune erreur 500 dans les logs

#### Documentation
- [ ] Documentation technique mise à jour si comportement non trivial
- [ ] Fiche US mise à jour avec statut "Terminé"

#### Démonstration
- [ ] US démontrable en Sprint Review (scénario réel sur staging, pas sur local)
- [ ] PO a signé la recette — transition Jira "Review → Done" OU email PO archivé

#### UI/UX (si applicable)
- [ ] Wireframe de référence respecté (fidélité lo-fi → hi-fi)
- [ ] Responsive vérifié aux breakpoints définis : 1280px (desktop) + 375px (mobile)
- [ ] Aucune régression visuelle détectée sur les pages existantes (vérification manuelle Sprint Review)

---

### DoD Should Have — Critères allégés

- [ ] Code développé et merge request approuvée
- [ ] Tests unitaires écrits et passants — **coverage ≥ 70%**
- [ ] Critères d'acceptation validés par le PO
- [ ] Scénarios BDD Gherkin exécutés et passants
- [ ] Aucun bug Critique ouvert (bug Majeur accepté si workaround documenté)
- [ ] Déployé en staging, smoke test basique OK
- [ ] US démontrable en Sprint Review

---

### DoD Could Have — Critères minimaux

- [ ] Code développé et merge request approuvée
- [ ] Tests unitaires pour la logique critique uniquement
- [ ] Critères d'acceptation validés par le PO (démo suffisante)
- [ ] Aucun bug Critique ouvert
- [ ] Déployé en staging
- [ ] *BDD Gherkin : recommandé mais non bloquant pour Could Have*

---

## Smoke Test Staging — Checklist détaillée

| # | Action | Résultat attendu | Seuil |
|---|--------|-----------------|-------|
| SM-01 | Accéder à la page catalogue | Affichage < 2s · aucune erreur 500 | < 2s |
| SM-02 | Se connecter avec compte B2B test | Redirection tableau de bord B2B | — |
| SM-03 | Ajouter un produit au panier | Panier mis à jour · prix B2B affiché | — |
| SM-04 | Accéder au checkout | Page checkout charge · champs présents | < 3s |
| SM-05 | Vérifier les logs Drupal | Aucune erreur critique (`watchdog` level Error+) | 0 erreur |
| SM-06 | Accéder au back-office admin | Dashboard commandes accessible (rôle admin) | < 2s |

---

## Sévérités des anomalies

| Sévérité | Définition | Bloquant DoD Must | Bloquant DoD Should | Bloquant DoD Could |
|----------|-----------|-------------------|--------------------|--------------------|
| Critique | Blocage complet d'un parcours — aucun workaround | ✅ Oui | ✅ Oui | ✅ Oui |
| Majeur | Fonctionnalité dégradée sans contournement | ✅ Oui | ❌ Non (workaround documenté) | ❌ Non |
| Mineur | Fonctionnalité dégradée avec contournement | ❌ Non (planifié sprint suivant) | ❌ Non | ❌ Non |
| Cosmétique | Affichage, typo, espacement | ❌ Non | ❌ Non | ❌ Non |

---

## Définitions de "coverage"

- **Coverage 80%** = couverture de **lignes de code** sur les modules Drupal **custom** uniquement (`web/modules/custom/Company-Test_*`)
- Exclusions : modules contrib, fichiers `.install`, fichiers de configuration YAML, templates Twig
- Outil : PHPUnit avec `--coverage-html` — rapport accessible dans `tests/coverage/`
- Commande : `vendor/bin/phpunit --coverage-text --testsuite=custom`

---

## DoD de Livraison (Definition of Done PI)

Avant go-live, en plus des DoD par US :

- [ ] Tous les Must Have livrés et acceptés
- [ ] 0 bug Critique en staging
- [ ] Tests de charge k6 passants (catalogue < 1,5s P95 · checkout < 3s P95)
- [ ] Tests de sécurité basiques passants (FEAT-002 brute force · FEAT-005 HMAC)
- [ ] Script de déploiement production testé en staging (`deploy_production.sh`)
- [ ] Plan de rollback documenté et testé
- [ ] Revue RGPD finale validée par DPO
