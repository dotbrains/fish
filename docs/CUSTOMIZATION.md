# Customization Guide

This guide explains how to add your own custom configurations to Fish.

## Adding Aliases

### Simple Aliases

Add simple aliases to the appropriate file in the `aliases/` directory:

- `aliases/core.fish` - Basic shortcuts
- `aliases/filesystem.fish` - File operations
- `aliases/git.fish` - Git commands
- `aliases/package-managers.fish` - Package managers
- `aliases/system.fish` - System utilities
- `aliases/tools.fish` - External tools

Example:

```fish
# In aliases/git.fish
alias gs "git status"
alias gc "git commit"
```

### Conditional Aliases

For aliases that depend on a command being available, use `type -q`:

```fish
if type -q exa
    alias ls "exa"
end
```

## Adding Functions

Functions should be placed in separate files in the `functions/`
directory or its subdirectories. Choose the appropriate subdirectory
based on the function's purpose:

- `functions/git/` - Git and version control
- `functions/navigation/` - Directory navigation
- `functions/package-management/` - Package manager utilities
- `functions/process/` - Process management
- `functions/system/` - System and network utilities
- `functions/utilities/` - General-purpose utilities

### Creating a Function

Create a new file in the appropriate subdirectory, e.g., `functions/utilities/myfunction.fish`:

```fish
function myfunction --description "What my function does"
    # Function body
    echo "Hello, $argv[1]"
end
```

Fish will automatically load this function when you first call it.

### Function Best Practices

1. **One function per file** - File name should match function name
2. **Add descriptions** - Use `--description` flag
3. **Handle arguments** - Use `$argv[1]`, `$argv[2]`, etc.
4. **Check dependencies** - Use `type -q command` before using external commands
5. **Provide help** - Consider adding a `--help` option

Example:

```fish
function myfunction --description "Example function with argument handling"
    # Show help
    if test "$argv[1]" = "--help"
        echo "Usage: myfunction <name>"
        return 0
    end
    
    # Check if argument provided
    if test -z "$argv[1]"
        echo "Error: name required"
        return 1
    end
    
    echo "Hello, $argv[1]!"
end
```

## Adding Environment Variables

Add environment variables to the appropriate file in the `variables/` directory:

- `variables/core.fish` - Fish shell settings (greeting, prompt)
- `variables/xdg.fish` - XDG Base Directory paths
- `variables/path.fish` - PATH configuration
- `variables/version-managers.fish` - pyenv, rbenv, nvm settings
- `variables/editor.fish` - Editor configuration
- `variables/tools.fish` - Tool-specific settings (fzf, dotfiles, etc.)

Example:

```fish
# In variables/tools.fish
set -x MY_TOOL_CONFIG "value"

# In variables/path.fish (use add_paths function)
add_paths /my/custom/path
```

### Variable Scopes

- `set -x` - Export variable (like `export` in bash)
- `set -g` - Global scope
- `set -l` - Local scope (function-only)
- `set -U` - Universal (persists across sessions)

## Adding Key Bindings

Add key bindings to `keybindings/keybindings.fish`:

```fish
# Bind a key to a command
bind \cx 'commandline -i "some text"'

# Bind a key to a function
function my_keybinding_func
    echo "Key pressed!"
end

bind \cy my_keybinding_func
```

Common key codes:

- `\cx` - Ctrl+X
- `\e` - Alt/Option
- `\e[A` - Up arrow
- `\e[B` - Down arrow

## Local Configuration

For machine-specific configurations that you don't want to commit to the
repository, create `~/.fish.local`:

```fish
# ~/.fish.local
# This file is sourced by config.fish but not tracked in git

set -x MY_SECRET_TOKEN "secret"
alias mylocalalias "some command"
```

This file is already referenced in `config.fish` and will be sourced if
it exists.

## Plugin Management

This configuration uses [Fisher](https://github.com/jorgebucaran/fisher)
for plugin management.

### Installing Plugins

```fish
fisher install owner/repo
```

### Listing Plugins

```fish
fisher list
```

### Removing Plugins

```fish
fisher remove owner/repo
```

Installed plugins are tracked in `fish_plugins` and automatically loaded.

## Customizing Colors

Edit `colorscheme/colorscheme.fish` to change:

- Fish theme settings
- fzf colors (Nord or Catppuccin themes provided)
- bat theme

## Testing Your Changes

After making changes, reload your configuration:

```fish
source ~/.config/fish/config.fish
```

Or restart your shell.

To test if a function is loaded:

```fish
functions myfunction
```

To see where a function is defined:

```fish
type myfunction
```

## Troubleshooting

### Function Not Found

Make sure:

1. File name matches function name: `myfunction.fish` contains
   `function myfunction`
2. File is in `functions/` directory or a subdirectory
   (e.g., `functions/utilities/`)
3. File has correct syntax (run
   `fish -n functions/utilities/myfunction.fish` to check)
4. Fish can find functions in subdirectories automatically - no special
   configuration needed

### Configuration Not Loading

Check for syntax errors:

```fish
fish -n config.fish
```

Enable debug mode:

```fish
fish -d 4
```

### Alias Not Working

Make sure:

1. Alias is defined in the correct file
2. `aliases/aliases.fish` sources that file
3. No function with the same name exists (functions override aliases)
