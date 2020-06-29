function uprepos -d 'Update all git repos in sub-directories'
    for dir in ./*/
        cd $dir

        if git status &>/dev/null
            # check that it has a remote origin
            if git remote | grep origin &>/dev/null
                set_color red
                echo -n "Updating "
                echo $dir | sed -e "s|\./||" -e "s|/||"
                set_color normal
                # be safe: fast-forward only pull
                git pull --ff-only origin
            end
        end

        # return to cwd, note ".." doesn't work with symlinked dirs
        cd -
    end
end
