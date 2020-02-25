function fs -d 'Determine size of a file or total size of a directory'
    if du -b /dev/null &> /dev/null
        set arg -sbh
    else
        set arg -sh
    end

    if test $argv[1]
        du $arg -- $argv
    else
        du $arg .[^.]* *
    end
end
