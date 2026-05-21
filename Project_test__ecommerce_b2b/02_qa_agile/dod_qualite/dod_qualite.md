# DoD Qualité — Company-Test e-Commerce B2B

## Definition of Done — applicable à toutes les User Stories

### Code
- [ ] Code développé et merge request approuvée (au moins 1 reviewer)
- [ ] Tests unitaires écrits et passants (coverage ≥ 80%)
- [ ] Aucun warning de linting / coding standards Drupal

### Tests fonctionnels
- [ ] Tous les critères d'acceptation validés par le PO en recette
- [ ] Scénarios BDD Gherkin exécutés et passants
- [ ] Tests de régression automatisés passants (CI/CD)

### Déploiement
- [ ] Déployé en environnement staging Drupal
- [ ] Aucun bug critique ou majeur ouvert sur la US
- [ ] Smoke test de l'environnement staging OK

### Documentation
- [ ] Documentation technique mise à jour si nécessaire
- [ ] Fiche US mise à jour avec statut "Terminé"

### Démonstration
- [ ] US démontrable en Sprint Review
- [ ] PO a signé la recette

## Sévérités des anomalies

| Sévérité | Définition | Bloquant pour DoD |
|----------|-----------|-------------------|
| Critique | Blocage complet d'un parcours | ✅ Oui |
| Majeur | Fonctionnalité dégradée sans contournement | ✅ Oui |
| Mineur | Fonctionnalité dégradée avec contournement | ❌ Non (planifié sprint suivant) |
| Cosmétique | Affichage, typo | ❌ Non |
