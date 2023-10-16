for file in aliases prompt
    source ~/.config/fish/inc/$file.fish
end

# OS-specific customizations
set osname (uname)
if [ $osname = Darwin ]
    source ~/.config/fish/inc/mac.fish
else if [ $osname = Linux ]
    source ~/.config/fish/inc/linux.fish
end

# programming language version management (asdf & pyenv)
if command --query asdf
    if test -f /usr/local/opt/asdf/libexec/asdf.fish
        source /usr/local/opt/asdf/libexec/asdf.fish
    else if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
        source /opt/homebrew/opt/asdf/libexec/asdf.fish
    end
end

# initialize pyenv, see https://github.com/pyenv/pyenv#installation
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# iTerm 2 integration
[ -f ~/.iterm2_shell_integration.fish ]; and source ~/.iterm2_shell_integration.fish

# VS Code shell integration
string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)

# The next line updates PATH for the Google Cloud SDK.
[ -f '~/bin/google-cloud-sdk/path.fish.inc' ]; and source ~/bin/google-cloud-sdk/path.fish.inc

if command --query gpg
    set -gx GPG_TTY (tty)
end
