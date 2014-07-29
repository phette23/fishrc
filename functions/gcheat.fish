function gcheat -d 'Git cheat sheet'
    __cheat_heading 'git cheatsheet'

    __cheat_ln 'g a -p\t\t' 'stage piecemeal "hunks" of a file'
    __cheat_ln 'g d\t\t' 'diff between latest commit & current state'
    __cheat_ln 'g di $N\t\t' 'diff betw N commits ago & current state'
    __cheat_ln 'g go X\t\t' "goto branch X, create if doesn't exist"
    __cheat_ln 'g reset $HASH\t' 'revert to commit HASH but keep changes in working dir'
                echo -e '\t\tadd --hard flag to erase changes'
    __cheat_ln 'g checkout -- <file> ' 'unstage changes to <file>'
    __cheat_ln 'g push origin $BRANCH ' 'push BRANCH to GitHub (remote)'
    __cheat_ln 'g log -p\t' 'see diffs of changed files in log'

    # note about Git Flight Rules
    echo
    echo -n 'see also: '
    set_color FF0
    echo 'https://github.com/k88hudson/git-flight-rules'
    set_color normal
    echo '(run gcheat gfr to open that URL)'

    if [ $argv[1] -a $argv[1] = "gfr" ]
        o 'https://github.com/k88hudson/git-flight-rules'
    end
end
