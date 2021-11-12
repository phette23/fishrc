function c -d 'open file or cwd in Visual Studio Code' --wraps=code
    # If no argument is passed, open current dir
    if [ (count $argv) -eq 0 ]
        code .
    else
        code $argv
    end
end
