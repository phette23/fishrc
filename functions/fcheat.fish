function fcheat -d 'Cheat sheet for fish shell'

    function msg
        set_color D80; echo -n $argv[1]
        set_color normal; echo -e $argv[2]
    end

    set_color purple
    echo -e '\t\tFish Cheat Sheet\n'

    msg 'fish_config' '\t-> launch web-based configuration'
    msg 'help' '\t\t-> open documentation HTML'
    msg 'math' '\t\t-> perform simple calculations'
    msg 'vared $var' '\t-> interactively edit variable $var'
    set_color D80; echo 'see also: fn fish_default_key_bindings'
    set_color normal
end
