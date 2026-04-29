autoload -Uz compinit

if [[ -f "$HOME/.zcompdump" && "$HOME/.zcompdump"(Nmh-24) ]]; then
    compinit -C
else
    compinit
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
