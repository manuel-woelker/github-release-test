#!/usr/bin/env bash

set -euo pipefail



PROJECT_NAME=github-release-test

TARGET=${RUSTTARGET:-x86_64-pc-windows-msvc}

echo "Building hyperlit binary"
echo "Target: $TARGET"

cargo build --release --target $TARGET --frozen

// zip if on windows i.e. $TARGET contains windows
if [[ $TARGET == *"windows"* ]]; then
  echo "Creating zip file"
  rm -f "$PROJECT_NAME-$TARGET.zip"
  zip -j -r "$PROJECT_NAME-$TARGET.zip" "./target/$TARGET/release/$PROJECT_NAME.exe"
  exit 0
else
  echo "Creating tar.gz file"
  rm -f "$PROJECT_NAME-$TARGET.tar.gz"
  tar -zcvf "$PROJECT_NAME-$TARGET.tar.gz" "./target/$TARGET/release/$PROJECT_NAME"
fi
