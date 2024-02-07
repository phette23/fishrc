function ddupe --description "sort and then uniq a file, careful does not create a backup"
    set tmp (mktemp)
    sort $argv[1] | uniq > $tmp
    mv $tmp $argv[1]
end
