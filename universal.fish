#!/usr/bin/env fish
# silent intro
set --universal fish_greeting ""

set --local paths ~/bin /usr/local/bin /usr/local/sbin
[ -d /usr/local/opt/python@2/bin ]; and set paths $paths /usr/local/opt/python@2/bin
set --local gnubin (brew --prefix coreutils)/libexec/gnubin
[ -d $gnubin ]; and set --local paths $paths $gnubin

set --universal fish_user_paths $paths
