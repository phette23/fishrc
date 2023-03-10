# see https://github.com/fish-shell/fish-shell/issues/6901
# based on function in the last comment
# https://github.com/fish-shell/fish-shell/issues/6901#issuecomment-1424191917
function dotenv -d 'Load environment variables from a .env file'
    switch $argv[1]
        case '-h' '--help' 'help' 'usage'
            echo "Usage: dotenv [FILE]"
            echo "Load environment variables from a .env file."
            echo "If FILE is not specified, the default is '.env'."
            return 0
        case ''
            set file '.env'
        case '*'
            set file $argv[1]
    end

    if not test -f $file
        echo "Error: cannot find file '$file'"
        return 1
    end

    for line in (cat $file)
        set line (string trim $line)

        # skip empty lines and comments
        if test -z $line
        or string match -q "#*" $line
            continue
        end

        set name_value (string split -m 1 = $line)
        set name (string trim $name_value[1])
        set value (string trim $name_value[2])

        # If the value is quoted, remove the quotes.
        # This is questionable since ' "often" means that the value is a string and should not be interpreted.
        # I'm simply unsure how it should be handled in '.env' files.
        if string match -q '"*"' $value
        or string match -q "'*'" $value
            set value (string sub -s 2 -e -1 $value)
            echo unquoted_value=$value
        end

        # Does the value contain a variable?
        if string match -qr '[$][{][A-Za-z_0-9]*[}]' $value
            set with_variable (string replace -r '[$][{]([A-Za-z_0-9]*)[}]' '$$$1' $value)
            set value (eval "echo $with_variable")
            # If the value is empty, it means that the variable was not set before.
            # We should give a warning in that case.
            if test -z $value
                echo "Warning: unable to set $name since it contains an undefined variable: value=$with_variable"
                continue
            end
        end

        # do not echo the value — .env files often contain secrets we do not
        # want in our shell history
        set -gx $name $value
        and echo "set $name"
    end
end
