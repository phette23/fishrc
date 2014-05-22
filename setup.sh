#!/usr/bin/env bash
# Install fish, add to /etc/shells, sync

brew install fish
sudo echo /usr/local/bin/fish >> /etc/shells
fish sync.fish # @TODO is this how scripts are passed to fish?
