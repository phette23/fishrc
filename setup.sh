#!/usr/bin/env bash
# Install fish, add to /etc/shells, sync

brew install fish
echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
npm i
grunt
