#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

installed="$(code --list-extensions)"

while IFS= read -r ext; do
    if ! echo "$installed" | grep -qix "$ext"; then
        code --install-extension "$ext" --force
    fi
done < "$SCRIPT_DIR/extensions.txt"
