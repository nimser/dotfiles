# Override reboot
abbr --add reboot sudo shutdown -r now
# Development
abbr --add pn pnpm
abbr --add pni pnpm install
abbr --add pnd pnpm run dev 
abbr --add pnr --set-cursor "pnpm create vite % --template react"
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
abbr --add gacia "git add -A;git commit --amend --no-edit"
abbr --add gciam --set-cursor "git commit --amend -m '%'"
abbr --add gaciam --set-cursor "gat add -A;git commit --amend -m '%'"
abbr --add gpo git push origin
abbr --add glg git lg
abbr --add gco git checkout
abbr --add gbr git branch
# Shortcuts
abbr --add eabbr nvim -p ~/.config/fish/conf.d/abbrevs.fish  
# Display / output
abbr --add xrt --set-cursor "xrandr --output $SECOND_MONITOR --mode $OUTPUT_RESOLUTION% --above $FIRST_MONITOR --primary"
abbr --add xrb --set-cursor "xrandr --output $SECOND_MONITOR --mode $OUTPUT_RESOLUTION% --below $FIRST_MONITOR --primary"
abbr --add xrl --set-cursor "xrandr --output $SECOND_MONITOR --mode $OUTPUT_RESOLUTION% --left-of $FIRST_MONITOR --primary"
abbr --add xrr --set-cursor "xrandr --output $SECOND_MONITOR --mode $OUTPUT_RESOLUTION% --right-of $FIRST_MONITOR --primary"
abbr --add xrlist xrandr --listmonitors

