#!/bin/bash
# ============================================================
# IndiaStocks AI - Google Cloud Shell Build Script
# Run this script inside Google Cloud Shell
# ============================================================

set -e  # Exit on error

echo "======================================"
echo " IndiaStocks AI - Android Build Setup"
echo "======================================"

# -------------------------------------------------------
# STEP 1: Install Java 17
# -------------------------------------------------------
echo ""
echo "[1/7] Installing Java 17..."
sudo apt-get update -q
sudo apt-get install -y openjdk-17-jdk wget unzip zip
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
java -version

# -------------------------------------------------------
# STEP 2: Download Android Command Line Tools
# -------------------------------------------------------
echo ""
echo "[2/7] Downloading Android SDK Command Line Tools..."
mkdir -p $HOME/android-sdk/cmdline-tools
cd /tmp
wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdtools.zip
unzip -q cmdtools.zip -d $HOME/android-sdk/cmdline-tools
mv $HOME/android-sdk/cmdline-tools/cmdline-tools $HOME/android-sdk/cmdline-tools/latest

# -------------------------------------------------------
# STEP 3: Set Android SDK environment variables
# -------------------------------------------------------
echo ""
echo "[3/7] Setting up Android SDK environment..."
export ANDROID_HOME=$HOME/android-sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/34.0.0:$PATH

# Persist for future sessions
cat >> $HOME/.bashrc << 'ENVEOF'
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export ANDROID_HOME=$HOME/android-sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/34.0.0:$PATH
ENVEOF

# -------------------------------------------------------
# STEP 4: Accept SDK licenses and install components
# -------------------------------------------------------
echo ""
echo "[4/7] Accepting SDK licenses and installing components..."
echo "y" | sdkmanager --licenses > /dev/null 2>&1 || true
sdkmanager \
  "platform-tools" \
  "platforms;android-34" \
  "build-tools;34.0.0" \
  "extras;android;m2repository" \
  "extras;google;m2repository"

echo "Android SDK components installed."

# -------------------------------------------------------
# STEP 5: Upload or extract project
# -------------------------------------------------------
echo ""
echo "[5/7] Extracting project..."

# Check if zip was uploaded
if [ -f "$HOME/IndiaStocks_AI_Android.zip" ]; then
    unzip -q $HOME/IndiaStocks_AI_Android.zip -d $HOME/
    PROJECT_DIR=$HOME/StockPredictor
elif [ -d "$HOME/StockPredictor" ]; then
    PROJECT_DIR=$HOME/StockPredictor
    echo "Project directory already exists."
else
    echo ""
    echo "ERROR: Project not found!"
    echo "Please upload IndiaStocks_AI_Android.zip to Cloud Shell first:"
    echo "  Click the 3-dot menu (⋮) → Upload → select IndiaStocks_AI_Android.zip"
    echo "Then run this script again."
    exit 1
fi

cd $PROJECT_DIR
echo "Project directory: $PROJECT_DIR"
ls -la

# -------------------------------------------------------
# STEP 6: Add google-services.json (dummy for debug build)
# -------------------------------------------------------
echo ""
echo "[6/7] Setting up Firebase config (debug stub)..."

# Create a minimal google-services.json for debug builds
# Replace with your real one for production
cat > $PROJECT_DIR/app/google-services.json << 'FBEOF'
{
  "project_info": {
    "project_number": "123456789",
    "project_id": "indiastocks-ai-debug",
    "storage_bucket": "indiastocks-ai-debug.appspot.com"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:123456789:android:abcdef123456",
        "android_client_info": { "package_name": "com.stockpredictor.india" }
      },
      "oauth_client": [],
      "api_key": [{ "current_key": "dummy_key_replace_with_real" }],
      "services": { "appinvite_service": { "other_platform_oauth_client": [] } }
    }
  ],
  "configuration_version": "1"
}
FBEOF

echo "google-services.json created (debug stub). Replace with real file for production."

# -------------------------------------------------------
# STEP 7: Build the APK
# -------------------------------------------------------
echo ""
echo "[7/7] Building Debug APK..."

chmod +x $PROJECT_DIR/gradlew

# Set Gradle options for Cloud Shell (limited memory)
export GRADLE_OPTS="-Xmx2g -XX:MaxMetaspaceSize=512m -XX:+HeapDumpOnOutOfMemoryError"

cd $PROJECT_DIR
./gradlew assembleDebug \
  --no-daemon \
  --stacktrace \
  -Dorg.gradle.jvmargs="-Xmx2g -XX:MaxMetaspaceSize=512m"

# -------------------------------------------------------
# DONE
# -------------------------------------------------------
APK_PATH=$(find $PROJECT_DIR -name "*.apk" | head -1)

echo ""
echo "======================================"
echo " BUILD SUCCESSFUL!"
echo "======================================"
echo ""
echo "APK Location: $APK_PATH"
echo "APK Size: $(du -sh $APK_PATH | cut -f1)"
echo ""
echo "To download the APK:"
echo "  cloudshell download $APK_PATH"
echo ""
echo "Or from Cloud Shell menu:"
echo "  Click ⋮ → Download → paste the path above"
echo ""
