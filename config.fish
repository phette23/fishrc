for file in aliases prompt
    source ~/.config/fish/inc/$file.fish
end

# OS-specific customizations
if [ (uname) = 'Darwin' ]
    source ~/.config/fish/inc/mac.fish
else if [ (uname) = 'Linux' ]
    source ~/.config/fish/inc/linux.fish
end

# see https://coderwall.com/p/hmousw
set -gx RBENV_ROOT $HOME/.rbenv
. (rbenv init -|psub)

# enable perl env, see `plenv init` for instructions
if command -s plenv > /dev/null;
    status --is-interactive
    and source (plenv init -|psub)
end

# initialize node using nvm, sets version to "default" alias
bass source ~/.nvm/nvm.sh --no-use
