# because Z isn't Fish-compatible we basically wrap a Bash script
# save the destination Z returns, then cd to it
function zproxy -d 'jump to dir using regex'
    set dest (bash -c "source /usr/local/etc/profile.d/z.sh && _z $argv && pwd")
    cd $dest
end
