#!/usr/bin/env fish
# silent intro
set --universal fish_greeting ""

set --local paths ~/bin /usr/local/bin /usr/local/sbin
set --local gnubin (brew --prefix coreutils)/libexec/gnubin
[ -d $gnubin ]; and set --local paths $paths $gnubin

set --universal fish_user_paths $paths
