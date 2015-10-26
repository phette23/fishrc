#!/usr/bin/env fish
# silent intro
set --universal fish_greeting ""
set --universal --export NVM_DIR ~/.nvm

set --local paths /usr/local/pear/bin ~/bin /usr/local/bin /usr/local/sbin
set --local gnubin (brew --prefix coreutils)/libexec/gnubin
[ -d $gnubin ]; and set --local paths $paths $gnubin

set --universal fish_user_paths $paths
