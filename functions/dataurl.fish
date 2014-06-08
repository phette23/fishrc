function dataurl -d 'Create data URL from a file'
    set mimeType (file -b --mime-type $argv[1])
    echo $mimeType | grep 'text/.*' > /dev/null
    if [ $status -eq 0 ]
        set mimeType "$mimeType;charset=utf-8"
    end
    echo -s "data:$mimeType;base64," (openssl base64 -in $argv[1] | tr -d '\n')
end
