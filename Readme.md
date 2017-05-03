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
i3-wm i3status i3lock
ttf-hack
nodm
stow
rxvt-unicode
nvim
Configure
---------
user: clone `dotfiles` rep and `stow` all relevant conf
root: `stow` all root conf from `dotfiles`
ssh:
- copy and decrypt key from backup
- configure gpg as the ssh agent and enable the systemctl service + enable the pin-entry mode
fonts: make sure Hack and Font-Awesome are installed


File management
===============

I use [stow](http://www.gnu.org/software/stow/) to install files present in this repository. You can use it to choose what you'd like to pick for my configuration by doing for example `stow nvim`


Services I disable under low memory conditions (reenable as needed)
==============================================
- haveged: an enthropy generator useful for ensuring cryptographic apps can work properly (warning: could impact daily use of encrypted apps on the web?)
- upower: a middleware to monitor power usage 
