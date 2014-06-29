function sp -d 'Open sublime project in current dir'
    if test -f *.sublime-project
        subl *.sublime-project
    else
        return 1
    end
end
