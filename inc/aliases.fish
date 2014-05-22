# Simple functions that are basically aliases

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

function lsa -d 'List all files in short format'
  ls -a $colorflag $argv
end

function lsd -d 'List only directories'
  ls -lF $colorflag $argv | grep "^d" --color=never
end

# (functions) is too much typing
function fns -d 'Shorthand for (functions)'
  functions $argv
end

# Easier navigation
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

function d -d 'Go to Dropbox'
	cd ~/Dropbox
end

function dl -d 'Go to Downloads'
	cd ~/Downloads
end

function code -d 'Go to ~/code'
	cd ~/code
end

# Misc common commands
function cx -d 'Make file executable'
	chmod +x $argv
end

function pgl -d 'Find matching running processes'
	pgrep -lf $argv
end

function rf -d 'Remove recursively—careful!!!'
	rm -rf
end

function g -d 'Alias for (git)'
	git $argv
end

function gs -d 'Concise (git status)'
	git status -sb
end
