function urlfile -d 'given URL, echo a .url file (pipe fn ouput to file)'
    # If no argument is passed, exit with error
    if [ (count $argv) -eq 0 ]
        echo 'no URL provided' >2
        exit 1
    else
        echo "[InternetShortcut]"
        # first arg is URL
        echo "URL=$argv[1]"
    end
end
