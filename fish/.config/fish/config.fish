set -gx fish_user_paths $fish_user_paths ~/.rbenv/bin
set -gx fish_user_paths $fish_user_paths ~/.node_modules/bin
set -gx fish_user_paths $fish_user_paths ~/.local/bin
set -gx fish_user_paths $fish_user_paths ~/bin/
set -gx EDITOR 'nvim'
set -gx JAVA_OPTS "-Xms512m -Xmx512m"
status --is-interactive; and . (rbenv init -|psub)
