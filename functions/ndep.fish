function ndep -d 'update & audit npm deps, push to github'
  echo "Updating and auditing npm dependencies for" (basename (pwd))
  npm outdated --depth=0 || npm update
  npm audit fix
  if git status 2&>/dev/null
      git commit -am "update & audit npm deps" && git push
  end
end
