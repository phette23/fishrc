function __cheat_ln -d 'Print line for cheat sheets'
    set_color FF0
    echo -e -n $argv[1]
    set_color normal
    echo '-> ' $argv[2]
end
