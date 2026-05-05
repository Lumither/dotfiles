#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"
ZSHDIR="$DOTFILES/zsh"

red()   { printf '\033[31m  x %s\033[0m\n' "$*"; }
green() { printf '\033[32m  + %s\033[0m\n' "$*"; }

ok=0 fail=0

check() {
    local name="$1" path="$2"
    if [[ -e "$path" ]]; then
        green "$name"
        ok=$((ok + 1))
    else
        red "$name ($path)"
        fail=$((fail + 1))
    fi
}

check_cmd() {
    local name="$1" cmd="$2"
    if command -v "$cmd" &>/dev/null; then
        green "$name"
        ok=$((ok + 1))
    else
        red "$name (install: $cmd)"
        fail=$((fail + 1))
    fi
}

echo "dotfiles health check"
echo

echo "zsh submodules:"
check "powerlevel10k" "$ZSHDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme"
check "zsh-autosuggestions" "$ZSHDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
check "zsh-vi-mode" "$ZSHDIR/plugins/zsh-vi-mode/zsh-vi-mode.zsh"
check "zsh-syntax-highlighting" "$ZSHDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

echo
echo "zsh binaries:"
check_cmd "zoxide" "zoxide"

echo
echo "neovim binaries:"
check_cmd "ripgrep" "rg"
check_cmd "fzf" "fzf"

echo
echo "desktop binaries:"
check_cmd "niri" "niri"
check_cmd "waybar" "waybar"
check_cmd "mako" "mako"
check_cmd "kanata" "kanata"
check_cmd "awww" "awww"

echo
if [[ $fail -eq 0 ]]; then
    printf '\033[32mall %d checks passed\033[0m\n' "$ok"
else
    printf '\033[31m%d failed\033[0m, %d passed\n' "$fail" "$ok"
    exit 1
fi
