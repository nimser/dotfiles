#!/bin/bash

# downloads or update latest nightly neovim version from github

set -e

NVIM_PATH="/usr/local/bin/nvim"
NVIM_EXTRACTED_DIR="/opt/nvim"
TEMP_DIR=$(mktemp -d)
ARCH=$(uname -m)
APPIMAGE_URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-$ARCH.appimage"

echo "Downloading latest Neovim nightly AppImage"
curl -sL "$APPIMAGE_URL" -o "$TEMP_DIR/nvim.appimage"
chmod +x "$TEMP_DIR/nvim.appimage"

echo "Extracting AppImage..."
cd "$TEMP_DIR"
sudo mkdir -p "$NVIM_EXTRACTED_DIR"
./nvim.appimage --appimage-extract
sudo cp -r squashfs-root/* "$NVIM_EXTRACTED_DIR/"
sudo ln -sf "$NVIM_EXTRACTED_DIR/AppRun" "$NVIM_PATH"

rm -rf "$TEMP_DIR"
echo "Installed $(nvim --version | head -n 1)"
echo "Done."
