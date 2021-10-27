function cloc -d 'Count Lines of Code (excluding certain dirs)' --wraps=cloc
  command cloc --exclude-dir=node_modules --exclude-dir=_site $argv
end
