# Simple functions that are basically aliases

function ... -d 'Go up 2 dirs'
    cd ../..
end

function .... -d 'Go up 3 dirs'
    cd ../../..
end

function ..... -d 'Go up 4 dirs'
    cd ../../../..
end

alias b brew

alias be 'bundle exec'

alias cl 'wc -l'

function co -d 'Go to ~/code'
    cd ~/code
end

function cx -d 'Make file executable'
    chmod +x $argv
end

function dl -d 'Go to Downloads'
    cd ~/Downloads
end

function doc -d 'Go to Documents'
    cd ~/Documents
end

function dr -d 'Go to Google Drive'
    cd ~/Google\ Drive
end

function dt -d 'ISO 8601 format for the current date'
    date "+%Y-%m-%d" $argv
end

function duf -d 'disk usage'
    command duf -hide special $argv1
end

function e -d 'eza (improved version of "ls")' --wraps=eza
    # make "date" column cyan instead of hard-to-read dark blue
    EZA_COLORS="da=36" eza -l --group-directories-first $argv
end

function fn -d 'Shorthand for (functions)' --wraps=functions
    functions $argv
end

alias g git

# Shorthand for all the common HTTP methods
for method in GET HEAD POST PUT DELETE TRACE OPTIONS
    # won't work with SSL verification, `cpan -i Mozilla:CA` doesn't fix this
    alias $method "PERL_LWP_SSL_VERIFY_HOSTNAME=0 lwp-request -m $method -u"
end

command -q ggrep && alias grep ggrep

function gs -d 'Concise git status'
    git status -sb
end

function ip -d 'get your external IP (from ifconfig.me)'
    curl ifconfig.me/ip
end

# pretty-print json output
alias jc 'jc -p'

function k1 -d 'Kill the first job'
    kill %1
end

function l -d 'List files in long format'
    if command -q eza
        EZA_COLORS="da=36" eza -l --group-directories-first $argv
    else
        ls -lG $argv
    end
end

function la -d 'List (all) files long format'
    if command -q eza
        EZA_COLORS="da=36" eza -al --group-directories-first $argv
    else
        ls -alG $argv
    end
end

function lsa -d 'List (all) files in short format'
    if command -q eza
        EZA_COLORS="da=36" eza -a --group-directories-first $argv
    else
        ls -aFG $argv
    end
end

function map -d 'Intuitive map function' --wraps=xargs
    xargs -n1 $argv
end

alias mre "glow -p readme.md"

function nout -d 'npm outdated --depth=0'
    npm outdated --depth=0 $argv
end

function nr -d 'npm run alias'
    npm run $argv
end

function pgl -d 'Find matching running processes'
    pgrep -alf $argv
end

function pic -d 'Go to Pictures'
    cd ~/Pictures
end

alias pv-outdated "pipenv update --dry-run"

function rf -d 'Remove recursively—careful!!!'
    rm -rf $argv
end
