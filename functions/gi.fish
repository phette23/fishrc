function gi -d 'Install & save Grunt plugins'
    for arg in $argv
        npm i --save-dev grunt-$arg
    end
end
