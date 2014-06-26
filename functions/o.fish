function o -d 'Open files or current dir if no args'
    if test -z $argv[1]
        open .
    else
        open $argv
    end
end
