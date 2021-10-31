function upd -d 'Run common software updates'
    npm update -g --audit=false --fund=false
    sudo apt-get update -qq
    sudo apt-get upgrade -y
end
