function gh -d "Utility for GitHub operations, see -h for more"
    function usage
        echo 'gh usage:'
        echo
        echo -e '\t-o (or no params) -> open GitHub repo'
        echo -e '\t-p -> open GitHub page'
        return 0
    end

    # internal function used in both options below
    function getRemoteUrl -d 'Get repo URL or exit if none available'
        echo 'Getting remote URL…'
        # get remote URL
        set -g _giturl (git config --get remote.origin.url)

        # if there was no remote URL, exit with an error
        if [ -z $_giturl ]
            set_color red
            echo "Not a repo or no remote origin!"
            set_color normal
            set -e _giturl
            return 1
        else
            return 0
        end
    end

    function openUrl -d 'Open given URL, erase $_giturl'
        echo "Opening $argv[1]…"
        open $argv[1]
        set -e _giturl
    end

    function openRepo -d 'Open repository URL given git URL'
        # we have to let the error bubble up from getRemoteUrl explicitly
        getRemoteUrl
        or return 1
        # convert git URL into HTTPS url, sed edits are:
        # 1) git@github.com => https://github.com
        # 2) github.com:username => github.com/username
        # 3)repo.git => repo
        set repourl (echo $_giturl | sed -e "s|git@|https://|" -e "s|\.com:|.com/|" -e "s|\.git\$||")
        openUrl $repourl
    end

    function openPage -d 'Open GitHub page URL given git URL'
        getRemoteUrl
        or return 1
        # convert git URL into GitHub Page URL, sed edits are:
        # 1) git@github.com:username => https://username.github.io/
        # 2) repo.git => repo/
        set repourl (echo $_giturl | sed -e "s|git@github\.com:\(.*\)/|https://\1.github.io/|" -e "s|\.git\$|/|")
        openUrl $repourl
    end

    # shield against an index error when no args are passed
    if [ (count $argv) -eq 0 ]
        openRepo
        # if openRepo was unsuccessful (i.e. getRemoteUrl fails)
        # return an error, otherwise return success
        or return 1
        and return 0
    end

    switch $argv[1]
        case -p
            openPage
        case -o
            openRepo
        case -h --help
            usage
        # default
        case '*'
            usage
            return 1
    end

end
