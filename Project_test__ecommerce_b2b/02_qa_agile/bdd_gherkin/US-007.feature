# language: fr
Fonctionnalité: Validation manuelle des comptes B2B par l'administrateur Company-Test
  En tant qu'administrateur Company-Test
  Je veux valider ou rejeter les demandes de comptes B2B
  Afin de contrôler l'accès à la plateforme

  Contexte:
    Étant donné que je suis connecté en tant qu'administrateur Company-Test
    Et que les demandes de compte suivantes sont en attente :
      | Email             | Raison sociale      | SIRET          |
      | jean@dupont.fr    | Dupont Télécom SARL | 12345678901234 |
      | marc@martin.fr    | Martin Réseau SAS   | 98765432109876 |

  Scénario: Validation d'un compte B2B
    Quand j'accède à la demande de "jean@dupont.fr" dans le back-office
    Et que je clique sur "Valider"
    Alors le compte de "jean@dupont.fr" passe au statut "Actif"
    Et "jean@dupont.fr" reçoit un email "Votre compte Company-Test est activé — vous pouvez vous connecter"
    Et la demande disparaît de la liste "En attente"

  Scénario: Rejet d'un compte B2B avec motif
    Quand j'accède à la demande de "marc@martin.fr" dans le back-office
    Et que je clique sur "Rejeter"
    Et que je saisis le motif "Activité non éligible à notre catalogue B2B"
    Et que je confirme le rejet
    Alors le compte de "marc@martin.fr" passe au statut "Refusé"
    Et "marc@martin.fr" reçoit un email de refus contenant le motif "Activité non éligible à notre catalogue B2B"

  Scénario: Rejet sans motif bloqué
    Quand j'accède à une demande en attente
    Et que je clique sur "Rejeter" sans saisir de motif
    Et que je tente de confirmer
    Alors le message "Veuillez indiquer un motif de refus" s'affiche
    Et le rejet n'est pas enregistré

  Scénario: Notification email à l'administrateur pour nouvelle demande
    Étant donné qu'un nouvel acheteur vient de soumettre une demande de compte
    Alors l'administrateur Company-Test reçoit un email contenant :
      | Champ          | Valeur attendu                        |
      | Sujet          | Nouvelle demande de compte B2B Company-Test|
      | Raison sociale | présente dans l'email                 |
      | SIRET          | présent dans l'email                  |
      | Lien back-office | lien direct vers la demande          |
    Et la demande apparaît dans la liste "En attente" du back-office

  Scénario: Liste des demandes en attente avec badge compteur
    Étant donné que 3 demandes sont en attente de validation
    Quand j'accède au back-office
    Alors un badge "3" s'affiche sur le menu "Demandes en attente"
    Et les demandes sont triées par date de soumission (plus ancienne en premier)
