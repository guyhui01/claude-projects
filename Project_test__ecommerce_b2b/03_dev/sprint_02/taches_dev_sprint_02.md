# Tâches de Développement — Sprint 2

## Référence
| Champ | Valeur |
|-------|--------|
| Sprint | Sprint 2 — Validation compte, Commande & Back-office |
| Vélocité cible | 16 SP (mesurée Sprint 1) |
| Agent | AGENT-DEV-DRUPAL-PHP.md |
| Branche git | `feature/sprint-02` → merge vers `develop` |
| Prérequis | Module `Company-Test_b2b` créé en Sprint 1 |

---

## US-007 — Validation manuelle des comptes B2B (admin) — 3 SP ⚠️ Reportée Sprint 1

**Branche :** `feature/US-007-validation-compte-admin`

### Tâches

| # | Tâche | Composant Drupal | Effort |
|---|-------|-----------------|--------|
| T1 | Vue back-office "Demandes en attente" : liste Users filtrés statut `en_attente`, triés date ASC | Views | 0.5j |
| T2 | Action "Valider" : transition statut → `actif` + email activation SendGrid | Controller / Form | 0.5j |
| T3 | Action "Rejeter" : formulaire motif obligatoire + transition → `refuse` + email refus | Form + validation | 0.75j |
| T4 | Blocage rejet sans motif (validation côté serveur) | FormValidator | 0.25j |
| T5 | Email admin nouvelle demande (déjà implémenté US-005 — vérifier) | — | 0.25j |
| T6 | Badge compteur "Demandes en attente" dans toolbar admin | `hook_toolbar()` | 0.25j |
| T7 | Tests PHPUnit AccountValidationService + tests Behat | PHPUnit + Behat | 0.5j |

### Points d'implémentation clés

```php
// src/Service/AccountValidationService.php
class AccountValidationService {
  public function validateAccount(UserInterface $account): void {
    $account->set('field_compte_statut', 'actif')->save();
    $this->mailManager->mail(
      'Company-Test_b2b', 'account_activated',
      $account->getEmail(), 'fr',
      ['account' => $account]
    );
  }

  public function refuseAccount(UserInterface $account, string $reason): void {
    $account->set('field_compte_statut', 'refuse')
            ->set('field_motif_refus', $reason)
            ->save();
    $this->mailManager->mail(
      'Company-Test_b2b', 'account_refused',
      $account->getEmail(), 'fr',
      ['account' => $account, 'reason' => $reason]
    );
  }
}

// Company-Test_b2b.module — badge toolbar
function Company-Test_b2b_toolbar(): array {
  $count = \Drupal::entityQuery('user')
    ->condition('field_compte_statut', 'en_attente')
    ->count()->execute();
  // Retourner le badge avec $count...
}
```

---

## US-009 — Ajout produits au panier (3 SP)

**Branche :** `feature/US-009-ajout-panier`

### Tâches

| # | Tâche | Composant Drupal | Effort |
|---|-------|-----------------|--------|
| T1 | Activer et configurer `commerce_cart` module | Config YAML | 0.25j |
| T2 | Configurer `AddToCartForm` (champ quantité, UX) | Commerce Form | 0.5j |
| T3 | Restreindre l'ajout au panier au rôle `b2b_buyer` (access check) | `hook_commerce_cart_add_check()` | 0.5j |
| T4 | Bloc Cart dans header (CartBlock) | Block config YAML | 0.25j |
| T5 | Message confirmation ajout panier | Messenger / JS | 0.25j |
| T6 | Template Twig cart-block + cart page | Twig | 0.5j |
| T7 | Tests PHPUnit + Behat ajout panier | PHPUnit + Behat | 0.75j |

### Points d'implémentation clés

```php
// Restreindre ajout panier aux acheteurs B2B
// src/EventSubscriber/B2bCartAccessSubscriber.php
class B2bCartAccessSubscriber implements EventSubscriberInterface {
  public function onCartAdd(CartEntityAddEvent $event): void {
    if (!$this->currentUser->hasRole('b2b_buyer')) {
      throw new AccessDeniedHttpException(
        'Accès réservé aux acheteurs B2B.'
      );
    }
  }
}
```

```yaml
# config/sync/block.block.commerce_cart.yml
plugin: commerce_cart
region: header
```

---

## US-010 — Saisie numéro bon de commande interne (2 SP)

**Branche :** `feature/US-010-bon-commande`

### Tâches

| # | Tâche | Composant Drupal | Effort |
|---|-------|-----------------|--------|
| T1 | Ajouter champ `field_purchase_order_number` sur entité `commerce_order` | Field config YAML | 0.25j |
| T2 | Créer `CheckoutPane` custom "Bon de commande" (champ affiché en checkout) | CheckoutPane Plugin | 0.75j |
| T3 | Valider champ requis avant confirmation commande | Pane validate() | 0.25j |
| T4 | Afficher le N° BC dans le récap commande et l'email de confirmation | Twig + Mail | 0.25j |
| T5 | Tests PHPUnit CheckoutPane | PHPUnit | 0.5j |

### Points d'implémentation clés

