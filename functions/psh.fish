function psh -d "run pipenv/poetry shell (detects which one)"
    if [ -f Pipfile ]
        pipenv shell
    else if [ -f pyproject.toml ]
        poetry shell
    else
        echo "No Pipfile or pyproject.toml found"
    end
end
