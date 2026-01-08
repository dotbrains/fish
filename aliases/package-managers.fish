# Package manager aliases

# Shorter commands for `Homebrew`.

if type -q brew
    alias brewd "brew doctor"
    alias brewi "brew install"
    alias brewr "brew uninstall"
    alias brews "brew search"
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Shorter commands for `Node Package Manager`

# alias n "npm" # Do not use if using 'n' for Node version control

if type -q npm
    alias npmi "npm i -g"
    alias npmr "npm uninstall"
    alias npmls "npm list -g --depth 0"
    alias npms "npm s"
    alias npmu "npm i -g npm@latest"
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Shorter commands for the `Yarn Package Manager`

if type -q yarn
    alias yr "yarn remove"
    alias ya "yarn add"
    alias yu "yarn self-update ;and yarn upgrade ;and yarn upgrade-interactive"
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Shorter commands for `pip`

if type -q pip
    alias pipi "pip install"
    alias pipr "pip uninstall"
    alias pipls "pip list"
    alias pips "pip search"
    alias pipu "sudo pip install --upgrade pip and sudo pip install --upgrade setuptools"
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Shorter commands for `pip3`

if type -q pip3
    alias pip3i "pip3 install"
    alias pip3r "pip3 uninstall"
    alias pip3ls "pip3 list"
    alias pip3s "pip3 search"
    alias pip3u "pip3 install -U pip and sudo -H pip3 install -U pip"
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Shorter commands for `Composer`

if type -q composer
    alias ci "composer install"
    alias cr "composer remove"
    alias cls "composer list"
    alias cs "composer search"
    alias cu "composer self-update"
end
