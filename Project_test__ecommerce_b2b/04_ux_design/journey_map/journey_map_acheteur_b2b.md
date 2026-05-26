# Journey Map — Acheteur B2B Company-Test

> Skill : `journey-mapping.md` · Certification : NN/g · IDF
> Persona : Thomas Mercier — Responsable Achats
> Scénario : Première commande après activation du compte

---

## Vue d'ensemble

```
PHASES      │ Découverte  │ Inscription │ Attente      │ Connexion   │ Catalogue   │ Commande    │ Suivi
────────────┼─────────────┼─────────────┼──────────────┼─────────────┼─────────────┼─────────────┼──────────────
ACTIONS     │ Visite le   │ Remplit le  │ Attend email │ Se connecte │ Navigue     │ Ajoute au   │ Reçoit email
THOMAS      │ site Company-Test│ formulaire  │ d'activation │ avec ses    │ par catégorie│ panier,     │ confirmation
            │ depuis un   │ d'inscription│ (délai 24h) │ identifiants│ consulte    │ saisit N°BC,│ et attend
            │ lien email  │ B2B         │              │             │ fiche produit│ confirme    │ livraison
            │ commercial  │             │              │             │             │             │
────────────┼─────────────┼─────────────┼──────────────┼─────────────┼─────────────┼─────────────┼──────────────
POINTS DE   │ Page accueil│ Formulaire  │ Page         │ Page        │ Page        │ Panier +    │ Email +
CONTACT     │ publique    │ inscription │ "en attente" │ connexion   │ catalogue + │ Checkout    │ Tableau bord
            │             │             │ + email conf.│             │ fiche produit│             │
────────────┼─────────────┼─────────────┼──────────────┼─────────────┼─────────────┼─────────────┼──────────────
ÉMOTIONS    │     😐      │     🙂      │     😟       │     😊      │     😃      │     😄      │     😊
            │ Curieux     │ Motivé mais │ Impatient    │ Soulagé     │ Impressionné│ Efficace    │ Confiant
            │             │ formulaire  │ "et si ça    │             │ par les     │             │             
            │             │ un peu long │ prend + de   │             │ tarifs B2B  │             │
            │             │             │ 24h ?"       │             │             │             │
────────────┼─────────────┼─────────────┼──────────────┼─────────────┼─────────────┼─────────────┼──────────────
PAIN POINTS │ ❓ Pas de   │ ⚠️ SIRET    │ ⏱ Délai     │ ⚠️ Oubli   │ ❓ Prix pas │ ⚠️ N° BC   │ ❓ Pas de
            │ tarifs      │ validation  │ non confirmé │ du mot de   │ visible si  │ obligatoire │ tracking
            │ visibles    │ peu claire  │ avec précision│ passe       │ non connecté│ inattendu   │ temps réel
────────────┼─────────────┼─────────────┼──────────────┼─────────────┼─────────────┼─────────────┼──────────────
OPPORTUNITÉS│ 💡 Afficher │ 💡 Aide     │ 💡 Email de │ 💡 "Se      │ 💡 Tarif   │ 💡 Pré-    │ 💡 Notif
            │ "Demandez   │ contextuelle│ confirmation │ souvenir de │ B2B affiché │ remplir N°BC│ SMS/email
            │ votre accès │ sur SIRET   │ avec délai   │ moi"        │ dès la liste│ depuis      │ à chaque
            │ B2B"        │             │ précis       │             │ produits    │ commande    │ changement
            │             │             │              │             │             │ précédente  │ statut
────────────┼─────────────┼─────────────┼──────────────┼─────────────┼─────────────┼─────────────┼──────────────
US COUVERTES│ —           │ US-005      │ US-005/007   │ US-006      │ US-001/002  │ US-009/010  │ US-014/021
            │             │             │              │             │             │ US-011      │
```

---

## Courbe d'émotion

```
😄  ──────────────────────────────────────────────────────── Idéal
    
😃                                           ●──────●
                        ●
😊  ●                               ●                       ●
    
😐      ●
    
😟          ●       ●
    
😤
    │           │           │            │           │           │           │
  Découverte  Inscript.  Attente     Connexion  Catalogue  Commande   Suivi
```

---

## Moments clés (Moments of Truth)

| Moment | Description | Impact | Sprint |
|--------|-------------|--------|--------|
| 🌟 **Activation compte** | Réception email "Votre compte est activé" | Très élevé — détermine si Thomas revient | S1 |
| 🌟 **Premier tarif B2B vu** | Thomas voit son prix négocié sur la fiche produit | Élevé — validation de la valeur de la plateforme | S1 |
| ⚠️ **Délai d'attente** | Entre inscription et activation (24h max) | Risque d'abandon si pas de communication | S1 |
| ⚠️ **N° BC inattendu** | Thomas découvre le champ N° BC au checkout | Friction — doit aller chercher le numéro | S2 |

---

## Recommandations UX prioritaires

| Priorité | Recommandation | Phase | US |
|----------|---------------|-------|----|
| 🔴 Haute | Afficher le délai précis "validation sous 24h" sur la page d'attente | S1 | US-005/007 |
| 🔴 Haute | Tarif B2B visible dès la vignette produit en liste catalogue | S1 | US-001/002 |
| 🟡 Moyenne | Aide contextuelle sur le champ SIRET (format + exemple) | S1 | US-005 |
| 🟡 Moyenne | Pré-remplir N° BC depuis la dernière commande | S2 | US-010 |
| 🟢 Basse | Notifications push statut commande (Phase 2 mobile) | Ph2 | — |
