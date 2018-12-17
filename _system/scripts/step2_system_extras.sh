#!/bin/bash
sudo pacman -Syu

##
# INSTALL
#
echo "Installing essentials...\n"

sudo pacman -S --noconfirm i3-wm i3blocks i3lock dmenu nodm # window manager
sudo pacman -S --noconfirm alacritty fish
sudo pacman -S --noconfirm nvim xsel ack
sudo pacman -S --noconfirm emacs
sudo pacman -S --noconfirm stow
# NOTE: FiraCode would be grate but no ligature support in alacritty for now. See https://github.com/jwilm/alacritty/issues/50
# NOTE: adobe-source-code-pro-fonts used but not required by emacs/spacemacs
sudo pacman -S --noconfirm ttf-hack noto-fonts-cjk adobe-source-code-pro-fonts
sudo pacman -S --noconfirm maim # screenshots / screencasting
sudo pacman -S --noconfirm yarn
sudo pacman -S chromium firefox

# PERFORMANCE IMPROVMENTS
yay -S --noconfirm zramswap
sudo systemctl start zramswap.service
sudo systemctl enable zramswap.service
yay -S profile-sync-daemon # syncs browser profiles to ram
systemctl --user start psd.service
systemctl --user enable psd.service
# chromium has the `disk-cache-dir` flag to set  where to store cache (see ~/.config/chromium-flags.conf) but firefox needs manual setup in about:config. A better alternative is to set the whole ~/.cache directory as a tmpfs as below
echo "tmpfs   /home/${USER}/.cache       tmpfs   noatime,nodev,nosuid,size=120M  0       0" | sudo tee -a /etc/fstab
yay --noconfirm -S earlyoom # see https://github.com/rfjakob/earlyoom - kills processes when about to run out of sRAM
sudo systemctl enable earlyoom
sudo systemctl start earlyoom




##
# CONFIGURE
#
echo "Installing and configuring Spacemacs...\n"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

echo "\nInstalling fish...\n"
curl -L https://get.oh-my.fish | fish

echo "Stowing configuration files...\n"
mv ~/.bashrc ~/.bashrc.bkp
cd ~/stow
stow alacritty
stow browsing
mkdir -p ~/.local/bin #needed for some custom stowed scripts
stow fish
stow git
stow i3
stow nvim
stow scripts
stow spacemacs
stow xinit

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

