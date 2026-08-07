#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"
OS="$(uname)"

# -- vscode variant detection ----------------------------------------------
if command -v code-oss >/dev/null 2>&1; then
    VSCODE_BIN="code-oss"; VSCODE_DIR="Code - OSS"
elif command -v codium >/dev/null 2>&1; then
    VSCODE_BIN="codium"; VSCODE_DIR="VSCodium"
elif command -v code-insiders >/dev/null 2>&1; then
    VSCODE_BIN="code-insiders"; VSCODE_DIR="Code - Insiders"
else
    VSCODE_BIN="code"; VSCODE_DIR="Code"
fi
export VSCODE_BIN

# -- platform-specific paths -----------------------------------------------
case "$OS" in
    Darwin)
        VSCODE="$HOME/Library/Application Support/$VSCODE_DIR/User"
        ;;
    Linux)
        VSCODE="$HOME/.config/$VSCODE_DIR/User"
        ;;
    *)
        echo "Unsupported platform: $OS" >&2
        exit 1
        ;;
esac

# -- links: name | source | target -----------------------------------------
links=(
    "neovim     | neovim                               | $HOME/.config/nvim"
    "kitty      | kitty                                | $HOME/.config/kitty"
    "vscode     | vscode/settings.json                 | $VSCODE/settings.json"
    "vscode     | vscode/keybindings.json              | $VSCODE/keybindings.json"
    "alacritty  | alacritty/alacritty.toml             | $HOME/.alacritty.toml"
    "vim        | vim/vimrc                            | $HOME/.vimrc"
    "ideavim    | ideavim/ideavimrc                    | $HOME/.ideavimrc"
    "zsh        | zsh/zshrc                            | $HOME/.zshrc"
    "zsh        | zsh/zprofile                         | $HOME/.zprofile"
    "tmux       | tmux/tmux.conf                       | $HOME/.tmux.conf"
    "niri       | desktop/niri                         | $HOME/.config/niri"
    "noctalia   | desktop/noctalia                     | $HOME/.config/noctalia"
    "neovide    | desktop/neovide                      | $HOME/.config/neovide"
    "kanata     | desktop/kanata/kanata.kbd            | $HOME/.config/kanata.kbd"
    "kde        | desktop/kde/kdeglobals               | $HOME/.config/kdeglobals"
    "fcitx5     | desktop/fcitx5/classicui.conf        | $HOME/.config/fcitx5/conf/classicui.conf"
    "fcitx5     | desktop/fcitx5/dark-rounded          | $HOME/.local/share/fcitx5/themes/dark-rounded"
    "envd       | desktop/environment.d                | $HOME/.config/environment.d"
    "portal     | desktop/xdg-portal/niri-portals.conf | $HOME/.config/xdg-desktop-portal/niri-portals.conf"
)

# -- groups: alias | members -----------------------------------------------
groups=(
    "desktop | niri noctalia kanata kde fcitx5 envd portal"
)

# -- helpers ---------------------------------------------------------------
red()   { printf '\033[31m%s\033[0m\n' "$*"; }
green() { printf '\033[32m%s\033[0m\n' "$*"; }
dim()   { printf '\033[2m%s\033[0m\n' "$*"; }

link() {
    local src="$1" dst="$2"

    mkdir -p "$(dirname "$dst")"

    if [ -L "$dst" ]; then
        if [ "$(readlink "$dst")" = "$src" ]; then
            dim "  skip  $dst (already linked)"
            return
        fi
        rm "$dst"
    elif [ -e "$dst" ]; then
        mv "$dst" "$dst.bak"
        green "  back  $dst -> $dst.bak"
    fi

    ln -sf "$src" "$dst"
    green "  link  $dst -> $src"
}

# -- main ------------------------------------------------------------------
_ran_hooks=""

filter=()
for arg in "$@"; do
    hit=""
    for g in "${groups[@]}"; do
        IFS='|' read -r gname members <<< "$g"
        gname="$(echo "$gname" | xargs)"
        members="$(echo "$members" | xargs)"
        if [ "$gname" = "$arg" ]; then
            for m in $members; do filter+=("$m"); done
            hit=1; break
        fi
    done
    [ -z "$hit" ] && filter+=("$arg")
done

_hook_ran() { echo "$_ran_hooks" | grep -qx "$1"; }

for entry in "${links[@]}"; do
    IFS='|' read -r name src dst <<< "$entry"
    name="$(echo "$name" | xargs)"
    src="$(echo "$src" | xargs)"
    dst="$(echo "$dst" | xargs)"

    if [ ${#filter[@]} -gt 0 ]; then
        match=false
        for f in "${filter[@]}"; do
            [ "$f" = "$name" ] && match=true
        done
        $match || continue
    fi

    hook_dir="$DOTFILES/$src"
    [ -d "$hook_dir" ] || hook_dir="$(dirname "$hook_dir")"

    pre_hook="$hook_dir/pre-install.sh"
    if [ -x "$pre_hook" ] && ! _hook_ran "pre:$name"; then
        green "  hook  $pre_hook"
        "$pre_hook"
        _ran_hooks="$_ran_hooks
pre:$name"
    fi

    link "$DOTFILES/$src" "$dst"

    post_hook="$hook_dir/post-install.sh"
    if [ -x "$post_hook" ] && ! _hook_ran "post:$name"; then
        green "  hook  $post_hook"
        "$post_hook"
        _ran_hooks="$_ran_hooks
post:$name"
    fi
done
