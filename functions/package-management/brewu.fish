function brewu --description "updates and upgrades brew"
    brew upgrade
    brew cleanup

    if [ "$(uname)" = "Darwin" ]; then
        brew cask upgrade

        if type -q mas
            # Update Mac App Store apps
            mas upgrade
        end
    end
end
