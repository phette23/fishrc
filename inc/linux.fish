function upd -d 'Run common software updates'
    npmgup
    sudo apt-get update -qq
    sudo apt-get upgrade -y
end
