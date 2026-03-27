# dotfiles

some config

```bash
.
├── alacritty
│   └── alacritty.toml
├── ideavim
│   └── ideavimrc
├── kitty
│   └── kitty.conf
├── LICENSE
├── Makefile
├── neovim
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua/(...)
├── README.md
├── scripts
│   ├── health.sh
│   ├── install.sh
│   └── setup.sh
├── tmux
│   └── tmux.conf
├── vim
│   └── vimrc
├── vscode
│   ├── extensions.txt
│   ├── keybindings.json
│   ├── post-install.sh
│   └── settings.json
└── zsh
    ├── conf.d/(...)
    ├── external/(...)
    ├── p10k.zsh
    ├── plugins
    ├── zprofile
    └── zshrc
```

## Usage

```Makefile
.PHONY: all
all: setup submodules install health

.PHONY: setup
setup:
	bash scripts/setup.sh

.PHONY: submodules
submodules:
	git submodule update --init --recursive

.PHONY: install
install:
	bash scripts/install.sh

.PHONY: health
health:
	bash scripts/health.sh
````
