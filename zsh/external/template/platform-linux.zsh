[[ "$OSTYPE" != linux* ]] && return

alias ls='ls --color=tty'

if [[ -z "$LS_COLORS" ]]; then
    if (( $+commands[dircolors] )); then
        [[ -f "$HOME/.dircolors" ]] \
            && source <(dircolors -b "$HOME/.dircolors") \
            || source <(dircolors -b)
    else
        export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
    fi
fi
