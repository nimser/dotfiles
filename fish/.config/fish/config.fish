set -U fish_user_paths $fish_user_paths ~/.rbenv/bin
set -x EDITOR 'nvim'
status --is-interactive; and . (rbenv init -|psub)

# Base16 Shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
end

