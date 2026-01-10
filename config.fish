# ==============================================================================
# Core Configuration
# ==============================================================================

# Load colorscheme and theme settings
source "$HOME/.config/fish/colorscheme/colorscheme.fish"

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

# Initialize zoxide (smart cd)
# see: https://github.com/ajeetdsouza/zoxide
if type -q zoxide
    zoxide init fish | source
end

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
