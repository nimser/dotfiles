#!/bin/bash
sudo pacman -Syu
#### UPDATE 
#### INSTALL
echo "\nInstalling i3 alacritty, nvim, fonts and more...\n"

# window manager
sudo pacman -S --noconfirm i3-wm i3blocks i3lock dmenu
nodm

# Editors terminal and clipboard
sudo pacman -S --noconfirm alacritty fish
sudo pacman -S --noconfirm nvim xsel ack
sudo pacman -S --noconfirm emacs

# fonts
# NOTE: FiraCode would be grate but no ligature support in alacritty for now. See https://github.com/jwilm/alacritty/issues/50
# NOTE: adobe-source-code-pro-fonts used but not required by emacs/spacemacs
sudo pacman -S --noconfirm ttf-hack noto-fonts-cjk adobe-source-code-pro-fonts

# configuration management
sudo pacman -S --noconfirm stow

# screenshots / screencasting
sudo pacman -S --noconfirm maim

# dev
sudo pacman -S --noconfirm yarn

# Web browsers and cache management
sudo pacman -S chromium firefox
yay -S profile-sync-daemon
systemctl --user start psd.service
systemctl --user enable psd.service
# chromium has the `disk-cache-dir` flag to set  where to store cache (see ~/.config/chromium-flags.conf) but firefox needs manual setup in about:config. A better alternative is to set the whole ~/.cache directory as a tmpfs as below
echo "tmpfs   /home/${USER}/.cache       tmpfs   noatime,nodev,nosuid,size=120M  0       0" | sudo tee -a /etc/fstab

# ZRAM and ZSWAP
yay -S --noconfirm zramswap
systemctl start zramswap.service
systemctl enable zramswap.service


# Instant Messaging
  # Skype Stable
  # Telegram Desktop
  # Discord
  # Slack
  # Zoom.us

#### CONFIGURE
# Terminal
echo "\nInstalling fish...\n"
curl -L https://get.oh-my.fish | fish
echo "Stowing configuration files...\n"
mv ~/.bashrc ~/.bashrc.bkp
cd ~/stow
stow i3
stow alacritty
mkdir -p ~/.local/bin #needed for some custom stowed scripts 
stow fish

echo "Installing and configuring NVM...\n"
yay -S nvm
omf install
yarn config set prefix ~/.local/

echo "TODO - Installing and configuring Rbenv...\n"
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
bash -c "cd ~/.rbenv && src/configure && make -C src"
rbenv install $UD_RUBY_VERSION # rbenv intall -l to see all versions
rbenv global $UD_RUBY_VERSION

echo "Installing and configuring Elm..."
yarn global install elm
# TODO - update the list of used elm plugins to install here

echo "Installing and configuring Spacemacs...\n"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cd ~/stow
stow spacemacs
