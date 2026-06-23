#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE="${VSCODE_BIN:-code}"

installed="$($CODE --list-extensions)"
failed=()

while IFS= read -r ext; do
    [ -z "$ext" ] && continue
    case "$ext" in \#*) continue ;; esac
    if echo "$installed" | grep -qix "$ext"; then
        continue
    fi
    if ! $CODE --install-extension "$ext" --force; then
        failed+=("$ext")
    fi
done < "$SCRIPT_DIR/extensions.txt"

if [ ${#failed[@]} -gt 0 ]; then
    printf '\033[31m  unavailable on this registry:\033[0m\n'
    printf '    %s\n' "${failed[@]}"
fi
