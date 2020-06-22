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

alias cl 'wc -l'

function cloc -d 'Count Lines of Code (except node_modules)'
  command cloc --exclude-dir=node_modules $argv
end

function code -d 'Go to ~/code'
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

function e -d 'exa (improved version of "ls")'
	# make "date" column cyan instead of hard-to-read dark blue
	EXA_COLORS="da=36" exa -l --group-directories-first $argv
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

function gs -d 'Concise (git status)'
    git status -sb
end

function k1 -d 'Kill the first job'
    kill %1
end

function l -d 'List files'
	if command -v exa >/dev/null
		EXA_COLORS="da=36" exa -l --group-directories-first $argv
	else
		ls -lG $argv
	end
end

function la -d 'List files'
	if command -v exa >/dev/null
		EXA_COLORS="da=36" exa -al --group-directories-first $argv
	else
		ls -alG $argv
	end
end

function lsa -d 'List all files in short format'
	if command -v exa >/dev/null
		EXA_COLORS="da=36" exa -a --group-directories-first $argv
	else
		ls -aFG $argv
	end
end

function lsd -d 'List only directories'
	if command -v exa >/dev/null
		exa -D $argv
	else
		ls -l $argv | grep "^d" --color=never
	end
end

function map -d 'Intuitive map function'
 xargs -n1 $argv
end

function nout -d 'npm outdated --depth=0'
  npm outdated --depth=0 $argv
end

function nr -d 'npm run alias'
  npm run $argv
end

function pgl -d 'Find matching running processes'
	pgrep -lf $argv
end

function rf -d 'Remove recursively—careful!!!'
	rm -rf $argv
end

function t -d 'todo.sh alias (adds date, uses config in Drive)'
	todo.sh -t -d ~/Google\ Drive/z/todo/todo.cfg $argv
end

function urlencode -d 'URL-encode strings'
    python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);" $argv
end
