function diff -d 'Use Git’s colored diff when available'
    hash git 2>/dev/null
    if [ $status -eq 0 ]
        git diff --no-index --color-words $argv
    else
        command diff $argv
    end
end
