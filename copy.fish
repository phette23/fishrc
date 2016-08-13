#!/usr/bin/env fish
set --local config ~/.config/fish/
cp -vr config.fish inc $config
cp -v functions/* $config/functions
