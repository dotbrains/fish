# Tool-specific configuration

# Dotfiles directory
set DOTFILES $HOME/"set-me-up"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# FZF configuration

if type -q bat
    set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
end

set -g FZF_LEGACY_KEYBINDINGS 0
