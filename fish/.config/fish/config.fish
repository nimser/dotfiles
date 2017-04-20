set -gx fish_user_paths $fish_user_paths ~/.rbenv/bin
set -gx fish_user_paths $fish_user_paths ~/.node_modules/bin
set -gx fish_user_paths $fish_user_paths ~/.local/bin
set -gx fish_user_paths $fish_user_paths ~/bin/
set -gx EDITOR 'nvim'
status --is-interactive; and . (rbenv init -|psub)

# Base16 Shell
if status --is-interactive
    eval (sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh)
end

