function tre -d 'Shorthand for tree with colors & hidden files enabled'
    # Hidden files & color enabled, ignores `.git` & other common dirs, lists
    # directories first. Output is piped into `less` with options to preserve color
    # & line numbers, unless the output is small enough for one screen.
    tree -aC -I '.git|node_modules|bower_components|.sass-cache' --dirsfirst $argv | less -FRNX
end
