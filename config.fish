for file in aliases prompt
    source ~/.config/fish/inc/$file.fish
end

# OS-specific customizations
set osname (uname)
if [ $osname = 'Darwin' ]
    source ~/.config/fish/inc/mac.fish
else if [ $osname = 'Linux' ]
    source ~/.config/fish/inc/linux.fish
end

# initialize ruby env, see https://coderwall.com/p/hmousw
if command -s rbenv > /dev/null;
    set -gx RBENV_ROOT $HOME/.rbenv
    . (rbenv init -|psub)
end

# initialize node using nvm, sets version to "default" alias
[ -d ~/.nvm ]; and bass source /usr/local/opt/nvm/nvm.sh --no-use
fn nvm > /dev/null; and nvm use default > /dev/null

# iTerm2 integration
[ -e ~/.iterm2_shell_integration.fish ]; and source ~/.iterm2_shell_integration.fish
