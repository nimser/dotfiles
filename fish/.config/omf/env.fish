set PATH $HOME/local/bin $PATH
set -gx TERMINAL "alacritty"
set -gx EDITOR "nvim"
set -gx DIFFPROG "nvim -d"
#set -gx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
#set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
#set -gx FZF_DEFAULT_OPTS '--height=70% --preview="bat {}" --preview-window=right:60%:wrap'
set -gx JAVA_OPTS "-Xms512m -Xmx512m"
set -gx UD_RUBY_VERSION "2.5.0"
set -gx GTK_IM_MODULE "fcitx5"
set -gx XMODIFIERS "@im=fcitx5"
set -gx QT_IM_MODULE "fcitx5"
set -gx NIX_IGNORE_SYMLINK_STORE 1
set -gx GOLDENDICT_DIR /home/owner/local/goldendict/lib
set -gx TESSDATA_PREFIX /home/owner/local/goldendict/ocr
set -gx LD_LIBRARY_PATH $GOLDENDICT_DIR/lib $LD_LIBRARY_PATH
set -gx GPGID "03BC4AD253B82986"
set -gx SSH_AGENT_PID ""
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"
set -gx GPG_TTY (tty)
