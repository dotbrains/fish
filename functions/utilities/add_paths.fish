function add_paths --description "Add paths to PATH if they exist and are not already in PATH"
    for path in $argv
        if test -d $path
            if not contains $path $PATH
                set -a PATH $path
            end
        end
    end
end
