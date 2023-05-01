set -gx GPGID "0x03BC4AD253B82986"
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -gx GPG_TTY (tty)
gpgconf --launch gpg-agent
