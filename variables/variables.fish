# Variables - Load all variable modules
#
# This file sources all modular variable files from the variables/ directory.
# Each module contains related environment variables and settings.

# Core Fish shell settings (greeting, prompt)
source "$HOME/.config/fish/variables/core.fish"

# XDG Base Directory Specification
source "$HOME/.config/fish/variables/xdg.fish"

# PATH configuration and management
source "$HOME/.config/fish/variables/path.fish"

# Version manager environment variables (pyenv, rbenv, nvm)
source "$HOME/.config/fish/variables/version-managers.fish"

# Editor configuration
source "$HOME/.config/fish/variables/editor.fish"

# Tool-specific configuration (dotfiles, fzf)
source "$HOME/.config/fish/variables/tools.fish"
