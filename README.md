# EL-AABELLAOUI-C.A.D | مولد عقود التعيين العقارية

<div align="center">

![Version](https://img.shields.io/badge/Version-v16-blue?style=for-the-badge)
![Tech](https://img.shields.io/badge/Stack-HTML5%20%7C%20CSS3%20%7C%20Vanilla%20JS-1e3a8a?style=for-the-badge)
![Offline](https://img.shields.io/badge/Offline-100%25%20Autonome-success?style=for-the-badge)
![Format](https://img.shields.io/badge/Format-A4%20Print%20%26%20PDF-orange?style=for-the-badge)
![Country](https://img.shields.io/badge/Juridiction-Maroc%20(MAD)-c1272d?style=for-the-badge)

**Application monopage (SPA) autonome pour la génération, la prévisualisation, l'archivage et l'impression de contrats de désignation et réservation immobilière (« عقد التعيين »).**

*Développée spécialement pour la société de promotion immobilière **EL AABELLAOUI C.A.D** (Projet « إقامة البشير » — Tiznit / Aglou).*

</div>

---

## 📌 Présentation du Projet

Dans la promotion immobilière au Maroc, le **« contrat de désignation / réservation » (عقد التعيين / حجز الشقة)** constitue l'acte sous seing privé initial fixant les caractéristiques précises de l'appartement, le prix convenu, l'acompte versé et les conditions suspensives avant l'établissement du compromis ou de l'acte authentique chez le notaire / adoul. Ce document fait également office de **reçu de versement de l'acompte (توصيل الحجز)**.

Ce projet fournit une application web légère, zéro dépendance, fonctionnant entièrement hors-ligne dans n'importe quel navigateur moderne, garantissant des impressions et exports PDF normalisés au format **A4**.

---

## ✨ Fonctionnalités et Améliorations (Version v16)

### 🖨️ Impression & Export PDF au format A4 normalisé
* Rendu haute fidélité via la feuille de style `@media print`.
* Formatage A4 strict avec marges équilibrées (15mm × 18mm) évitant les coupures de texte intempestives.
* Protection des signatures et des articles juridiques contre les sauts de page orphelins (`page-break-inside: avoid`).
* Rendu typographique officiel en arabe avec prise en charge bilingue (noms et coordonnées de l'acheteur en arabe et en français).

### ✍️ Moteur de « Tafqeet » (التفقيط التلقائي بالدرهم والمتر المربع)
* **Conversion automatique en toutes lettres arabes** : dès la saisie d'un chiffre dans le prix final, l'acompte ou la superficie, l'application génère instantanément la formulation juridique en toutes lettres :
  * *Exemple financier* : `450 000` ➔ `أربعمائة وخمسون ألف درهم`.
  * *Exemple superficie* : `65.50` ➔ `خمسة وستون متراً مربعاً وخمسون سنتيمتراً مربعاً تقريباً`.
* Boutons individuels `🔄 تفقيط` pour relancer ou écraser la conversion à la demande tout en laissant la liberté de modifier manuellement le texte.

### ⚡ Calcul instantané du solde restant
* Calcul automatique en temps réel : $\text{Solde restant} = \text{Prix Total} - \text{Acompte déposé}$.
* Mise à jour conjointe des chiffres et de la conversion en lettres.

### 👁️ Prévisualisation directe à l'écran
* Bouton **« معاينة على الشاشة »** affichant une feuille A4 virtuelle fidèle au résultat papier final sans devoir ouvrir la boîte de dialogue d'impression du système.
* Déclenchement de l'impression immédiate directement depuis la fenêtre de prévisualisation.

### 💾 Persistance et Sauvegarde Automatique (`localStorage`)
* **Sauvegarde automatique en continu** : toutes les frappes au clavier sont enregistrées localement dans le navigateur. Une fermeture accidentelle ou un rafraîchissement n'entraîne aucune perte de données.
* Bouton **« حفظ مسودة »** avec notifications visuelles flottantes (*Toast*).
* Réinitialisation intelligente avec le bouton **« مسح »** : vide les données de l'acheteur tout en conservant les données d'entreprise par défaut.

### 📦 Export & Import numérique des dossiers clients (Format JSON)
* **📥 Export JSON** : permet de télécharger le dossier d'un acheteur sous forme de fichier structuré (ex : `contrat_mohammed_apt4_2026-11-17.json`). Idéal pour l'archivage numérique sur disque dur, clé USB ou Google Drive.
* **📤 Import JSON** : rechargement d'un contrat existant en 1 clic pour réédition, actualisation des versements ou impression ultérieure.

### 📅 Gestionnaire de date rapide
* Bouton **« 📅 اليوم »** pour insérer instantanément la date du jour au format légal (`JJ/MM/AAAA`).

### ⌨️ Raccourci Clavier
* <kbd>Ctrl</kbd> + <kbd>P</kbd> (ou <kbd>Cmd</kbd> + <kbd>P</kbd> sous macOS) : synchronise automatiquement les données et lance l'impression directement.

---

## 📂 Structure du Répertoire

```text
EL-AABELLAOUI-C.A.D/
├── index.html            # Application web principale complète (CSS, HTML, JS)
└── README.md             # Documentation complète du projet
```

> **Aucune dépendance externe requise** : ni Node.js, ni CDN, ni bibliothèque tierce. L'application est 100% autonome et sécurisée.

---

## 🚀 Guide d'Utilisation

### Option 1 : Utilisation directe en local (Recommandé)
1. Double-cliquez simplement sur [index.html](file:///home/yahya/EL-AABELLAOUI-C.A.D/index.html) depuis votre explorateur de fichiers.
2. Le fichier s'ouvre dans votre navigateur par défaut (Chrome, Firefox, Edge, Safari, Brave...).

### Option 2 : Lancement via un serveur local (Optionnel)
Si vous préférez exécuter l'application sous forme de serveur web local :
```bash
cd /home/yahya/EL-AABELLAOUI-C.A.D
python3 -m http.server 8080
```
Puis accédez à : `http://localhost:8080`

### Option 3 : Déploiement sur GitHub Pages (En ligne)
1. Rendez-vous dans les paramètres de votre dépôt GitHub : **Settings > Pages**.
2. Sous **Build and deployment > Branch**, sélectionnez la branche `main` et le dossier `/ (root)`.
3. Cliquez sur **Save**. Votre générateur sera accessible publiquement ou en accès restreint depuis l'URL fournie par GitHub.

---

## 📋 Structure Juridique du Contrat Généré

Le contrat respecte la structure officielle adoptée pour la commercialisation des biens du projet :

| Section | Titre | Description |
| :--- | :--- | :--- |
| **En-tête** | عقد التعيين | Titre solennel du document |
| **Préambule** | بين الموقعين أسفله | Désignation précise des deux parties contractantes |
| **الطرف الأول** | بيانات الشركة | Société EL AABELLAOUI C.A.D, siège social, représentant légal, désignation du projet |
| **الطرف الثاني** | بيانات المشتري | Nom complet (Arabe et Français), N° CIN, adresse et téléphone |
| **الفصل الأول** | القبول | Constatation de la capacité juridique et acceptation mutuelle de la désignation |
| **الفصل الثاني** | التعيين | Description complète du bien (résidence, n° appartement, superficie chiffrée et en lettres, étage, façades, consistance) |
| **الفصل الثالث** | الشروط | Obligations réciproques : délivrance libre de tout gage/hypothèque pour le vendeur ; acquittement des taxes, respect des échéances financières et clause résolutoire unilatérale en cas de défaut pour l'acheteur |
| **الفصل الرابع** | الثمن وتوصيل الحجز | Prix final, montant versé à la réservation, solde restant, modalités de paiement du reliquat et clause valant reçu de réservation |
| **التوقيعات** | إمضاء الطرفين | Date, ville et emplacements réservés aux signatures des deux parties |

---

## 🛠️ Personnalisation des Données Entreprise

Si vous souhaitez modifier de manière permanente les coordonnées par défaut de la société venderesse, ouvrez [index.html](file:///home/yahya/EL-AABELLAOUI-C.A.D/index.html) et modifiez les attributs `value` dans la première section du formulaire :

```html
<!-- Exemple de modification des valeurs par défaut -->
<input type="text" id="i_compName" value="EL AABELLAOUI C.A.D">
<input type="text" id="i_compRep" value="عبد الحفيظ العبلاوي">
<input type="text" id="i_compAddr" value="GARAGE AU SOUSS N°36 HAY EL YOUSSOUFIA TIZNIT">
<input type="text" id="i_projName" value="إقامة البشير">
<input type="text" id="i_compBranch" value="ZAWIYA TENIN AGLOU TIZNIT">
<input type="text" id="i_signCity" value="تيزنيت">
```

---

## 📄 Impression & Sauvegarde PDF optimale

Pour un rendu d'impression optimal sous Chrome ou Edge :
1. Cliquez sur **« 🖨️ توليد وطباعة العقد (PDF) »** ou appuyez sur <kbd>Ctrl+P</kbd>.
2. Dans la boîte de dialogue d'impression :
   - **Destination** : Choisir votre imprimante ou *Enregistrer au format PDF*.
   - **Format du papier** : *A4*.
   - **Marges** : *Par défaut* (les marges sont calculées automatiquement par le code CSS).
   - **Options** : Cochez *Graphiques d'arrière-plan* (pour conserver la couleur des titres et des puces).

---

## 👤 Auteur & Droits

* **Société** : EL AABELLAOUI C.A.D
* **Développeur & Mainteneur** : [Yahya MABROUK](https://github.com/yahya-mabrouk1)
* **Licence** : Usage interne et professionnel réservé à la société EL AABELLAOUI C.A.D.
