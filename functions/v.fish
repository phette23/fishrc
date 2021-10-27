function v -d 'Vim alias' --wraps=vim
    if [ (count $argv) -eq 0 ]
        vim .
    else
        vim $argv
    end
end
