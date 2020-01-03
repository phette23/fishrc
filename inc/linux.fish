function upd -d 'Run common software updates'
    npm update -g
    gem update --system ^/dev/null
    sudo apt-get update -qq
    sudo apt-get upgrade -y
end
