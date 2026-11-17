# EL AABELLAOUI C.A.D — Application Android (APK)

<div align="center">

![Platform](https://img.shields.io/badge/Platform-Android%205.0%2B%20(API%2021%E2%80%9334)-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![Build](https://img.shields.io/badge/APK-Ready%20to%20Install-success?style=for-the-badge)
![Offline](https://img.shields.io/badge/Usage-100%25%20Hors--ligne-blue?style=for-the-badge)

**Application mobile Android native pour la génération et l'impression de contrats de désignation immobilière (« عقد التعيين »).**

</div>

---

## 📱 Fichier APK Prêt à l'Installation

Le fichier APK compilé, aligné et signé est immédiatement disponible ici :

👉 **[EL-AABELLAOUI-C.A.D.apk](file:///home/yahya/EL-AABELLAOUI-C.A.D-android/EL-AABELLAOUI-C.A.D.apk)**

* **Taille** : ~29 Ko (ultra-léger, démarre instantanément)
* **Compatibilité** : Android 5.0 (API 21) jusqu'à Android 14/15 (API 34+)
* **Signatures** : v1 (JAR), v2 (APK Signature Scheme v2), v3

---

## 📲 Guide d'Installation sur votre Smartphone / Tablette

1. **Transférez le fichier** [EL-AABELLAOUI-C.A.D.apk](file:///home/yahya/EL-AABELLAOUI-C.A.D-android/EL-AABELLAOUI-C.A.D.apk) sur votre téléphone :
   * Par câble USB
   * Par WhatsApp / Télégramme
   * Par Google Drive ou par e-mail
2. **Appuyez sur le fichier APK** sur votre téléphone.
3. Si Android vous demande d'autoriser l'installation :
   * Cliquez sur **Paramètres** puis cochez **« Autoriser cette source »** (*Sources inconnues*).
4. Cliquez sur **Installer**.
5. L'application **« EL AABELLAOUI C.A.D »** apparaît sur votre écran d'accueil avec son icône.

---

## 🚀 Fonctionnalités Mobiles Natives

1. **Impression & Export PDF Android Natif (`AndroidBridge`)** :
   * Lorsque vous appuyez sur **« توليد وطباعة العقد (PDF) »**, l'application déclenche directement le gestionnaire d'impression Android (`android.print.PrintManager`).
   * Vous pouvez choisir :
     * **Enregistrer au format PDF** directement dans vos téléchargements.
     * **Imprimer via Wi-Fi ou Bluetooth** sur n'importe quelle imprimante connectée.
2. **Partage Direct de Contrats (`shareContractJson`)** :
   * Le bouton **« تصدير JSON »** ouvre directement le menu de partage Android : vous pouvez envoyer le fichier de contrat du client directement sur **WhatsApp**, par e-mail ou l'enregistrer sur Google Drive.
3. **100% Hors-Ligne** :
   * Tous les composants, formulaires, calculs et polices sont embarqués dans l'application. Aucune connexion 4G ni Wi-Fi n'est nécessaire sur le terrain.
4. **Persistance des Données** :
   * Vos brouillons sont conservés dans le stockage local sécurisé de l'application (`WebView DomStorage`).

---

## 📂 Structure du Répertoire Android

```text
EL-AABELLAOUI-C.A.D-android/
├── EL-AABELLAOUI-C.A.D.apk     # Le fichier APK final prêt à installer
├── build_apk.sh                # Script de compilation autonome
├── app/
│   ├── src/main/
│   │   ├── AndroidManifest.xml # Configuration de l'application Android
│   │   ├── java/               # Code Java natif (MainActivity + WebAppInterface)
│   │   ├── assets/             # index.html mobile avec pont JavaScript
│   │   └── res/                # Ressources (icône, styles, layout)
│   └── build.gradle            # Configuration Gradle du module
├── build.gradle                # Configuration racine
├── settings.gradle
└── README.md                   # Ce guide
```

---

## 🔨 Recompilation (Si vous modifiez l'application)

Pour recompiler l'APK après une modification :
```bash
cd /home/yahya/EL-AABELLAOUI-C.A.D-android
./build_apk.sh
```
L'APK sera immédiatement régénéré et signé à la racine du dossier.
