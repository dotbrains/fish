# System aliases

# Lock screen.

# Check operating system type
switch (uname)
case Darwin
    # MacOS alias
    alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

case Linux
    # Check for gnome-screensaver-command
    if type -q gnome-screensaver-command
        alias afk='gnome-screensaver-command -l'
    # Check for dm-tool
    else if type -q dm-tool
        alias afk='dm-tool lock'
    end
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Clear DNS cache

switch (uname)
case Darwin
    alias clear-dns-cache='sudo dscacheutil -flushcache; and sudo killall -HUP mDNSResponder'

case Linux
    # Check for systemd-resolved
    if systemctl is-active --quiet systemd-resolved
        alias clear-dns-cache='sudo systemd-resolve --flush-caches'

    # Check for nscd
    else if type -q nscd
        alias clear-dns-cache='sudo nscd -i hosts'

    # Check for dnsmasq
    else if type -q dnsmasq
        alias clear-dns-cache='sudo /etc/init.d/dnsmasq restart'
    end
end


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Hide/Show desktop icons.

# Hide desktop icons
switch (uname)
case Darwin
    alias hide-desktop-icons='defaults write com.apple.finder CreateDesktop -bool false; and killall Finder'

case Linux
    # For GNOME
    alias hide-desktop-icons='gsettings set org.gnome.desktop.background show-desktop-icons false'
end

# Show desktop icons
switch (uname)
case Darwin
    alias show-desktop-icons='defaults write com.apple.finder CreateDesktop -bool true; and killall Finder'

case Linux
    # For GNOME
    alias show-desktop-icons='gsettings set org.gnome.desktop.background show-desktop-icons true'
end


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Get local IP.

alias lip "ipconfig getifaddr en0"

# Get external IP.

alias xip "curl -s checkip.dyndns.org | grep -Eo \"[0-9\\.]+\""
