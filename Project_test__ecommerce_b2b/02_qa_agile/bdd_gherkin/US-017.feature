# US-017 — Paiement différé 30j fin de mois
# STATUT : PHASE 2 — Hors scope V1
# Décision D7 — atelier story mapping 2026-04-15
# Bloqueurs : intégration ERP · validation crédit · juridique CGV
# Estimation Phase 2 : ~21 SP — voir US-017.md pour le détail

@phase2 @hors-scope-v1 @paiement-differe
Feature: Paiement différé 30 jours fin de mois
  En tant qu'acheteur B2B avec compte validé et conditions de règlement négociées,
  Je veux choisir le paiement différé à 30 jours fin de mois lors du checkout,
  Afin de respecter mes conditions de règlement habituelles avec Company-Test
  et d'éviter les avances de trésorerie sur des commandes volumineuses.

  # ============================================================
  # NOTE : Ces scénarios sont des spécifications Phase 2.
  # Ils NE SONT PAS exécutés en V1.
  # Ils servent de cahier des charges pour le PI Planning Phase 2.
  # ============================================================

  Background:
    Given un acheteur B2B connecté avec le compte "thomas.mercier@fibresudest.fr"
    And son panier contient des produits d'un montant de 2 500,00 € HT

  @phase2 @happy-path
  Scenario: Acheteur éligible voit l'option paiement différé au checkout
    Given que son compte a le flag "payment_deferred_enabled" activé
    When il accède à l'étape de paiement du checkout
    Then il voit l'option "Paiement différé 30j fin de mois"
    And il voit la date d'échéance calculée automatiquement
    And il voit le montant total dû à cette date

  @phase2 @acces-controle
  Scenario: Acheteur non éligible ne voit pas l'option paiement différé
    Given que son compte n'a pas le flag "payment_deferred_enabled"
    When il accède à l'étape de paiement du checkout
    Then il voit uniquement l'option "Paiement CB 3D Secure"
    And aucune mention du paiement différé n'est visible

  @phase2 @happy-path
  Scenario: Commande créée avec statut paiement différé
    Given que son compte a le flag "payment_deferred_enabled" activé
    When il sélectionne "Paiement différé 30j fin de mois"
    And il valide sa commande
    Then la commande est créée avec le statut "pending_payment_deferred"
    And la date d'échéance est calculée au dernier jour ouvré du mois suivant
    And il reçoit un email de confirmation avec la date d'échéance de règlement
    And l'admin Company-Test reçoit une notification avec le montant et la date d'échéance

  @phase2 @backoffice
  Scenario: Admin voit les commandes à paiement différé avec leur échéance
    Given qu'une commande à paiement différé existe pour "thomas.mercier@fibresudest.fr"
    When l'admin accède au dashboard back-office
    Then il voit la commande avec le statut "Paiement différé"
    And il voit la date d'échéance de règlement
    And il voit un indicateur visuel si l'échéance approche à moins de 5 jours

  @phase2 @retard-paiement
  Scenario: Compte suspendu automatiquement en cas de dépassement d'échéance
    Given une commande à paiement différé dont la date d'échéance est dépassée de 1 jour
    When le job CRON quotidien de vérification des échéances s'exécute
    Then le compte de l'acheteur passe au statut "payment_overdue"
    And l'acheteur ne peut plus passer de nouvelles commandes
    And l'admin reçoit une alerte "Paiement en retard — [N° commande]"
