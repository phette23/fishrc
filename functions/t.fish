function t -d 'todo.sh alias (adds date, uses config from Google Drive)'
    [ -f ~/Google\ Drive/z/todo/todo.cfg ] && set dir ~/Google\ Drive/z/todo/todo.cfg
    [ -f ~/Google\ Drive/My\ Drive/z/todo/todo.cfg ] && set dir ~/Google\ Drive/My\ Drive/z/todo/todo.cfg
	todo.sh -t -d $dir $argv
end
