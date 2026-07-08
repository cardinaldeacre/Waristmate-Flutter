#!/bin/bash

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

echo "Build Date: $BUILD_DATE"

cat > lib/core/config/app_info.dart <<EOF
class AppInfo {
  static const String buildDate = '$BUILD_DATE';
}
EOF

flutter build apk --release --split-per-abi