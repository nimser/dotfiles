# edited from original /home/owner/.config/fish/functions/la.fish
function la --wraps ls --description "List contents of directory, including hidden files in directory using long format, newest last"
    ls -lAhrt $argv
end
