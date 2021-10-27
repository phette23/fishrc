function urlencode -d 'URL-encode strings'
    python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);" $argv
end
