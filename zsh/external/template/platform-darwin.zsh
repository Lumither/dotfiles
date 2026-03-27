[[ "$OSTYPE" != darwin* ]] && return

export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias ls='ls -G'

(( $+commands[brew] )) && {
    local brew_prefix="$(brew --prefix)"
    [[ -d "$brew_prefix/opt/postgresql@16/bin" ]] && path=("$brew_prefix/opt/postgresql@16/bin" $path)
    [[ -d "$brew_prefix/opt/openjdk/bin" ]] && path=("$brew_prefix/opt/openjdk/bin" $path)
}

[[ -d "/Library/Frameworks/Python.framework/Versions/3.13/bin" ]] && \
    path=("/Library/Frameworks/Python.framework/Versions/3.13/bin" $path)
