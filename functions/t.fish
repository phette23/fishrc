function t -d 'todo.sh alias (adds date, uses config from Google Drive)' --wraps=todo.sh
    if not set -q TODOTXT_CFG_FILE
        echo "The 't' wrapper for todo.sh expects a TODOTXT_CFG_FILE env var pointing to your todo.txt folder which houses the task list(s) and todo.cfg file. Try setting TODOTXT_CFG_FILE first with 'set -Ux TODOTXT_CFG_FILE /path/to/todo.cfg'" >&2
        return 1
    end
    todo.sh -t $argv
end
