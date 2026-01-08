# PATH configuration

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

# Helper function to add paths (defined inline since functions aren't loaded yet)
function __add_paths_inline
    for path in $argv
        if test -d $path
            if not contains $path $PATH
                set -a PATH $path
            end
        end
    end
end

# Add default paths
__add_paths_inline $DEFAULT_PATHS

# Add Linux-specific paths if on Linux
if string match -r '^linux-gnu' (uname -s)
    __add_paths_inline $LINUX_PATHS
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
