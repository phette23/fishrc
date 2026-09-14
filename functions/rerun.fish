function rerun -d 'Reuse arguments from last command but specify new cmd'
    if test (count $argv) -eq 0
        echo 'Usage: rerun COMMAND [FLAGS ...]' >&2
        return 2
    end

    history search --max=1 --null | read --null --tokenize --list previous
    if test (count $previous) -lt 2
        echo 'rerun: the last command has no arguments to reuse' >&2
        return 1
    end

    set -l operands
    set -l options_done false
    for token in $previous[2..]
        if $options_done
            set --append operands $token
        else if test "$token" = --
            set options_done true
        else if not string match --quiet --regex -- '^-' $token
            set --append operands $token
        end
    end

    if test (count $operands) -eq 0
        echo 'rerun: the last command has no non-option arguments to reuse' >&2
        return 1
    end

    $argv $operands
end
