# Wireframe — WF-015 — Export CSV back-office

> Skill : `wireframing.md` · Certification : Google UX · IDF
> US : US-015 — Export CSV des commandes depuis le back-office admin
> Fidélité : Lo-fi · Breakpoint : Desktop 1280px (contexte back-office — mobile non prioritaire)

---

## Desktop — État nominal (bouton export dans le dashboard commandes)

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  Company-Test BACK-OFFICE                                      Isabelle Royer [Admin] ▼  [Déconnexion]    │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│  ┌────────────────────┐  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ NAVIGATION ADMIN   │  │  Gestion des commandes                                                 │  │
│  ├────────────────────┤  ├────────────────────────────────────────────────────────────────────────┤  │
│  │ > Commandes        │  │                                                                        │  │
│  │ > Comptes B2B  [3] │  │  FILTRES ACTIFS                                                       │  │
│  │ > Produits         │  │  Statut : En attente · Période : 01/05/2026 → 20/05/2026               │  │
│  │ > Export           │  │                                                   [Réinitialiser]      │  │
│  └────────────────────┘  │                                                                        │  │
│                           │  ─────────────────────────────────────────────────────────────────    │  │
│                           │  LISTE DES COMMANDES (5 résultats)             [Exporter CSV ↓]       │  │
│                           │                         ▲                                             │  │
│                           │                         │                                             │  │
│                           │           ┌─────────────────────────────────────────────┐            │  │
│                           │           │  Ce bouton exporte les résultats filtrés     │            │  │
│                           │           │  (tooltip au survol)                         │            │  │
│                           │           └─────────────────────────────────────────────┘            │  │
│                           │                                                                        │  │
│                           │  ┌───────────┬──────────────┬──────────────┬──────────┬──────────┬──────────┬──────────────────┐ │
│                           │  │ N° commande│ Acheteur    │ Raison soc.  │ Date     │ Montant HT│ N° BC   │ Statut           │ │
│                           │  ├───────────┼──────────────┼──────────────┼──────────┼──────────┼──────────┼──────────────────┤ │
│                           │  │ CMD-1042  │ T. Mercier   │ Dupont TP    │ 20/05    │  327,50 €│ BC-2026-0142│ En attente    │ │
│                           │  ├───────────┼──────────────┼──────────────┼──────────┼──────────┼──────────┼──────────────────┤ │
│                           │  │ CMD-1038  │ A. Bernard   │ Elec Services│ 17/05    │  240,00 €│ BC-0211   │ En attente       │ │
│                           │  └───────────┴──────────────┴──────────────┴──────────┴──────────┴──────────┴──────────────────┘ │
│                           │                                                                        │  │
│                           └────────────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## États d'erreur / messages contextuels

### État 2 — Modal de configuration de l'export CSV

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  [Fond grisé — overlay]                                                                              │
│                                                                                                      │
│          ┌────────────────────────────────────────────────────────────────────┐                     │
│          │  Exporter les commandes en CSV                                  [X]│                     │
│          ├────────────────────────────────────────────────────────────────────┤                     │
│          │                                                                    │                     │
│          │  PÉRIMÈTRE DE L'EXPORT                                             │                     │
│          │                                                                    │                     │
│          │  ◉ Exporter les résultats filtrés uniquement (5 commandes)         │                     │
│          │    Statut : En attente · Période : 01/05 → 20/05/2026             │                     │
│          │                                                                    │                     │
│          │  ○ Exporter toutes les commandes (37 commandes)                   │                     │
│          │                                                                    │                     │
│          │  ─────────────────────────────────────────────────────────────    │                     │
│          │                                                                    │                     │
│          │  COLONNES À INCLURE                                                │                     │
│          │                                                                    │                     │
│          │  ☑ N° commande          ☑ Acheteur (Nom)      ☑ Raison sociale    │                     │
│          │  ☑ Email acheteur       ☑ Date commande       ☑ Montant HT        │                     │
│          │  ☑ TVA                  ☑ Montant TTC         ☑ N° BC             │                     │
│          │  ☑ Statut               ☑ N° suivi livraison  ☑ Adresse livraison │                     │
│          │  ☑ SIRET acheteur       ☐ N° facture PDF                          │                     │
│          │                                                                    │                     │
│          │  ─────────────────────────────────────────────────────────────    │                     │
│          │                                                                    │                     │
│          │  OPTIONS TECHNIQUES                                                │                     │
│          │                                                                    │                     │
│          │  Séparateur de colonnes                                            │                     │
│          │  ┌──────────────────────────────────────────────────────────┐     │                     │
│          │  │  Point-virgule ( ; )                                   ▼ │     │                     │
│          │  └──────────────────────────────────────────────────────────┘     │                     │
│          │    · Virgule ( , )                                                 │                     │
│          │    · Point-virgule ( ; ) — recommandé Excel FR                    │                     │
│          │    · Tabulation                                                    │                     │
│          │                                                                    │                     │
│          │  Encodage                                                          │                     │
│          │  ┌──────────────────────────────────────────────────────────┐     │                     │
│          │  │  UTF-8 (recommandé)                                    ▼ │     │                     │
│          │  └──────────────────────────────────────────────────────────┘     │                     │
│          │                                                                    │                     │
│          │  ℹ UTF-8 avec BOM — compatible Excel, LibreOffice,                 │                     │
│          │    comptabilité (SAP, Sage)                                        │                     │
│          │                                                                    │                     │
│          │  ─────────────────────────────────────────────────────────────    │                     │
│          │                                                                    │                     │
│          │  ┌──────────────────────┐     ┌────────────────────────────────┐  │                     │
│          │  │    [Annuler]         │     │   [📥  Télécharger le CSV ]    │  │                     │
│          │  └──────────────────────┘     └────────────────────────────────┘  │                     │
│          └────────────────────────────────────────────────────────────────────┘                     │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 3 — Téléchargement en cours + confirmation

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                                                                                      │
│  ┌─────────────────────────────────────────────────────────────────────────────────────────────┐    │
│  │  ✅  Export CSV généré avec succès                                                           │    │
│  │                                                                                             │    │
│  │  Le fichier commandes_Company-Test_20052026_en-attente.csv a été téléchargé.                     │    │
│  │                                                                                             │    │
│  │  5 commandes exportées · Encodage UTF-8 · Séparateur : point-virgule                       │    │
│  │                                                                                             │    │
│  │  ┌──────────────────────────────────────┐                                                  │    │
│  │  │  [📥  Retélécharger si nécessaire ]   │                                                  │    │
│  │  └──────────────────────────────────────┘                                                  │    │
│  └─────────────────────────────────────────────────────────────────────────────────────────────┘    │
└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### État 4 — Aperçu du fichier CSV généré (simulation contenu)

