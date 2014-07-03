function update -d 'Run common software updates'
    npm update -g
    sudo gem update
    sudo apt-get update -qq
    sudo apt-get upgrade -y
end
