# 🏭 Système Intelligent de Gestion des Terminaux Industriels

[![Microsoft Access](https://img.shields.io/badge/Microsoft_Access-Database-A4373A?style=for-the-badge&logo=microsoftaccess&logoColor=white)](https://www.microsoft.com/)
[![VBA](https://img.shields.io/badge/VBA-Automation-217346?style=for-the-badge&logo=microsoftoffice&logoColor=white)](https://learn.microsoft.com/en-us/office/vba/)
[![SQL](https://img.shields.io/badge/SQL-Data_Queries-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://en.wikipedia.org/wiki/SQL)
[![Power BI](https://img.shields.io/badge/Power_BI-Analytics-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![Lean Manufacturing](https://img.shields.io/badge/Lean-PDCA_|_Kaizen_|_5S-008080?style=for-the-badge)](https://en.wikipedia.org/wiki/Lean_manufacturing)

Application industrielle de centralisation, de traçabilité et de localisation intelligente des terminaux de câblage automobile, développée pour le département **Cutting** au sein de **Lear Corporation**.

---

## 📌 Présentation du Projet

Dans le cadre de mon **Projet de Fin d'Études (PFE)** d'Ingénieur d'État en Génie Informatique (ENSA Fès), j'ai analysé, conçu et déployé un système de gestion intelligent dédié aux terminaux industriels pour l'alimentation des lignes de coupe et de sertissage automobile.

### Enjeux opérationnels
- **Digitalisation & Zéro Rupture** : Suppression des saisies manuelles et fiabilisation des stocks critiques.
- **Gain de temps opérateur** : Réduction drastique du temps de recherche des références dans les racks de stockage.
- **Traçabilité de bout en bout** : Enregistrement de chaque mouvement (entrée, sortie, transfert) par scan code-barres.
- **Synchronisation flux tirés (Kanban)** : Pilotage en temps réel des réapprovisionnements et des commandes en attente (*Waiting Reception*).

---

## ⚙️ Fonctionnalités Clés

1. **📦 Gestion Centralisée du Stock**
   - Suivi dynamique des stocks par référence, numéro de lot, fabricant et section de câble.
   - Seuils de sécurité paramétrables avec déclenchement d'alertes visuelles automatiques.

2. **📍 Localisation Spatiale dans les Racks**
   - Organisation matricielle (`Allée` / `Rack` / `Niveau` / `Alvéole`).
   - Algorithme d'optimisation de rangement orienté fréquence de rotation (Classification ABC).

3. **📲 Identification par Scanner Code-Barres**
   - Lecture instantanée des étiquettes industrielles (Code 128 / QR / 2D).
   - Validation de cohérence en temps réel évitant les erreurs de sertissage sur ligne de production.

4. **🔄 Suivi Kanban & Waiting Reception**
   - Gestion des ordres de transfert internes entre magasin principal et zone tampon Cutting.
   - Visualisation et validation des réceptions fournisseurs en attente de contrôle qualité.

5. **📊 Pilotage & Indicateurs Power BI**
   - Tableaux de bord décisionnels connectés à la base de données.
   - KPI en temps réel : rotation des stocks, taux d'occupation des alvéoles, respect des délais de livraison interne.

---

## 🛠️ Stack Technique

- **Système de gestion de base de données** : Microsoft Access (`.accdb`) avec tables relationnelles normalisées.
- **Logique applicative & Automatisation** : VBA (Visual Basic for Applications).
- **Interrogation et traitement** : SQL structuré (Jointures complexes, agrégations, calculs de deltas).
- **Analyse & Visualisation** : Microsoft Power BI, Microsoft Excel Avancé.
- **Hardware connecté** : Lecteur code-barres industriel USB / Bluetooth.

---

## 📂 Organisation du Dépôt

```
├── docs/
│   └── architecture_systeme.md   # Diagrammes de flux et spécifications industrielles
├── sql/
│   └── queries.sql               # Requêtes SQL types (Kanban, stocks nets, occupation racks)
├── Gestion_Stock12.accdb          # Base de données Access & application de gestion
├── .gitignore                    # Exclusion des fichiers de verrou (.laccdb) et temporaires
└── README.md                     # Documentation générale du projet
```

---

## 🏭 Méthodologies Lean Appliquées

Le système a été conçu et itéré selon les principes du Lean Manufacturing :
- **PDCA (Plan, Do, Check, Act)** : Cycles d'amélioration continue basés sur les retours d'expérience des opérateurs terrain.
- **5S** : Standardisation visuelle du rangement physique des racks et des interfaces applicatives.
- **Poka-Yoke** : Contrôle de saisie automatisé par scan pour éliminer le risque d'erreur humaine.

---

## 👨‍💻 Auteur

**EL Kharbaoui Anass**  
*Ingénieur d'État en Génie Informatique — ENSA Fès*  
Lear Corporation — Département Cutting