```
Contenu du fichier : commandes_Company-Test_20052026_en-attente.csv

N° commande;Acheteur;Raison sociale;Email;Date;Montant HT;TVA;Montant TTC;N° BC;Statut;N° suivi;Adresse livraison;SIRET
CMD-1042;Mercier Thomas;Dupont Travaux Publics;t.mercier@dupont-tp.fr;20/05/2026;327,50;65,50;405,00;BC-2026-0142;En attente;;12 av. Charles de Gaulle 92800 Puteaux;412987654000018
CMD-1038;Bernard Alain;Elec Services;a.bernard@elecserv.fr;17/05/2026;240,00;48,00;296,00;BC-0211;En attente;;8 allée des Acacias 31000 Toulouse;552348712000023
```

---

## Annotations UX

| Zone | Règle | Justification |
|------|-------|---------------|
| Bouton [Exporter CSV] positionné sur la liste filtrée | Nielsen #7 — Efficacité | Export contextuel : Isabelle applique ses filtres PUIS exporte — logique de travail respectée |
| Tooltip "exporte les résultats filtrés" | Nielsen #6 — Reconnaissance > rappel | Isabelle ne doit pas se demander si l'export prend en compte ses filtres |
| Choix entre export filtré et export total | Nielsen #7 — Flexibilité | Cas d'usage 1 : rapport quotidien filtré. Cas d'usage 2 : extraction comptabilité mensuelle totale |
| Colonnes cochées/décochées | Nielsen #7 — Personnalisation | Certains services (compta, logistique) n'ont besoin que de colonnes spécifiques |
| Séparateur point-virgule par défaut | Best practice FR | Excel France utilise le point-virgule comme séparateur CSV — défaut ergonomique pour Isabelle |
| Encodage UTF-8 + BOM | Contrainte technique critique | Sans BOM, Excel 2016/2019 FR n'affiche pas les accents (é, à, ç) correctement — erreur invisible mais bloquante |
| Nom de fichier automatique avec date et filtre | Nielsen #1 — Visibilité | Isabelle retrouve ses exports dans ses téléchargements sans ambiguïté — `commandes_Company-Test_20052026_en-attente.csv` |
| Confirmation avec métadonnées de l'export | Nielsen #1 — Feedback | Nombre de lignes, encodage, séparateur confirmés = contrôle qualité immédiat |

---

## Composants Drupal associés

| Composant UI | Implémentation Drupal |
|---|---|
| Bouton [Exporter CSV] dans la liste | Views data export (module `views_data_export`) ou action Views personnalisée |
| Modal de configuration export | Drupal Dialog API + formulaire Symfony custom `ExportConfigForm` |
| Choix périmètre (filtré / tout) | Paramètre passé au `ExportController` — conditions sur les filtres Views actifs |
| Sélection colonnes | `ExportConfigForm` — cases à cocher mappées sur les champs Views |
| Séparateur configurable | Paramètre `delimiter` dans `CsvEncoder` Symfony |
| Encodage UTF-8 avec BOM | `CsvEncoder` — option `bom => true` ou prepend `\xEF\xBB\xBF` dans le StreamedResponse |
| Génération nom de fichier | `ExportController::generateFilename()` — date + filtres actifs + slug |
| Téléchargement immédiat | `StreamedResponse` avec header `Content-Disposition: attachment; filename="..."` |
| Message de confirmation | Drupal messenger `MessengerInterface::addStatus()` + métadonnées export |
