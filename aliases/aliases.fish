# Aliases - Load all alias modules
#
# This file sources all modular alias files from the aliases/ directory.
# Each module contains related aliases organized by category.

# Core shortcuts (cd, exit, clear, etc.)
source "$HOME/.config/fish/aliases/core.fish"

# File and directory operations (ls, rm, fzy)
source "$HOME/.config/fish/aliases/filesystem.fish"

# Git-related aliases
source "$HOME/.config/fish/aliases/git.fish"

# Package manager shortcuts (brew, npm, pip, etc.)
source "$HOME/.config/fish/aliases/package-managers.fish"

# System utilities (DNS, IP, desktop)
source "$HOME/.config/fish/aliases/system.fish"

# External tools (wttr, piknik, commitizen)
source "$HOME/.config/fish/aliases/tools.fish"
