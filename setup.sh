#!/usr/bin/env bash -x
# Install fish, add to /etc/shells, sync

command -v fish &>/dev/null || brew install fish
if [ ! "$(grep fish /etc/shells)" ]; then
    for path in '/usr/local/bin/fish' '/opt/homebrew/bin/fish'; do
        if [ -x "$path" ]; then
            echo $path | sudo tee -a /etc/shells
        fi
    done
fi

# download iTerm2 integration file
curl -L https://iterm2.com/misc/fish_startup.in > ~/.iterm2_shell_integration.fish
./copy.fish
