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
i3-wm i3blocks i3lock dmenu
ttf-hack
nodm
stow
rxvt-unicode
nvim
Configure
---------
user: clone `dotfiles` rep and `stow` all relevant conf
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


File management
===============

I use [stow](http://www.gnu.org/software/stow/) to install files present in this repository. You can use it to choose what you'd like to pick for my configuration by doing for example `stow nvim`


Services I disable under low memory conditions (reenable as needed)
==============================================
- haveged: an enthropy generator useful for ensuring cryptographic apps can work properly (warning: could impact daily use of encrypted apps on the web?)
- upower: a middleware to monitor power usage 
