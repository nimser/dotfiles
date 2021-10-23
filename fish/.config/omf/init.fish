if test -d ~/.rbenv/bin
  set -gx fish_user_paths $fish_user_paths ~/.rbenv/bin
  set -gx fish_user_paths $fish_user_paths ~/.rbenv/shims
  status --is-interactive; and . (rbenv init -|psub)
end
if test -d ~/.local/bin
  set -gx fish_user_paths $fish_user_paths ~/.local/bin
end

eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh


