# Conventions de Développement — Company-Test e-Commerce B2B

## Git Flow

```
main                  ← production (protégée)
  └── develop         ← intégration continue
        ├── feature/US-001-navigation-catalogue
        ├── feature/US-002-fiche-produit-b2b
        ├── feature/US-005-creation-compte-b2b
        ├── ...
        └── hotfix/HF-XXX-titre  ← correctifs urgents
```

### Règles branches
- Une branche par US : `feature/US-XXX-titre-court`
- Merge request vers `develop` obligatoire (pas de push direct)
- Code review par 1 autre dev minimum
- CI verte avant merge (lint + tests)

### Messages de commit
```
feat(US-005): ajouter validation SIRET regex 14 chiffres
fix(US-006): corriger blocage flood après 5 tentatives
test(US-001): ajouter scénario Behat catégorie vide
config(US-007): exporter YAML rôles admin Company-Test
```

Format : `type(scope): description courte`
Types : `feat` · `fix` · `test` · `config` · `docs` · `refactor` · `perf`

---

## Standards de code PHP

- **PSR-12** + **Drupal Coding Standards** (PHPCS)
- PHP 8.2 — types scalaires obligatoires, return types, `readonly`
- Pas de `@suppress`, pas de `// TODO` sans ticket référencé
- Injection de dépendances via `ContainerInjectionInterface` (pas de `\Drupal::service()` dans les classes)
- Hooks dans `.module` uniquement si impossible autrement — préférer EventSubscribers

```php
// Bon
final class AccountValidationService {
  public function __construct(
    private readonly MailManagerInterface $mailManager,
    private readonly EntityTypeManagerInterface $entityTypeManager,
  ) {}
}

// À éviter
function Company-Test_b2b_validate_account($uid) {
  $mail = \Drupal::service('plugin.manager.mail'); // ❌
}
```

---

## Configuration Management (CMI)

- **Tout** doit être exporté en YAML — aucune config en base non versionnée
- Export avant chaque commit : `drush config:export`
- Import sur chaque environnement : `drush config:import`
- Fichiers YAML dans `config/sync/` (versionné git)
- Config initiale du module dans `config/install/`

```bash
# Workflow dev quotidien
drush config:export          # export config locale
git add config/sync/
git commit -m "config: ..."
# Sur staging/prod
drush updatedb               # mises à jour BDD
drush config:import          # import config versionnée
drush cr                     # rebuild cache
```

---

## Tests

### PHPUnit — Tests unitaires et d'intégration
```
web/modules/custom/Company-Test_b2b/tests/
  ├── src/Unit/          # Tests unitaires (SiretValidatorTest, etc.)
  ├── src/Kernel/        # Tests kernel (services, hooks)
  └── src/Functional/    # Tests fonctionnels (navigateur simulé)
```

Commande : `./vendor/bin/phpunit web/modules/custom/Company-Test_b2b/`

### Behat — Tests d'acceptation BDD
```
tests/behat/
  ├── behat.yml
  └── features/
      ├── US-001-navigation-catalogue.feature  ← copie des .feature QA
      ├── US-005-creation-compte.feature
      └── ...
```

Commande : `./vendor/bin/behat --tags=sprint1`

### Règle DoD Tests
- Toute US Must Have = au moins 1 test PHPUnit fonctionnel
- Scénarios BDD QA = automatisables via Behat en Iteration 2

---

## Environnements

| Env | URL | Usage | Déploiement |
|-----|-----|-------|-------------|
| Local | `http://Company-Test-b2b.local` | Dev individuel | DDEV / Lando |
| Staging | À définir | Recette QA + démo | GitHub Actions → push `develop` |
| Production | À définir | Client final | GitHub Actions → push `main` |

### DDEV (environnement local recommandé)
```yaml
# .ddev/config.yaml
name: Company-Test-b2b
type: drupal10
php_version: "8.2"
webserver_type: nginx-fpm
database:
  type: mysql
  version: "8.0"
```

---

## DoD Développement (complète le DoD QA)

- [ ] Code respecte PSR-12 + Drupal Coding Standards (PHPCS 0 erreur)
- [ ] Config exportée en YAML et committée
- [ ] Au moins 1 test PHPUnit pour chaque classe de service custom
- [ ] Scénarios Behat Sprint 1 passants en staging
- [ ] Pas de `drush_print_r()` ou `kint()` laissé dans le code
- [ ] `drush config:import` sans erreur sur staging
- [ ] MR approuvée par 1 reviewer avant merge develop
