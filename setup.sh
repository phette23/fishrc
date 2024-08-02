#!/usr/bin/env bash
# Install fish, add to /etc/shells, sync
set -x

command -v fish &>/dev/null || brew install fish
if grep -q fish /etc/shells; then
    for path in '/usr/local/bin/fish' '/opt/homebrew/bin/fish'; do
        if [ -x "$path" ]; then
            echo $path | sudo tee -a /etc/shells
        fi
    done
fi

# download iTerm2 integration file
curl -L https://iterm2.com/misc/fish_startup.in > ~/.iterm2_shell_integration.fish
./copy.fish
