function v -d 'Vim alias'
    if [ (count $argv) -eq 0 ]
        vim .
    else
        vim $argv
    end
end
