#!/usr/bin/env fish
# silent intro
set --universal fish_greeting ""

# make the user path universal (persistent)
fish_add_path -U
fish_add_path ~/bin \
    /usr/local/sbin \
    /opt/homebrew/bin
set --universal --export PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

# homebrew formula bins
if command --query brew
    brew --prefix coreutils >/dev/null; and fish_add_path (brew --prefix coreutils)/libexec/gnubin
    set --universal --export HOMEBREW_EDITOR code
    set --universal --export HOMEBREW_NO_ENV_HINTS true
end

# don't build docker images using macos architecture
set --universal --export DOCKER_DEFAULT_PLATFORM linux/amd64
set --universal --export DOCKER_SCAN_SUGGEST false
set --universal --export EDITOR vim
