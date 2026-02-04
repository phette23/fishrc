#!/usr/bin/env fish
set --local config ~/.config/fish/
rsync --archive --delete --progress --verbose config.fish inc $config
rsync --archive --delete --progress --verbose functions/* $config/functions
exec fish
