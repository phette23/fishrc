#!/usr/bin/env fish
# silent intro
set --universal fish_greeting ""

set --local paths ~/bin /usr/local/bin
[ -d /usr/local/sbin ]; and set --local paths $paths /usr/local/sbin

# homebrew formula bins
if command -v brew >/dev/null
    brew --prefix python >/dev/null; and set paths $paths (brew --prefix python)/bin
    brew --prefix coreutils >/dev/null; and set --local paths $paths (brew --prefix coreutils)/libexec/gnubin
end

set --universal fish_user_paths $paths
