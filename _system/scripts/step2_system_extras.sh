#!/bin/bash
if [[ -f `pwd`/sharedfuncs ]]; then
  source sharedfuncs
else
  echo "missing file: sharedfuncs"
  exit 1
fi

sudo pacman -Syu

# SETTING DESCENT MIRRORS
aur_package_install "reflector"
sudo reflector -n 10 --save /etc/pacman.d/mirrorlist
##
# INSTALL
#
echo "Installing essentials...\n"

package_install "i3-wm i3blocks i3lock dmenu nodm" # window manager
package_install "alacritty fish"
package_install "neovim xsel ack"
package_install "emacs"
package_install "stow"
# NOTE: FiraCode would be grate but no ligature support in alacritty for now. See https://github.com/jwilm/alacritty/issues/50
# NOTE: adobe-source-code-pro-fonts used but not required by emacs/spacemacs
package_install "ttf-hack noto-fonts-cjk adobe-source-code-pro-fonts"
package_install "maim" # screenshots / screencasting
package_install "yarn"
package_install "chromium firefox"

# PERFORMANCE IMPROVMENTS
aur_package_install "zramswap"
sudo systemctl start zramswap.service
sudo systemctl enable zramswap.service
aur_package_install "profile-sync-daemon" # syncs browser profiles to ram
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
mv ~/.emacs.d ~/.emacs.d.bkp
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d


echo "Stowing configuration files...\n"
mv ~/.bashrc ~/.bashrc.bkp
mv ~/.config/conf.d/omf.fish ~/.config/conf.d/omf.fish.bkp
mv ~/.config/psd/psd.conf ~/.config/psd/psd.conf.bkp
cd ~/dotfiles
stow -R alacritty
stow -R browsing
mkdir -p ~/.local/bin #needed for some custom stowed scripts
stow -R fish
stow -R git
stow -R i3
stow -R nvim
stow -R scripts
stow -R spacemacs
stow -R xinit

echo "Installing and configuring NVM...\n"
aur_package_install "nvm"
yarn config set prefix ~/.local/

echo "TODO - Installing and configuring Rbenv...\n"
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
bash -c "cd ~/.rbenv && src/configure && make -C src"
rbenv install $UD_RUBY_VERSION # rbenv intall -l to see all versions FIXME: rbenv not in PATH
rbenv global $UD_RUBY_VERSION # FIXME: rbenv not in PATH


echo "Installing and configuring Elm..."
yarn global install elm
# TODO - update the list of used elm plugins to install here

echo "Installing fish...\n"
curl -L https://get.oh-my.fish | fish
fish -c "omf install"
