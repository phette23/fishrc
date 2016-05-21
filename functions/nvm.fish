function nvm -d 'fish (bass) wrapper for Node Version Manager'
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv[1]
end
