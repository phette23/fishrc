function server -d 'Start a python HTTP server in the current dir, optionally specifying the port'
    if test $argv[1]
        set port $argv[1]
    else
        set port 8000
    end

    sleep 2
    and open "http://localhost:$port/" &
    python -c 'import SimpleHTTPServer; SimpleHTTPServer.test();' $port

end
