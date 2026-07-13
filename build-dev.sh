#!/bin/bash

# build-dev.sh

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

# Build number sekadar informatif (ditampilkan di app_info.dart),
# tidak ditulis balik ke pubspec.yaml.
BUILD_NUMBER=$(git rev-list --count HEAD)

echo "[DEV BUILD]"
echo "Build Date: $BUILD_DATE"
echo "Build Number (info): $BUILD_NUMBER"

cat > lib/core/config/app_info.dart <<EOF
class AppInfo {
  static const String buildDate = '$BUILD_DATE';
  static const String buildNumber = '$BUILD_NUMBER (dev)';
}
EOF

flutter build apk --release --split-per-abi