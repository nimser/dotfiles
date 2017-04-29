set -gx fish_user_paths $fish_user_paths ~/.rbenv/bin
set -gx fish_user_paths $fish_user_paths ~/.node_modules/bin
set -gx fish_user_paths $fish_user_paths ~/.local/bin
set -gx fish_user_paths $fish_user_paths ~/bin/
set -gx EDITOR 'nvim'

## Using gpg-agent as the SSH agent
gpgconf --launch gpg-agent
set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh

status --is-interactive; and . (rbenv init -|psub)
