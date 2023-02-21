# Development
abbr --add pn pnpm
abbr --add vim nvim -p
# Distrobox
abbr --add dbxex --set-cursor "distrobox-export --bin /usr/sbin/% --export-path ~/.local/distrobox/bin"
# Git
abbr --add gst git status
abbr --add gci git commit
abbr --add gcim --set-cursor "git commit -m '%'"
abbr --add gaa git add -A
abbr --add gita git add
abbr --add gaci --set-cursor "git add -A;git commit -m '%'"
abbr --add gcia git commit --amend --no-edit
abbr --add gciam --set-cursor "git commit --amend -m '%'"
abbr --add gco git checkout
abbr --add gbr git branch
# Display / output
abbr --add xrt --set-cursor "xrandr --output HDMI-1% --above eDP-1 --primary"
abbr --add xrb --set-cursor "xrandr --output HDMI-1% --below eDP-1 --primary"
abbr --add xrl --set-cursor "xrandr --output HDMI-1% --left-of eDP-1 --primary"
abbr --add xrr --set-cursor "xrandr --output HDMI-1% --right-of eDP-1 --primary"
abbr --add xrlist xrandr --listmonitors

