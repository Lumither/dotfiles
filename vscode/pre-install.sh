#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ ! -e "$SCRIPT_DIR/settings.json" ]; then
    cp "$SCRIPT_DIR/settings.default.json" "$SCRIPT_DIR/settings.json"
    printf '\033[32m  seed  vscode/settings.json from settings.default.json\033[0m\n'
fi
