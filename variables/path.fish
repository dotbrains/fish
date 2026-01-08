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

# Add default paths (using add_paths function from functions/utilities/)
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
