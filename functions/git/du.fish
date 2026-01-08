function du --description "Updates the dotfiles directory"
    if test -d $DOTFILES
        eval $DOTFILES/smu --selfupdate
    else
        echo "($DOTFILES) does not exist"
    end
end
