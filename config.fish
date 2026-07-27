# ==============================================================================
# Core Configuration
# ==============================================================================

# Load environment variables and PATH configuration (needed in all contexts)
source "$HOME/.config/fish/variables/variables.fish"

if status is-interactive
    # Load aliases (modular alias files)
    source "$HOME/.config/fish/aliases/aliases.fish"

    # Load custom key bindings
    source "$HOME/.config/fish/keybindings/keybindings.fish"

    # Load functions from subdirectories (Fish doesn't autoload from subdirs)
    for file in $HOME/.config/fish/functions/**/*.fish
        source $file
    end
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

# Load set-me-up profile before prompt initialization.
set -l smu_profile (set -q XDG_CONFIG_HOME; and echo $XDG_CONFIG_HOME; or echo $HOME/.config)/set-me-up/profile.env
if test -f "$smu_profile"
    for line in (string match -r '^export SMU_(THEME|PROMPT)=' <$smu_profile)
        set -l assignment (string replace 'export ' '' $line)
        set -l key (string split -m 1 '=' $assignment)[1]
        set -l value (string trim -c '"' (string split -m 1 '=' $assignment)[2])

        if test "$key" = "SMU_THEME"; and not set -q SMU_THEME
            set -gx SMU_THEME "$value"
        else if test "$key" = "SMU_PROMPT"; and not set -q SMU_PROMPT
            set -gx SMU_PROMPT "$value"
        end
    end
end
set -q SMU_THEME; or set -gx SMU_THEME gruvbox
set -q SMU_PROMPT; or set -gx SMU_PROMPT starship

# Initialize prompt
# see: https://starship.rs
if status is-interactive; and test "$SMU_PROMPT" = classic
    function fish_prompt
        printf '%s@%s:%s%s ' (whoami) (hostname -s) (prompt_pwd) (fish_git_prompt)
    end
else if status is-interactive; and type -q starship
	starship init fish | source
end

# Initialize Fisher plugin manager
# see: https://github.com/jorgebucaran/fisher#bootstrap-installation
if status is-interactive
    and not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Initialize thefuck (command corrector)
# see: https://github.com/nvbn/thefuck/wiki/Shell-aliases#fish
if status is-interactive
    and type -q thefuck
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
# Only in interactive shells: theme.sh writes terminal escapes to /dev/tty
if status is-interactive
    source "$HOME/.config/fish/colorscheme/colorscheme.fish"
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

# Initialize zoxide (smart cd)
# Keep this block at the very end of config.fish.
# zoxide doctor warns when initialization is not last.
# Gate on interactive shells so non-interactive invocations (e.g. tooling
# that sources config.fish per command) don't trigger the doctor warning.
# see: https://github.com/ajeetdsouza/zoxide
if status is-interactive
    and type -q zoxide
    zoxide init fish | source
end
