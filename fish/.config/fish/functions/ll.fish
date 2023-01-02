# edited from original /home/owner/.config/fish/functions/ll.fish
function ll --wraps ls --description "List contents of directory using long format, newest last"
    ls -lhrt $argv
end
