# SSH configuration

# Route ssh-agent traffic to the 1Password agent on macOS so git signing
# and `ssh-add -L` see the keys 1Password manages.
if test (uname) = "Darwin"
    set -l onepassword_agent "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    if test -S "$onepassword_agent"
        set -gx SSH_AUTH_SOCK "$onepassword_agent"
    end
end
