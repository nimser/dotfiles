## Aliases

# Base
alias mcd="makedir"
function mcd --description "mkdir then cd into directory"
    mkdir $argv && cd $argv
end
# Yubi
alias chub='gpg-connect-agent "scd serialno" "learn --force" /bye'
function ubenc --description "encrypt with Yubikey"
  set output $PWD/$argv[1].$(date +%s).enc
  command gpg --encrypt --armor --output $output -r $GPGID "$argv[1]" && echo "$argv[1] -> $output"
end
function ubdec --description "decrypt with Yubikey"
  set output $(echo "$argv[1]" | rev | cut -c16- | rev)
  command gpg --decrypt --output $output "$argv[1]" && echo "$argv[1] -> $output"
end
# Development
alias vim="nvim -p"
alias bi="bundle install"
alias mms="bundle exec middleman server"
alias mmb="bundle exec middleman build"
alias mmd="bundle exec middleman deploy"
alias nix-holo="nix-shell https://holochain.love"
alias leap="cd ~/code/holochain/learning-pathways/"
# Display management
alias xrandxtop="xrandr --output DP1 --mode 1920x1080 --above  eDP1 --primary --mode 1920x1080"
alias xrandxright="xrandr --output DP1 --mode 1920x1080 --right-of eDP1 --primary --mode 1920x1080"
alias xrandxleft="xrandr --output DP1 --mode 1920x1080 --left-of eDP1 --primary --mode 1920x1080"
alias rg="rg --ignore-file ~/.config/ripgrep/ignore"
