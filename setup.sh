#!/usr/bin/env bash
# Install fish, add to /etc/shells, sync

brew install fish
sudo echo /usr/local/bin/fish >> /etc/shells
npm i
grunt
