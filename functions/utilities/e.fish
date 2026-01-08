function e --description "Open editor at a specific path or current path"
    # Check if path is provided
    if [ -z $argv[1] ]
        $EDITOR -- # open editor at current path
        return 0
    end

    # Check if the path exists
    if not test -d $argv[1]
        echo "($argv[1]) does not exist"
        return 1
    end

    # - - - - - - - - - - - - - - - - - - - - - - - -

    cd $argv[1] # cd to the path
    $EDITOR -- # open editor at the path
end
