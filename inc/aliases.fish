# Simple functions that are basically aliases

function .. -d 'Go up 1 dir'
	cd ..
end

function ... -d 'Go up 2 dirs'
	cd ../..
end

function .... -d 'Go up 3 dirs'
	cd ../../..
end

function ..... -d 'Go up 4 dirs'
	cd ../../../..
end

function '~' -d 'Go to home dir'
	cd ~
end

alias b brew

alias cl 'wc -l'

function code -d 'Go to ~/code'
	cd ~/code
end

function cx -d 'Make file executable'
	chmod +x $argv
end

function d -d 'Go to Dropbox'
    cd ~/Dropbox
end

function dl -d 'Go to Downloads'
    cd ~/Downloads
end

function fn -d 'Shorthand for (functions)'
  functions $argv
end

function g -d 'Alias for (git)'
    git $argv
end

# Shorthand for all the common HTTP methods
for method in GET HEAD POST PUT DELETE TRACE OPTIONS
    # Using backwards-compatible alias syntax in Fish
    alias $method "lwp-request -m $method"
end

grunt --version > /dev/null
if test $status
    function grunt -d 'Grunt (with stack traces)'
        command grunt --stack $argv
    end
end

function gs -d 'Concise (git status)'
    git status -sb
end

# Note: Fish uses caret (^) to redirect stderr
if ls --color > /dev/null ^&1 # GNU `ls`
    set colorflag --color
else # OS X `ls`
    set colorflag -G
end

function l -d 'List files'
    ls -lFh $colorflag $argv
end

function la -d 'List *all* files'
  ls -laFh $colorflag $argv
end

function ls -d 'Always use colors with (ls)'
    command ls $colorflag $argv
end

function lsa -d 'List all files in short format'
  ls -a $colorflag $argv
end

function lsd -d 'List only directories'
  ls -lF $colorflag $argv | grep "^d" --color=never
end

function map -d 'Intuitive map function'
 xargs -n1 $argv
end

function pgl -d 'Find matching running processes'
	pgrep -lf $argv
end

function rf -d 'Remove recursively—careful!!!'
	rm -rf $argv
end

function spotoff -d 'Disable Spotlight'
    sudo mdutil -a -i off
end

function spoton -d 'Enable Spotlight'
    sudo mdutil -a -i on
end

function urlencode -d 'URL-encode strings'
    python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);" $argv
end
