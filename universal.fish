#!/usr/bin/env fish
# silent intro
set --universal fish_greeting ""

fish_add_path /usr/local/bin
[ -d ~/bin ]; and fish_add_path ~/bin
[ -d /usr/local/sbin ]; and fish_add_path /usr/local/sbin
set --universal --export PYENV_ROOT $HOME/.pyenv
[ -d $PYENV_ROOT/bin ]; and fish_add_path $PYENV_ROOT/bin

# homebrew formula bins
if command --query brew
    brew --prefix coreutils >/dev/null; and fish_add_path (brew --prefix coreutils)/libexec/gnubin
end

set --universal --export DOCKER_SCAN_SUGGEST false
set --universal --export EDITOR vim
set --universal --export HOMEBREW_EDITOR code
