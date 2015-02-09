function s -d 'open file or cwd in Atom editor'
    # If no argument is passed, open current dir
    if [ (count $argv) -eq 0 ]
        atom .
    else
        atom $argv
    end
end
