function todos -d 'Find @todo statements in a project'
    # test if ack is installed
    type -P ack >/dev/null
    if [ $status -eq 0 ]
        command ack --ignore-case --after-context=2 '@todo' $argv
    else
        echo 'Ack not installed!'
        return 1
    end
end
