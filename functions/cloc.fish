function cloc -d 'Count Lines of Code (excluding certain dirs)' --wraps=cloc
    command cloc --exclude-dir=node_modules,_site,.pytest_cache,.sass-cache,__pycache__ --not-match-f='pnpm\-lock\.yaml' --not-match-f='package\-lock\.json' --not-match-f='Pipfile\.lock' --not-match-f='poetry\.lock' $argv
end
