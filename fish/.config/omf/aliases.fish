## Aliases

# Display management
alias xrandxtop = "xrandr --output DP1 --mode 1920x1080
--above  eDP1 --primary --mode 1920x1080"
alias xrandxright = "xrandr --output DP1 --mode 1920x1080
--right-of eDP1 --primary --mode 1920x1080"
alias xrandxleft = "xrandr --output DP1 --mode 1920x1080
--left-of eDP1 --primary --mode 1920x1080"
# Development
alias vim="nvim -p"
alias bi="bundle install"
alias mms="bundle exec middleman server"
alias mmb="bundle exec middleman build"
alias mmd="bundle exec middleman deploy"
alias nix-holo="nix-shell https://holochain.love"
alias leap="cd ~/code/holochain/learning-pathways/"
