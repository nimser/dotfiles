set -gx GTK_IM_MODULE "fcitx5"
set -gx XMODIFIERS "@im=fcitx5"
set -gx QT_IM_MODULE "fcitx5"
set -gx GOLDENDICT_DIR /home/owner/.local/goldendict/lib
set -gx TESSDATA_PREFIX /home/owner/.local/goldendict/ocr
set -gx LD_LIBRARY_PATH $GOLDENDICT_DIR/lib $LD_LIBRARY_PATH
