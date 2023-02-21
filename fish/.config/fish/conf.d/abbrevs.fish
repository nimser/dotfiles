# Development
abbr --add pn pnpm
abbr --add vim nvim -p
# Distrobox
abbr --add dbxex --set-cursor "distrobox-export --bin /usr/sbin/% --export-path ~/.local/distrobox/bin"
# Git
abbr --add gst git status
abbr --add gita git add
abbr --add gaa git add -A
abbr --add gci git commit
abbr --add gcim --set-cursor "git commit -m '%'"
abbr --add gaci --set-cursor "git add -A;git commit -m '%'"
abbr --add gcia git commit --amend --no-edit
abbr --add gciam --set-cursor "git commit --amend -m '%'"
abbr --add gpo git push origin
abbr --add glg git lg
abbr --add gco git checkout
abbr --add gbr git branch
# Shortcuts
abbr --add eabbr nvim -p ~/.config/fish/conf.d/abbrevs.fish  
# Display / output
abbr --add xrt --set-cursor "xrandr --output HDMI-1% --above eDP-1 --primary"
abbr --add xrb --set-cursor "xrandr --output HDMI-1% --below eDP-1 --primary"
abbr --add xrl --set-cursor "xrandr --output HDMI-1% --left-of eDP-1 --primary"
abbr --add xrr --set-cursor "xrandr --output HDMI-1% --right-of eDP-1 --primary"
abbr --add xrlist xrandr --listmonitors

