#!/usr/bin/env bash
# Install fish, add to /etc/shells, sync

brew install fish
echo '/usr/local/bin/fish' | sudo tee -a /etc/shells

# install fisherman plugin manager (this automatically adds "fisher" tap)
brew install bbatsche/fisher/fisherman
# install plugins
fisher add edc/bass jethrokuan/z

# download iTerm2 integration file
curl -L https://iterm2.com/misc/fish_startup.in > ~/.iterm2_shell_integration.fish
./copy.fish
