# set tab title to current command & directory
function fish_title
    echo -n (status current-command) - (basename $PWD)
end

function eqlaunch -d 'run EQUELLA admin launcher & copy password to clipboard'
    if cq eq; and cq op
        set user (jq -r '.username' ~/.equellarc)
        op item get "VAULT ($user)" --fields password --reveal | tr -d '\n' | pbcopy
        and eq launch
    else
        echo "Requires equella-cli and onepassword cli to be installed"
    end
end

function upd -d 'Run common software update commands'
    cq brew && brew update && HOMEBREW_NO_ENV_HINTS=true brew upgrade
    cq code && code --update-extensions 2>/dev/null
    cq gcloud && gcloud components update --quiet
    cq pipx && pipx upgrade-all
    cq pnpm && pnpm update --global --latest
    sudo softwareupdate --download --all --verbose
end

# pnpm
# put under Mac because dir might be different under Linux
if cq pnpm
    set -gx PNPM_HOME ~/Library/pnpm
    fish_add_path "$PNPM_HOME"
end

############################
# OS X Aliases & Functions #
############################

# use iTerm-Tmux integration if we're in iTerm
# see: https://code.google.com/p/iterm2/wiki/TmuxIntegration
if [ $ITERM_SESSION_ID ]
    alias tm 'tmux -CC'
end

# free disk space using diskutil instead of df
function dspa -d 'show disk usage information'
    diskutil info / | grep Space | sed -e 's|^ *||' -e 's| [(].*||'
end

# flush the DNS cache (Mac OS 10.12 & later)
alias flushdns "sudo killall -HUP mDNSResponder; sudo killall mDNSResponderHelper; sudo dscacheutil -flushcache"

# Show/hide hidden files in Finder
alias hide "defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder"
alias show "defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder"

# Clean up LaunchServices to remove duplicates in the "Open With" menu
alias lscleanup "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder"

# IP addresses
alias localip "ipconfig getifaddr en0"

# restart local SSH server, need to do this before running Portal vagrant sometimes
alias restart_ssh "sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist"

# improved `top` on MacOS, don't show so many useless figures
alias top "top -stats pid,user,command,cpu,mem,threads,time,pgrp,ppid,state"

# stolen from oh-my-zsh's OS X plugin:
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/osx/osx.plugin.zsh
function tab -d 'open new terminal tab & execute cmd'
    if [ (count $argv) -eq 0 ]
        set cmd clear
    else
        set cmd $argv
    end

    set the_app (osascript -e 'tell application "System Events"
        name of first item of (every process whose frontmost is true)
      end tell'
    )

    if [ $the_app = Terminal ]
        osascript -e "tell application \"System Events\"
          tell process \"Terminal\" to keystroke \"t\" using command down
          tell application \"Terminal\" to do script \"$cmd\" in front window
        end tell"
    end

    if [ $the_app = iTerm -o $the_app = iTerm2 ]
        osascript -e "tell application \"$the_app\"
            tell current window
                create tab with default profile
                tell current session
                    write text \"$cmd\"
                end tell
            end tell
        end tell"
    end

end
