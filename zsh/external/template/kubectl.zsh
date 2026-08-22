(( $+commands[kubectl] )) && {
    ZSH_KUBECTL_COMPDIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
    [[ -f "$ZSH_KUBECTL_COMPDIR/_kubectl" ]] || {
        mkdir -p "$ZSH_KUBECTL_COMPDIR"
        kubectl completion zsh > "$ZSH_KUBECTL_COMPDIR/_kubectl"
    }
    fpath=("$ZSH_KUBECTL_COMPDIR" $fpath)
    unset ZSH_KUBECTL_COMPDIR
}
