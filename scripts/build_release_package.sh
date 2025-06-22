#!/usr/bin/env bash

set -euo pipefail



PROJECT_NAME=github-release-test

TARGET=${RUSTTARGET:-x86_64-pc-windows-msvc}

echo "Building hyperlit binary"
echo "Target: $TARGET"

cargo build --release --target $TARGET


echo "Creating zip file"
rm -f "$PROJECT_NAME-$TARGET.zip"
zip -j -r "$PROJECT_NAME-$TARGET.zip" "./target/$TARGET/release/$PROJECT_NAME.exe"