function cd --description "auto eza for each cd"
    if type -q eza
        if [ -n $argv[1] ]
            builtin cd $argv[1]
            and eza
        else
            builtin cd ~
            and eza
        end
    else
        if [ -n $argv[1] ]
            builtin cd $argv[1]
        else
            builtin cd ~
        end
    end
end
