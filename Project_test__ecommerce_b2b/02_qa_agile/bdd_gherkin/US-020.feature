# language: fr
Fonctionnalité: Adresses de livraison multiples (carnet d'adresses)
  En tant qu'acheteur B2B connecté
  Je veux gérer plusieurs adresses de livraison dans mon carnet d'adresses
  Afin de livrer mes commandes sur différents sites de mon entreprise

  Contexte:
    Étant donné que je suis connecté en tant qu'acheteur B2B "thomas.mercier@client.fr"

  Scénario: Ajout d'une nouvelle adresse de livraison au carnet d'adresses
    Quand j'accède à "Mon espace > Carnet d'adresses"
    Et que je clique sur "Ajouter une adresse"
    Et que je renseigne : Nom "Site Paris", Adresse "10 rue de la Paix", Code postal "75001", Ville "Paris", Pays "France"
    Et que je clique sur "Enregistrer"
    Alors l'adresse "Site Paris — 10 rue de la Paix, 75001 Paris" apparaît dans mon carnet d'adresses

  Scénario: Sélection d'une adresse de livraison existante lors du checkout
    Étant donné que mon carnet d'adresses contient deux adresses : "Site Paris" et "Site Lyon"
    Quand je suis à l'étape de livraison du checkout
    Alors les deux adresses sont proposées à la sélection
    Quand je sélectionne "Site Lyon"
    Alors l'adresse de livraison de la commande est "Site Lyon"

  Scénario: Modification d'une adresse existante
    Étant donné que mon carnet d'adresses contient l'adresse "Site Paris — 10 rue de la Paix, 75001 Paris"
    Quand je clique sur "Modifier" pour cette adresse
    Et que je change la ville à "75002"
    Et que je clique sur "Enregistrer"
    Alors l'adresse mise à jour s'affiche "Site Paris — 10 rue de la Paix, 75002 Paris"

  Scénario: Suppression d'une adresse du carnet
    Étant donné que mon carnet d'adresses contient l'adresse "Site Lyon"
    Quand je clique sur "Supprimer" pour cette adresse
    Et que je confirme la suppression
    Alors l'adresse "Site Lyon" n'apparaît plus dans mon carnet d'adresses

  Scénario: Adresse de livraison par défaut pré-sélectionnée au checkout
    Étant donné que l'adresse "Site Paris" est définie comme adresse par défaut
    Quand je suis à l'étape de livraison du checkout
    Alors l'adresse "Site Paris" est pré-sélectionnée automatiquement
    Et je peux choisir une autre adresse si nécessaire

  Scénario: Ajout d'une nouvelle adresse directement au checkout
    Étant donné que je suis à l'étape de livraison du checkout
    Quand je clique sur "Utiliser une nouvelle adresse"
    Et que je renseigne les champs d'une nouvelle adresse
    Et que je clique sur "Utiliser cette adresse"
    Alors la nouvelle adresse est utilisée pour cette commande
    Et elle est enregistrée dans mon carnet d'adresses
