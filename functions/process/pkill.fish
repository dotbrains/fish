function pkill --description "pkill a process interactively"
    ps aux | peco | awk "{ print $2 }" | xargs kill
end
