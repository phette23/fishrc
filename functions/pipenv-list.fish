# see https://stackoverflow.com/questions/51904300/list-all-pipenv-environments
function pipenv-list -d 'list pipenv virtual environments'
    set dir ~/.local/share/virtualenvs
    echo -e "Virtual envs in $dir:\n"
    for venv in $dir/*
        basename $venv
        cat $venv/.project | sed "s/\(.*\)/\1\n\n/"
    end
end
