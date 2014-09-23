#!/usr/bin/env fish
# silent intro
set --universal fish_greeting ""

set --local paths (npm prefix -g)/bin /usr/local/pear/bin ~/bin /usr/local/bin
set --local gnubin (brew --prefix coreutils)/libexec/gnubin
[ -d $gnubin ]; and set --local paths $paths $gnubin

set --universal fish_user_paths $paths
