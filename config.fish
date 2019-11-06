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

# python virtualfish
eval (python3 -m virtualfish 2> /dev/null)
# pipenv completion (only one of these 2 will be used but support both)
command -v pipenv >/dev/null; and eval (pipenv --completion)

# iTerm2 integration
[ -e ~/.iterm2_shell_integration.fish ]; and source ~/.iterm2_shell_integration.fish
