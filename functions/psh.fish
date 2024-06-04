function psh -d "run pipenv/poetry shell (detects which one)"
    if [ -f Pipfile ]
        MISE_FISH_AUTO_ACTIVATE=0 pipenv shell
    else if [ -f pyproject.toml ]
        MISE_FISH_AUTO_ACTIVATE=0 poetry shell
    else
        echo "No Pipfile or pyproject.toml found"
    end
end
