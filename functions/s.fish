function s -d 'Alias for subl, sublime binary'
    # If no argument is passed, open current dir
    if [ (count $argv) -eq 0 ]
        subl .
    else
        subl $argv
    end
end
