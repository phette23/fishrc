function phpserver -d 'Start a PHP server from a directory, optionally specifying the port'
    if test $argv[1]
        set port $argv[1]
    else
        set port 4000
    end

    set ip (ipconfig getifaddr en0)

    sleep 1
    and open "http://$ip:$port/" &
    php -S "$ip:$port"
end
