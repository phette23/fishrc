function __cheat_heading -d 'Colored header for cheat sheets'
    set_color purple
    echo -e "\t\t\t$argv[1]"
    set_color normal
    echo
end
