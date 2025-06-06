function psh -d "activate python project virtualenv"
    # if we are already in a venv, deactivate it
    if set --query VIRTUAL_ENV
        deactivate
        return 0
    end

    if [ -f Pipfile ]
        MISE_FISH_AUTO_ACTIVATE=0 pipenv shell
    # both poetry & uv use pyproject.toml so we look for their unique lock files
    else if [ -f poetry.lock ]
        poetry env activate | source
    # uv and anything else that makes a .venv
    else if [ -d .venv ]
            source .venv/bin/activate.fish
    else
        echo "No Pipfile, poetry.lock, or .venv found"
    end
end
