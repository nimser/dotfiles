#!/bin/bash

# downloads or update latest nightly neovim version from github

set -e

NVIM_PATH="/usr/local/bin/nvim"
TEMP_DIR=$(mktemp -d)
APPIMAGE_URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage"


echo "Downloading latest Neovim nightly AppImage"
curl -sL "$APPIMAGE_URL" -o "$TEMP_DIR/nvim.appimage"

chmod +x "$TEMP_DIR/nvim.appimage"
echo "Installing to $NVIM_PATH..."
sudo mv "$TEMP_DIR/nvim.appimage" $NVIM_PATH

rm -rf "$TEMP_DIR"
echo "Installed $(nvim --version | head -n 1)"
echo "Done."
