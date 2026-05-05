#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

template="$SCRIPT_DIR/appearance.conf.template"
target="$SCRIPT_DIR/appearance.conf"

if [ ! -e "$target" ]; then
    cp "$template" "$target"
    echo "  copy  $target (from template)"
fi
