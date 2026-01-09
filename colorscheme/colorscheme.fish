# fish colorscheme

# Load terminal theme using theme.sh
# see: https://github.com/lemnos/theme.sh
if type -q theme
    theme gruvbox-material-dark-medium
end

# Available themes: nord, gruvbox
# Set FISH_THEME environment variable to change (default: gruvbox)
set -q FISH_THEME; or set -g FISH_THEME gruvbox

set -g theme_color_scheme $FISH_THEME
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set -gx TERM xterm-256color

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Theme selection
switch $FISH_THEME
    case gruvbox
        # Gruvbox Dark Medium for fzf
        # see: https://github.com/morhetz/gruvbox
        set -Ux FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS '
            --color=fg:#d5c4a1,bg:#282828,hl:#fabd2f
            --color=fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
            --color=info:#83a598,prompt:#fb4934,pointer:#b8bb26
            --color=marker:#8ec07c,spinner:#d3869b,header:#8ec07c'
        
        # Gruvbox for Bat
        set BAT_THEME "gruvbox-dark"
    
    case nord
        # Nord for fzf
        # see: https://github.com/ianchesal/nord-fzf
        set -Ux FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS '
            --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
            --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
            --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
            --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
        
        # Nord for Bat
        set BAT_THEME "Nord"
    
    case '*'
        echo "Warning: Theme '$FISH_THEME' not found. Available themes: nord, gruvbox"
        echo "Defaulting to gruvbox..."
        set -g FISH_THEME gruvbox
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Catppuccin for fzf (Macchiato)
# see: https://github.com/catppuccin/fzf
# set -Ux FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS "\
# 	--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
# 	--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
# 	--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

# Catppuccin for Bat (Macchiato)
# see: https://github.com/catppuccin/bat
# set BAT_THEME "Catppuccin-macchiato"