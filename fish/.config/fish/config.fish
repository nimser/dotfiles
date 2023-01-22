if status is-interactive
  # pnpm
  set -gx PNPM_HOME "/home/owner/.local/share/pnpm"
  set -gx PATH "$PNPM_HOME" $PATH

  set fzf_fd_opts --hidden --exclude=.git
  set -x fzf_git_log_opts --preview="git show {1} | DELTA_FEATURES='side-by-side=false' delta"

  if test -d ~/.rbenv/bin
    set -gx fish_user_paths $fish_user_paths ~/.rbenv/bin
    set -gx fish_user_paths $fish_user_paths ~/.rbenv/shims
    status --is-interactive; and . (rbenv init -|psub)
  end

  if test -d ~/.local/bin
    set -gx fish_user_paths $fish_user_paths ~/.local/bin
  end

  eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
end

