function uprepos -d 'Update all git repos in sub-directories'
    for dir in ./*/
        cd $dir
        # check if there's a repo
        git status >/dev/null ^&1

        if [ $status -eq 0 ]
            # check that it has a remote origin
            git remote | grep origin >/dev/null ^&1

            if [ $status -eq 0 ]
                set_color red
                echo -n "Updating "
                echo $dir | sed -e "s|\./||" -e "s|/||"
                set_color normal
                # be safe: fast-forward only pull
                git pull --ff-only origin
            end
        end

        # return to cwd
        # note that ".." wouldn't work with symlinked dirs
        cd -
    end
end
