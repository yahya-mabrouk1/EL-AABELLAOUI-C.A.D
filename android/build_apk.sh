#!/bin/bash
set -e

# Configuration des chemins d'outils
export JAVA_HOME=${JAVA_HOME:-/home/yahya/.toolchain/jdk17}
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_HOME=${ANDROID_HOME:-/home/yahya/.toolchain/android-sdk}
BUILD_TOOLS=$ANDROID_HOME/build-tools/34.0.0
PLATFORM=$ANDROID_HOME/platforms/android-34/android.jar

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$SCRIPT_DIR"

echo "[1/7] Synchronisation du fichier index.html avec le code Web..."
mkdir -p app/src/main/assets
cp "$REPO_ROOT/index.html" app/src/main/assets/index.html

echo "[2/7] Nettoyage et préparation des dossiers de compilation..."
rm -rf build
mkdir -p build/gen build/obj build/intermediates build/outputs

echo "[3/7] Compilation des ressources avec aapt2..."
$BUILD_TOOLS/aapt2 compile --dir app/src/main/res -o build/intermediates/compiled_res.zip

echo "[4/7] Liaison des ressources (Linking) et génération de R.java..."
$BUILD_TOOLS/aapt2 link \
    -I $PLATFORM \
    --manifest app/src/main/AndroidManifest.xml \
    --java build/gen \
    -o build/intermediates/unaligned.apk \
    -A app/src/main/assets \
    --auto-add-overlay \
    build/intermediates/compiled_res.zip

echo "[5/7] Compilation du code Java natif..."
$JAVA_HOME/bin/javac \
    -cp $PLATFORM:build/gen \
    -d build/obj \
    $(find app/src/main/java build/gen -name "*.java")

echo "[6/7] Conversion du bytecode en Dalvik Executable (classes.dex)..."
$BUILD_TOOLS/d8 \
    --lib $PLATFORM \
    --output build/intermediates/ \
    $(find build/obj -name "*.class")

python3 -c "
import zipfile
with zipfile.ZipFile('build/intermediates/unaligned.apk', 'a') as apk:
    apk.write('build/intermediates/classes.dex', 'classes.dex')
"

echo "[7/7] Alignement et signature de l'APK..."
$BUILD_TOOLS/zipalign -v -p 4 build/intermediates/unaligned.apk build/intermediates/aligned.apk > /dev/null

if [ ! -f build/debug.keystore ]; then
    keytool -genkey -v \
        -keystore build/debug.keystore \
        -storepass android \
        -alias androiddebugkey \
        -keypass android \
        -keyalg RSA \
        -keysize 2048 \
        -validity 10000 \
        -dname "CN=EL AABELLAOUI,OU=CAD,O=EL AABELLAOUI C.A.D,L=Tiznit,ST=Souss,C=MA" \
        > /dev/null 2>&1
fi

$BUILD_TOOLS/apksigner sign \
    --ks build/debug.keystore \
    --ks-pass pass:android \
    --out EL-AABELLAOUI-C.A.D.apk \
    build/intermediates/aligned.apk

# Copie également à la racine du dépôt
cp EL-AABELLAOUI-C.A.D.apk "$REPO_ROOT/EL-AABELLAOUI-C.A.D.apk"

echo "Vérification des signatures..."
$BUILD_TOOLS/apksigner verify EL-AABELLAOUI-C.A.D.apk

echo "=========================================================="
echo "SUCCÈS ! APK généré avec succès :"
echo "  - $SCRIPT_DIR/EL-AABELLAOUI-C.A.D.apk"
echo "  - $REPO_ROOT/EL-AABELLAOUI-C.A.D.apk"
ls -lh EL-AABELLAOUI-C.A.D.apk
echo "=========================================================="
