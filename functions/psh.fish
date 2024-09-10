function psh -d "run pipenv/poetry shell (detects which one)"
    if [ -f Pipfile ]
        MISE_FISH_AUTO_ACTIVATE=0 pipenv shell
    # both poetry & uv use pyproject.toml so we look for their unique lock files
    else if [ -f poetry.lock ]
        MISE_FISH_AUTO_ACTIVATE=0 poetry shell
    else if [ -f uv.lock ]
        if [ -d .venv ]
            source .venv/bin/activate.fish
        else
            echo "uv project but no .venv found"
        end
    else
        echo "No Pipfile, poetry.lock, or uv.lock found"
    end
end
