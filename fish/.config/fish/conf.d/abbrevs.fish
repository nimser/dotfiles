# Override reboot
abbr --add reboot sudo shutdown -r now
abbr --add powerdown sudo shutdown now
# Development
abbr --add dob docker build
abbr --add dor docker run -dp 8080:80 
abbr --add dop docker ps 
abbr --add dok docker kill
abbr --add pn pnpm
abbr --add pni pnpm install
abbr --add pna pnpm add
abbr --add pnad "pnpm add --save-dev"
abbr --add pns pnpm run setup
abbr --add pnm pnpm run migrate
abbr --add pnd pnpm run dev 
abbr --add pnl pnpm run lint
abbr --add pnf pnpm run fix
abbr --add pnt pnpm run test 
abbr --add pcr --set-cursor "pnpm create vite % --template react"
abbr --add pcv --set-cursor "pnpm create vite %"
abbr --add vim nvim -p
# Distrobox
abbr --add dbxex --set-cursor "distrobox-export --bin /usr/sbin/% --export-path ~/.local/distrobox/bin"
# Git
abbr --add gsm git switch main
abbr --add gsd git switch dev
abbr --add gst git status
abbr --add ga git add
abbr --add gaa git add -A
abbr --add gcl git clone
abbr --add gci --set-cursor "git commit -m '%'"
abbr --add gaci --set-cursor "git add -A;git commit -m '%'"
abbr --add gcia --set-cursor "git commit --amend -m '%'"
abbr --add gacia --set-cursor "git add -A;git commit --amend -m '%'"
abbr --add gciane git commit --amend --no-edit
abbr --add gaciane "git add -A;git commit --amend --no-edit"
abbr --add gpo git push origin
abbr --add glg git lg
abbr --add gstash git stash
# pathspec used here. Usage info: https://git-scm.com/docs/gitglossary#Documentation/gitglossary.txt-aiddefpathspecapathspec
abbr --add gdi --set-cursor "git diff -- % ':(exclude)pnpm-lock.yaml' ':(exclude)package-lock.json'"
abbr --add gco git checkout
abbr --add gsw git switch
abbr --add gsc --set-cursor "git switch -c '%'"
abbr --add gbr git branch
# RipGrep
abbr --add rg --set-cursor "rg --hidden --follow % --glob '*'"
abbr --add rgf --set-cursor "rg --hidden --follow --files-with-matches % --glob '*'"
# Shortcuts
abbr --add eabbr nvim -p ~/.config/fish/conf.d/abbrevs.fish  
# Display / output
abbr --add xra xrandr --auto
abbr --add xrt --set-cursor "xrandr --output $SECOND_MONITOR --mode $OUTPUT_RESOLUTION% --above $FIRST_MONITOR --primary"
abbr --add xrb --set-cursor "xrandr --output $SECOND_MONITOR --mode $OUTPUT_RESOLUTION% --below $FIRST_MONITOR --primary"
abbr --add xrl --set-cursor "xrandr --output $SECOND_MONITOR --mode $OUTPUT_RESOLUTION% --left-of $FIRST_MONITOR --primary"
abbr --add xrr --set-cursor "xrandr --output $SECOND_MONITOR --mode $OUTPUT_RESOLUTION% --right-of $FIRST_MONITOR --primary"
abbr --add xrlist xrandr --listmonitors
# servers
abbr --add sshwild ssh ubuntu@151.80.149.28
# torrents
abbr --add tsm transmission-daemon
abbr --add trl transmission-remote --list
abbr --add trt transmission-remote --torrent
abbr --add tra --set-cursor "transmission-remote --add % --download-dir ~/Videos/Torrent"

