# fish variables

set fish_greeting ""

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# NOTE: There is probably a sexier nicer way to do this, but until I figure that out I am manually unset PATH
set -gx PATH

# Ensure we start with the system default PATH
set -gx DEFAULT_SYSTEM_PATHS /usr/local/bin /usr/bin /bin /usr/sbin /sbin

# Sets necessary PATH defaults
set -gx DEFAULT_PATHS $HOME/.local/bin $HOME/set-me-up $HOME/set-me-up/set-me-up-installer /opt/homebrew/bin $HOME/.local/bin/tmux-session $HOME/.local/bin/etcher-cli $HOME/.fig/bin $HOME/go $HOME/go/bin

# Linux-specific PATH additions
set -gx LINUX_PATHS /home/linuxbrew/.linuxbrew/bin /snap/bin

# Reset PATH to default system paths
set -gx PATH $DEFAULT_SYSTEM_PATHS

# Function to add paths to PATH if they exist and are not already in PATH
function add_paths
    for path in $argv
        if test -d $path
            if not contains $path $PATH
                set -a PATH $path
            end
        end
    end
end

# Add default paths
add_paths $DEFAULT_PATHS

# Add Linux-specific paths if on Linux
if string match -r '^linux-gnu' (uname -s)
    add_paths $LINUX_PATHS
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Ruby configurations
# Adds "GEMS_PATH" to "$PATH"
# Fixes "I INSTALLED GEMS WITH --user-install AND THEIR COMMANDS ARE NOT AVAILABLE"
# see: https://guides.rubygems.org/faqs/#user-install
if type -q gem
	if test -d (gem environment gemdir)/bin
		set -gx PATH $PATH (gem environment gemdir)/bin
	end
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Dotfiles directory
set DOTFILES $HOME/"set-me-up"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Which modules would you like to load? (modules can be found in ~/.tackle/modules/*)
# Custom modules may be added to ~/.tacklebox/modules/
# Example format: set tacklebox_modules virtualfish virtualhooks

# Which plugins would you like to enable? (plugins can be found in ~/.tackle/plugins/*)
# Custom plugins may be added to ~/.tacklebox/plugins/
# Example format: set tacklebox_plugins python extract

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Change spacefish char
# see: https://spacefish.matchai.me/docs/Options.html#char
set SPACEFISH_CHAR_SYMBOL "\$"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if type -q bat
    set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
end

set -g FZF_LEGACY_KEYBINDINGS 0

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Configure Neovim as default editor

set EDITOR "nvim"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Abbreviate the current working directory in the prompt to show only the first character of each directory
set -g fish_prompt_pwd_dir_length 1