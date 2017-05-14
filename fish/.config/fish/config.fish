if test -d ~/.rbenv/bin
  set -gx fish_user_paths $fish_user_paths ~/.rbenv/bin
  status --is-interactive; and . (rbenv init -|psub)
end
if test -d ~/.local/bin
  set -gx fish_user_paths $fish_user_paths ~/.local/bin
end
set -gx JAVA_OPTS "-Xms512m -Xmx512m"
set -gx UD_RUBY_VERSION "2.4.1"
