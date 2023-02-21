# note: more env-vars are defined in other `conf.d/*` fish configuration files. use `printenv` or the fish `set -S` command to see all vars.
# exec paths
set -gx PNPM_HOME "/home/owner/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# others
set -gx RIPGREP_CONFIG_PATH "$XDG_CONFIG_HOME/ripgrep/config"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx TERMINAL "alacritty"
set -gx EDITOR "nvim"
set -gx DIFFPROG "nvim -d"
