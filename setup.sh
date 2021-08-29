#!/usr/bin/env bash
# Install fish, add to /etc/shells, sync

command -v fish &>/dev/null || brew install fish
grep fish /etc/shells >/dev/null || echo '/usr/local/bin/fish' | sudo tee -a /etc/shells

# install fisherman plugin manager (this automatically adds "fisher" tap)
brew install bbatsche/fisher/fisherman
# install plugins
fisher add jethrokuan/z

# download iTerm2 integration file
curl -L https://iterm2.com/misc/fish_startup.in > ~/.iterm2_shell_integration.fish
./copy.fish
