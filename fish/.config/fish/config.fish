set -U fish_user_paths  ~/.rbenv/bin
set -x EDITOR 'nvim'
status --is-interactive; and . (rbenv init -|psub)
