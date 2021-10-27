function pm -d 'alias for "python manage.py"'
	# for libraries wagtail site where manage.py is in a subfolder
	if test -e libraries/manage.py
		python libraries/manage.py $argv
	else
		python manage.py $argv
	end
end
