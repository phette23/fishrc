function upd -d 'Run common software updates'
    npmgup
    sudo gem update
    sudo apt-get update -qq
    sudo apt-get upgrade -y
end
