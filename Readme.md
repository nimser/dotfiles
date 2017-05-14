System information
==================

- Linux flavor: [Arch Linux ARM](https://archlinuxarm.org/)
- Window manager: [i3wm](https://github.com/i3/i3)
- Terminal emulator: [rxvt-unicode](https://archlinuxarm.org/)
- Text editor: [Neovim](https://github.com/neovim/neovim)

Do this first
================
Install
-------
system:
- fish
- i3-wm i3blocks i3lock dmenu
- ttf-hack
- nodm
- stow
- rxvt-unicode
- nvim
- xsel (clipboard)
dev:
- yarn
- mongo mongodb-tools
- sbt
- jdk8-openjdk
- ack
comms:
- maim (captures d'écran)
others:
- keybase keybase-git[aur]
Configure
---------
time:
- `timedatectl status` to ensure NTP is enabled
- `timedatectl list-timezone` then `timedatectl set-timezone Zone/SubZone` to set the proper time
user: clone `dotfiles` rep and `stow` all relevant conf
nodm:
- ensure xinit config is set
- (necessary for pulseaudio to work) ensure a /etc/pam.d/nodm exists containing the following:
```
#%PAM-1.0

auth      include   system-local-login
account   include   system-local-login
password  include   system-local-login
session   include   system-local-login
```
root:
- `sudo stow -t /root` all root conf from `dotfiles`
- `sudo ln -s /home/{user}/.ssh .`
dhcpcd:
- copy file from stow/_system to allow faster dhcp leases
ssh: copy and decrypt key from backup
gpg: copy and decrypt key from backup
wifi:
- copy/decrypt/rename `wpa_supplicant-wlan0.conf.enc` to `/etc/wpa_supplicant/`
- enable the systemd service
zswap:
- add `lz4 lz4_compress` in `MODULES` in `/etc/mkinitcpio.conf`
- add `zswap.enabled=1 zswap.max_pool_percent=25 zswap.compressor=lz4` to the list of boot parameters (grub: /etc/default/grub)
- reload boot configuration (grub: `sudo grub-mkconfig -o /boot/grub/grub.cfg`)
fonts: make sure Hack and Font-Awesome are installed
others:
- make boot verbose by removing the `quiet` boot param (grub: in /etc/default/grub)
fish:
- stow fish
- run fish_config and pick the proper theme / shell prompt
- mkdir -p ~/.local/bin
- install oh-my-fish

ruby:
- git clone https://github.com/rbenv/rbenv.git ~/.rbenv
- git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
- rbenv install -l


File management
===============

I use [stow](http://www.gnu.org/software/stow/) to install files present in this repository. You can use it to choose what you'd like to pick for my configuration by doing for example `stow nvim`


Services I disable under low memory conditions (reenable as needed)
==============================================
- haveged: an enthropy generator useful for ensuring cryptographic apps can work properly (warning: could impact daily use of encrypted apps on the web?)
- upower: a middleware to monitor power usage
