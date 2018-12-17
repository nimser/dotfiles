System information
==================

- Linux flavor: Arch Linux
- Architecture: x86 and aarch64
- Window manager: [i3wm](https://github.com/i3/i3)
- Terminal emulator: [alacritty](https://github.com/jwilm/alacritty)
- Text editor: [Neovim](https://github.com/neovim/neovim)

Elementary setup
================

1. Launch the aui script from the cloned repositiory

`sh _system/scripts/step1_aui_lilo.sh`

2. Install additional system tools

`sh _system/scripts/step2_system_extras.sh`

3. Checks things are working properly

(TODO: to be converted in a script)

- Chromium/Firefox is configured to store its cache in RAM
- ZRAM is configured
- [Avahi](https://wiki.archlinux.org/index.php/avahi is used for zero-configuration networking


Manual configuration (optional)
---------
root:
- `sudo stow -t /root` all root conf from `dotfiles`
- `sudo ln -s /home/{user}/.ssh .`
time:
- `timedatectl status` to ensure NTP is enabled
- `timedatectl list-timezone` then `timedatectl set-timezone Zone/SubZone` to set the proper time
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
dhcpcd:
- copy file from stow/_system to allow faster dhcp leases
ssh: copy and decrypt key from backup
gpg: copy and decrypt key from backup
wifi:
- copy/decrypt/rename `wpa_supplicant-wlan0.conf.enc` to `/etc/wpa_supplicant/`
- enable the systemd service
others:
- make boot verbose by removing the `quiet` boot param (grub: in /etc/default/grub)


File management
===============

I use [stow](http://www.gnu.org/software/stow/) to install files present in this repository. You can use it to choose what you'd like to pick for my configuration by doing for example `stow nvim`


Services I disable under low memory conditions (reenable as needed)
==============================================
- haveged: an enthropy generator useful for ensuring cryptographic apps can work properly (warning: could impact daily use of encrypted apps on the web?)
- upower: a middleware to monitor power usage
