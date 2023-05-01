if status is-interactive
  # add ~/.local/bin to path
  if test -d ~/.local/bin
    set -gx fish_user_paths $fish_user_paths ~/.local/bin
  end

  # add ~/.local/distrobox/bin to path
  if test -d ~/.local/distrobox/bin
    set -gx fish_user_paths $fish_user_paths ~/.local/distrobox/bin
  end
end

# pnpm
set -gx PNPM_HOME "/home/owner/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end