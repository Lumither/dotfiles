[[ -d "$HOME/Library/pnpm" ]] && { export PNPM_HOME="$HOME/Library/pnpm"; path=($PNPM_HOME $path); }
[[ -d "$HOME/.local/share/pnpm" ]] && { export PNPM_HOME="$HOME/.local/share/pnpm"; path=($PNPM_HOME $path); }
