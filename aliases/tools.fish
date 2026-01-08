# External tools aliases

# `wttr` alias

alias wttr "curl wttr.in"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# piknik - Copy/paste anything over the network!
# see: https://github.com/jedisct1/piknik#suggested-shell-aliases

if type -q piknik
    # pkc : read the content to copy to the clipboard from STDIN
    alias pkc "piknik -copy"

    # pkp : paste the clipboard content
    alias pkp "piknik -paste"

    # pkm : move the clipboard content
    alias pkm "piknik -move"

    # pkz : delete the clipboard content
    alias pkz "piknik -copy < /dev/null"

    # pkpr : extract clipboard content sent using the pkfr command
    alias pkpr "piknik -paste | tar xzhpvf -"
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# `cz` commitizen - Simple commit conventions for internet citizens.
# see: https://commitizen.github.io/cz-cli/

if type -q npx
    alias cz "npx cz"
end
