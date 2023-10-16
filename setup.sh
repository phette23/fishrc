#!/usr/bin/env bash
# Install fish, add to /etc/shells, sync

command -v fish &>/dev/null || brew install fish
if [ ! "$(grep fish /etc/shells)" ]; then
    for dir in '/usr/local/bin/fish' '/opt/homebrew/bin/fish'; do
        if [ -x "$dir" ]; then
            echo $dir | sudo tee -a /etc/shells
        fi
    done
fi

# install fisherman plugin manager (this automatically adds "fisher" tap)
brew install bbatsche/fisher/fisherman
# install plugins
fisher add jethrokuan/z

# download iTerm2 integration file
curl -L https://iterm2.com/misc/fish_startup.in > ~/.iterm2_shell_integration.fish
./copy.fish
