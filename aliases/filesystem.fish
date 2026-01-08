# Filesystem aliases - File and directory operations

# Better `rm`

# Option 1: `rip` - a safer and more user-friendly alternative to 'rm'
# see: https://github.com/nivekuil/rip

if type -q rip
    alias rm "rip"
end

# Option 2: `trash` - safer alternative to 'rm'
# see: https://github.com/andreafrancia/trash-cli

if type -q trash
    alias rm "trash"
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# 'ls' aliases

if type -q eza
    alias ls "eza"

    # List all files colorized in long format
    alias l "eza -l"
end

if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

# List only directories
alias lsd "ls -lF --color | grep --color=never '^d'"
# List only hidden files
alias lsh "ls -ld .?*"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# 'fzy' aliases

if type -q fzy
    alias fzyf "find . -type f | fzy"
    alias fzyd "find . -type d | fzy"
end
