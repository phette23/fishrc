function http-to-git -a branch -d 'change git remote URLs from HTTP(s) scheme to git://'
    set -q branch[1]
    or set branch 'origin'
    set url (git remote get-url --all $branch | sed -e 's|https://github\.com/|git@github.com:|')
    git remote set-url $branch $url
    and echo "changed git remote url for $branch to $url"
end
