#!/usr/bin/env bash

set -euo pipefail

TARGET=${1:-x86_64-pc-windows-msvc}

echo "Target: $TARGET"

if [[ $TARGET == *"windows"* ]]; then
  ECHO "TARGET contains windows"
else
  ECHO "TARGET does not contain windows"
fi
