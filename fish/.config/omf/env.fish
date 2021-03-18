set PATH $HOME/.cargo/bin $HOME/local/bin $PATH
set -gx TERMINAL "alacritty"
set -gx EDITOR "nvim"
set -gx DIFFPROG "nvim -d"
set -gx JAVA_OPTS "-Xms512m -Xmx512m"
set -gx UD_RUBY_VERSION "2.5.0"
set -gx GTK_IM_MODULE "fcitx"
set -gx XMODIFIERS "@im=fcitx"
set -gx QT_IM_MODULE "fcitx"
set -gx NIX_IGNORE_SYMLINK_STORE 1
set -gx GOLDENDICT_DIR /home/owner/local/goldendict/lib
set -gx TESSDATA_PREFIX /home/owner/local/goldendict/ocr
set -gx LD_LIBRARY_PATH $GOLDENDICT_DIR/lib $LD_LIBRARY_PATH
