#!/usr/bin/env fish
# silent intro
set --universal fish_greeting ""

fish_add_path /usr/local/bin
[ -d ~/bin ]; and fish_add_path ~/bin
[ -d /usr/local/sbin ]; and fish_add_path /usr/local/sbin

# homebrew formula bins
if command -v brew >/dev/null
    brew --prefix coreutils >/dev/null; and fish_add_path (brew --prefix coreutils)/libexec/gnubin
end

set --universal EDITOR atom
set --universal HOMEBREW_EDITOR atom
