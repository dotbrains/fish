# fish colorscheme

set -g theme_color_scheme nord
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set -gx TERM xterm-256color

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Nord for fzf
# see: https://github.com/ianchesal/nord-fzf
set -Ux FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS '
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

# Nord for Bat
set BAT_THEME "Nord"

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