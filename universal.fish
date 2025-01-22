#!/usr/bin/env fish
# silent intro
set --universal fish_greeting ""

fish_add_path ~/bin \
    ~/bin/google-cloud-sdk/bin \
    /usr/local/sbin \
    /opt/homebrew/bin \
    /opt/homebrew/sbin \
    /opt/homebrew/opt/curl/bin \
    /opt/homebrew/opt/openjdk/bin \
    /opt/homebrew/opt/fzf/bin

# homebrew formula bins
if command --query brew
    brew --prefix coreutils >/dev/null; and fish_add_path (brew --prefix coreutils)/libexec/gnubin
    command --query code; and set --universal --export HOMEBREW_EDITOR code
    set --universal --export HOMEBREW_NO_ENV_HINTS true
end

# make docker shut up & don't build images using macOS architecture
set --universal --export DOCKER_CLI_HINTS false
set --universal --export DOCKER_DEFAULT_PLATFORM linux/amd64
set --universal --export DOCKER_SCAN_SUGGEST false
set --universal --export EDITOR vim
