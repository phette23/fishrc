function mkd -d 'Create a new directory and enter it' --wraps=mkdir
    mkdir -p $argv
    cd $argv
end
