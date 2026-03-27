#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

git -C "$DOTFILES" config core.hooksPath .githooks
echo "git hooks configured"
