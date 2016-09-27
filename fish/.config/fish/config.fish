set -U fish_user_paths  ~/.rbenv/bin
set -x EDITOR 'vim -p'
status --is-interactive; and . (rbenv init -|psub)
