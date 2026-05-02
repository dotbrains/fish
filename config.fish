# ==============================================================================
# Core Configuration
# ==============================================================================

# Load aliases (modular alias files)
source "$HOME/.config/fish/aliases/aliases.fish"

# Load environment variables and PATH configuration
source "$HOME/.config/fish/variables/variables.fish"

# Load custom key bindings
source "$HOME/.config/fish/keybindings/keybindings.fish"

# Load functions from subdirectories (Fish doesn't autoload from subdirs)
for file in $HOME/.config/fish/functions/**/*.fish
    source $file
end

# ==============================================================================
# Local Configuration
# ==============================================================================

# Load local machine-specific configurations (not tracked in git)
if test -f "$HOME/.fish.local"
    source "$HOME/.fish.local"
end

# ==============================================================================
# External Tool Initialization
# ==============================================================================

# Initialize Homebrew

# see: https://docs.brew.sh/Installation
if test (uname) = "Darwin" # Check if OS is macOS
    if test -f /opt/homebrew/bin/brew
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end

    if test -f /usr/local/bin/brew
        eval "$(/usr/local/bin/brew shellenv)"
    end
end

# see: https://docs.brew.sh/Homebrew-on-Linux
if test (uname) = "Linux" # Check if OS is Linux
    if test -d /home/linuxbrew/.linuxbrew
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    end
end

# Initialize starship prompt
# see: https://starship.rs
if type -q starship
	starship init fish | source
end

# Initialize Fisher plugin manager
# see: https://github.com/jorgebucaran/fisher#bootstrap-installation
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Initialize thefuck (command corrector)
# see: https://github.com/nvbn/thefuck/wiki/Shell-aliases#fish
if type -q thefuck
    thefuck --alias | source
end


# Re-activate nvm node after PATH reset
# (conf.d/nvm.fish activates node before config.fish, but path.fish resets PATH)
if set --query nvm_current_version nvm_data
    contains $nvm_data/$nvm_current_version/bin $PATH
    or set --prepend PATH $nvm_data/$nvm_current_version/bin
end

# Ensure local shim/bin precedence after external tool PATH initializers (e.g. Homebrew)
if set idx (contains -i $HOME/.local/bin $PATH)
    set -e PATH[$idx]
end
set --prepend PATH $HOME/.local/bin

# ==============================================================================
# Theme and Colorscheme
# ==============================================================================

# Load colorscheme and theme settings (after PATH is fully initialized)
source "$HOME/.config/fish/colorscheme/colorscheme.fish"

# ==============================================================================
# Session Setup
# ==============================================================================

# Clear system messages (copyright notice, login time, MOTD, etc.)
# clear

# Start tmux upon executing fish (optional, currently disabled)
# see: https://github.com/fish-shell/fish-shell/issues/4434#issuecomment-332743061
# if status is-interactive
# and not set -q TMUX
#    exec tmux
# end

# Initialize zoxide (smart cd)
# Keep this block at the very end of config.fish.
# zoxide doctor warns when initialization is not last.
# see: https://github.com/ajeetdsouza/zoxide
if type -q zoxide
    zoxide init fish | source
end
