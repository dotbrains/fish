function pgrep --description "pgrep a process interactively"
    ps aux | peco | awk "{ print $2 }"
end