```php
// src/Plugin/Commerce/CheckoutPane/PurchaseOrderPane.php
/**
 * @CommerceCheckoutPane(
 *   id = "purchase_order_number",
 *   label = @Translation("Numéro de bon de commande"),
 *   default_step = "order_information",
 * )
 */
class PurchaseOrderPane extends CheckoutPaneBase {
  public function buildPaneForm(array $pane_form, ...) {
    $pane_form['po_number'] = [
      '#type' => 'textfield',
      '#title' => 'Numéro de bon de commande interne',
      '#required' => TRUE,
    ];
    return $pane_form;
  }
}
```

---

## US-011 — Email de confirmation de commande (2 SP)

**Branche :** `feature/US-011-email-confirmation-commande`

### Tâches

| # | Tâche | Composant Drupal | Effort |
|---|-------|-----------------|--------|
| T1 | EventSubscriber sur `OrderEvent::PLACE` → déclencher envoi email | EventSubscriber | 0.5j |
| T2 | Template SendGrid `b2b_order_confirm` (HTML + texte) | SendGrid template | 0.5j |
| T3 | Variables template : N° commande, N° BC, lignes produits, total HT, adresse | MailManager params | 0.5j |
| T4 | Tests PHPUnit OrderConfirmSubscriber | PHPUnit | 0.5j |

### Points d'implémentation clés

```php
// src/EventSubscriber/OrderConfirmationSubscriber.php
class OrderConfirmationSubscriber implements EventSubscriberInterface {
  public static function getSubscribedEvents(): array {
    return [OrderEvents::ORDER_PLACE => 'onOrderPlace'];
  }

  public function onOrderPlace(OrderEvent $event): void {
    $order = $event->getOrder();
    $buyer = $order->getCustomer();
    $this->mailManager->mail(
      'Company-Test_b2b', 'order_confirmation',
      $buyer->getEmail(), 'fr',
      ['order' => $order]
    );
  }
}
```

---

## US-013 — Dashboard back-office commandes (3 SP)

**Branche :** `feature/US-013-dashboard-backoffice`

### Tâches

| # | Tâche | Composant Drupal | Effort |
|---|-------|-----------------|--------|
| T1 | Vue "Commandes B2B" : liste commandes avec filtres (statut, date, acheteur) | Views | 0.75j |
| T2 | Configurer permissions rôle `Company-Test_admin` : `view commerce_order` | Config YAML | 0.25j |
| T3 | Configurer rôle `Company-Test_sales` : view only | Config YAML | 0.25j |
| T4 | Bloc KPI résumé : nb commandes aujourd'hui / semaine | Views block | 0.5j |
| T5 | Page détail commande dans back-office | Commerce admin UI | 0.25j |
| T6 | Tests Behat scénarios dashboard | Behat | 0.5j |

---

## US-014 — Mise à jour statut + notification client (3 SP)

**Branche :** `feature/US-014-statut-commande-notif`

### Tâches

| # | Tâche | Composant Drupal | Effort |
|---|-------|-----------------|--------|
| T1 | Configurer workflow commande Commerce : `pending → processing → shipped → completed` | Workflow YAML | 0.5j |
| T2 | Exposer les transitions dans le back-office admin | Commerce UI | 0.25j |
| T3 | EventSubscriber sur chaque transition → email SendGrid contextualisé | EventSubscriber | 1j |
| T4 | Templates SendGrid par statut : "en préparation", "expédié", "livré" | SendGrid | 0.5j |
| T5 | Tests PHPUnit OrderStatusSubscriber | PHPUnit | 0.75j |

### Points d'implémentation clés

```yaml
# config/sync/workflows.workflow.commerce_order.yml
states:
  draft:      { label: Brouillon }
  pending:    { label: 'En attente' }
  processing: { label: 'En préparation' }
  shipped:    { label: Expédié }
  completed:  { label: Livré }
  canceled:   { label: Annulé }
transitions:
  place:     { from: [draft], to: pending }
  process:   { from: [pending], to: processing }
  ship:      { from: [processing], to: shipped }
  complete:  { from: [shipped], to: completed }
  cancel:    { from: [pending, processing], to: canceled }
```

---

## Checklist de fin de Sprint 2

### DoD par US
| US | PHPUnit | Behat | Config YAML | Code Review | Staging |
|----|---------|-------|-------------|-------------|---------|
| US-007 | À faire | À faire | À faire | À faire | À faire |
| US-009 | À faire | À faire | À faire | À faire | À faire |
| US-010 | À faire | À faire | À faire | À faire | À faire |
| US-011 | À faire | À faire | À faire | À faire | À faire |
| US-013 | À faire | À faire | À faire | À faire | À faire |
| US-014 | À faire | À faire | À faire | À faire | À faire |

### Gate DoR Sprint 2 (à valider avant J1)
- [ ] Wireframes back-office validation compte validés PO
- [ ] Wireframes panier + checkout validés PO
- [ ] Rôle `Company-Test_admin` configuré en Drupal (Dev4)
- [ ] Jeux de données test préparés QA
- [ ] Staging Sprint 2 opérationnel (Dev4)
- [ ] Template email expédition disponible (SendGrid)
