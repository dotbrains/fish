# Fish Configuration Structure

This document explains the directory layout and sourcing order of the Fish
shell configuration.

## Directory Layout

```text
fish/
├── README.md                 # Main documentation
├── config.fish               # Main configuration entry point
├── fish_plugins              # Fisher plugin list
├── aliases/                  # Shell aliases organized by category
│   ├── aliases.fish          # Sources all alias modules
│   ├── core.fish             # Basic shortcuts (cd, .., :q, etc.)
│   ├── filesystem.fish       # File/directory operations (ls, rm, fzy)
│   ├── git.fish              # Git-related aliases
│   ├── package-managers.fish # Package manager shortcuts (brew, npm, pip, etc.)
│   ├── system.fish           # System utilities (DNS, IP, desktop)
│   └── tools.fish            # External tools (wttr, piknik, commitizen)
├── colorscheme/              # Theme and color configurations
│   └── colorscheme.fish      # Nord/Catppuccin themes for fzf and bat
├── completions/              # Custom completion scripts
├── functions/                # Custom Fish functions (organized by category)
│   ├── git/                  # Git-related functions
│   │   ├── du.fish           # Dotfiles updater
│   │   └── emoji-log.fish    # Git emoji commit helpers
│   ├── navigation/           # Directory navigation
│   │   ├── cd.fish           # Enhanced cd with eza
│   │   └── mkd.fish          # Make directory and cd
│   ├── package-management/   # Package manager utilities
│   │   ├── brew-update.fish  # Update brew packages
│   │   ├── brewu.fish        # Brew upgrade utility
│   │   └── update.fish       # System updater
│   ├── process/              # Process management
│   │   ├── pgrep.fish        # Interactive process grep
│   │   ├── pkill.fish        # Interactive process kill
│   │   └── ppkill.fish       # Interactive SIGKILL
│   ├── system/               # System utilities
│   │   ├── change_mac.fish   # MAC address changer
│   │   ├── ip.fish           # IP address utilities
│   │   └── pubkey.fish       # Public key utilities
│   └── utilities/            # General utilities
│       ├── add_paths.fish    # PATH helper function
│       ├── e.fish            # Editor launcher
│       ├── extract.fish      # Archive extractor
│       ├── ls.fish           # Basic ls wrapper
│       ├── o.fish            # Open utility
│       ├── randpw.fish       # Random password generator
│       └── sudo.fish         # Sudo utilities
├── keybindings/              # Custom key bindings
│   └── keybindings.fish      # Ctrl+G, Ctrl+R bindings
├── plugins/                  # Fisher plugins (auto-managed)
├── variables/                # Environment variables (organized by category)
│   ├── variables.fish        # Sources all variable modules
│   ├── core.fish             # Fish shell settings (greeting, prompt)
│   ├── xdg.fish              # XDG Base Directory Specification
│   ├── path.fish             # PATH configuration and management
│   ├── version-managers.fish # pyenv, rbenv, nvm settings
│   ├── editor.fish           # Editor configuration
│   └── tools.fish            # Tool-specific settings (fzf, dotfiles)
└── docs/                     # Documentation
    ├── STRUCTURE.md          # This file
    └── CUSTOMIZATION.md      # Customization guide

```

## Sourcing Order

The `config.fish` file sources configurations in this order:

1. **Colorscheme** (`colorscheme/colorscheme.fish`)
   - Sets theme variables
   - Configures TERM
   - Sets fzf and bat colors

2. **Aliases** (`aliases/aliases.fish`)
   - Sources all alias modules from `aliases/` directory
   - Loads in alphabetical order

3. **Variables** (`variables/variables.fish`)
   - Sources all variable modules in order:
     - `core.fish` - Fish shell settings (greeting, prompt)
     - `xdg.fish` - XDG Base Directory Specification
     - `path.fish` - PATH configuration and management
     - `version-managers.fish` - pyenv, rbenv, nvm settings
     - `editor.fish` - Editor configuration
     - `tools.fish` - Tool-specific settings (fzf, dotfiles)

4. **Keybindings** (`keybindings/keybindings.fish`)
   - Sets up custom key bindings

5. **Local Configuration** (`~/.fish.local`)
   - User-specific overrides (optional)

6. **External Tools**
   - Homebrew initialization
   - Fisher (plugin manager)
   - thefuck (command corrector)
   - zoxide (smart cd)
   - starship (prompt)

7. **Session Setup**
   - Clears screen
   - Optional tmux startup

## Functions

Fish automatically loads functions from the `functions/` directory on-demand,
including functions in subdirectories. Functions are lazy-loaded when first
called, which improves shell startup time.

You don't need to explicitly source function files - Fish handles this
automatically. The functions are organized into subdirectories by category for
better maintainability:

- `git/` - Git and version control functions
- `navigation/` - Directory navigation helpers
- `package-management/` - Package manager utilities
- `process/` - Process management functions
- `system/` - System and network utilities
- `utilities/` - General-purpose utilities

## Aliases vs Functions

- **Aliases**: Simple command shortcuts and replacements
- **Functions**: More complex logic, parameter handling, control flow

If your alias needs conditionals, loops, or multiple commands, it should be a function.

## Adding New Configurations

See [CUSTOMIZATION.md](CUSTOMIZATION.md) for instructions on adding your own
aliases, functions, and configurations.
