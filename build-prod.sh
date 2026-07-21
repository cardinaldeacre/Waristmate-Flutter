#!/bin/bash

# Cara pakai:
#   ./build-prod.sh          -> bump patch (default)  1.0.0 -> 1.0.1
#   ./build-prod.sh minor    -> bump minor             1.0.5 -> 1.1.0
#   ./build-prod.sh major    -> bump major             1.4.2 -> 2.0.0

set -e

MONTHS=(
  Januari Februari Maret April Mei Juni
  Juli Agustus September Oktober November Desember
)

DAY=$(date +%-d)
MONTH_INDEX=$(date +%-m)
YEAR=$(date +%Y)

MONTH=${MONTHS[$((MONTH_INDEX-1))]}
BUILD_DATE="$DAY $MONTH $YEAR"

# --- Pastikan tidak ada perubahan uncommitted sebelum rilis ---
if [ -n "$(git status --porcelain)" ]; then
  echo "Ada perubahan yang belum di-commit. Commit dulu sebelum build prod."
  git status --short
  exit 1
fi

# --- Ambil versi saat ini dari pubspec.yaml ---
CURRENT_VERSION=$(grep '^version: ' pubspec.yaml | sed 's/version: //' | cut -d'+' -f1)
MAJOR=$(echo "$CURRENT_VERSION" | cut -d. -f1)
MINOR=$(echo "$CURRENT_VERSION" | cut -d. -f2)
PATCH=$(echo "$CURRENT_VERSION" | cut -d. -f3)

BUMP_TYPE=${1:-patch}

case "$BUMP_TYPE" in
  major)
    MAJOR=$((MAJOR + 1)); MINOR=0; PATCH=0
    ;;
  minor)
    MINOR=$((MINOR + 1)); PATCH=0
    ;;
  patch)
    PATCH=$((PATCH + 1))
    ;;
  *)
    echo "Argumen tidak dikenal: $BUMP_TYPE (gunakan: major | minor | patch)"
    exit 1
    ;;
esac

NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}"
BUILD_NUMBER=$(git rev-list --count HEAD)

echo "[PROD BUILD]"
echo "Build Date: $BUILD_DATE"
echo "Version: $NEW_VERSION+$BUILD_NUMBER (bump: $BUMP_TYPE)"

# --- Tulis balik versi baru ke pubspec.yaml ---
sed -i "s/^version: .*/version: ${NEW_VERSION}+${BUILD_NUMBER}/" pubspec.yaml

cat > lib/core/config/app_info.dart <<EOF
class AppInfo {
  static const String buildDate = '$BUILD_DATE';
  static const String buildNumber = '$BUILD_NUMBER';
}
EOF

flutter build appbundle --release --build-name=$NEW_VERSION --build-number=$BUILD_NUMBER

# --- Commit perubahan versi supaya repo tetap sinkron dengan APK/AAB yang dirilis ---
git add pubspec.yaml lib/core/config/app_info.dart
git commit -m "chore: bump version to $NEW_VERSION+$BUILD_NUMBER"

echo "Selesai. Versi $NEW_VERSION+$BUILD_NUMBER sudah di-commit dan AAB siap meluncur!"