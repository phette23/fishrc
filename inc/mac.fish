# set tab title to current command & directory
function fish_title
  echo -n (status current-command) '-' (basename $PWD)
end

function upd -d 'Run common software update commands'
    npm update -g
    sudo softwareupdate -i -a
    brew update
    brew upgrade
end

################
# OS X Aliases #
################

# use iTerm-Tmux integration if we're in iTerm
# see: https://code.google.com/p/iterm2/wiki/TmuxIntegration
if [ $ITERM_SESSION_ID ]
    alias tm 'tmux -CC'
end

# Source-Highlight (requires Homebrew package)
alias ccat 'src-hilite-lesspipe.sh'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show "defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder"
alias hide "defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder"

# restart local SSH server, need to do this before running Portal vagrant sometimes
alias restart_ssh "sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist"

# Clean up LaunchServices to remove duplicates in the "Open With" menu
alias lscleanup "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder"

# IP addresses
alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias localip "ipconfig getifaddr en0"
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

##################
# OS X Functions #
##################

function note -d 'note "title" "body" adds to Notes.app'
    if [ (count $argv) > 0 ]
        set title $argv[1]

        if [ (count $argv) -eq 2 ]
            set body $argv[2]
        end
    else
        # pipe use case
        set title (cat)
    end

    osascript >/dev/null -e "tell application \"Notes\"
        tell account \"iCloud\"
            tell folder \"Notes\"
                make new note with properties {name:\"$title\", body:\"$title\" & \"<br><br>\" & \"$body\"}
            end tell
        end tell
    end tell"
end

function remind -d 'add text to default list in Reminder.app'
    if [ (count $argv) > 0 ]
        set text $argv[1] # argument
    else
        set text (cat) # pipe
    end

    osascript >/dev/null -e "tell application \"Reminders\"
        tell the default list
            make new reminder with properties {name:\"$text\"}
            end tell
        end tell"
end

function spotoff -d 'Disable Spotlight'
    sudo mdutil -a -i off
end

function spoton -d 'Enable Spotlight'
    sudo mdutil -a -i on
end

# stolen from oh-my-zsh's OS X plugin:
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/osx/osx.plugin.zsh
function tab -d 'open new terminal tab & execute cmd'
    if [ (count $argv) -eq 0 ]
        set cmd 'clear'
    else
        set cmd $argv
    end

  set the_app (osascript -e 'tell application "System Events"
        name of first item of (every process whose frontmost is true)
      end tell'
  )

  if [ $the_app = 'Terminal' ]
    osascript -e "tell application \"System Events\"
          tell process \"Terminal\" to keystroke \"t\" using command down
          tell application \"Terminal\" to do script \"$cmd\" in front window
      end tell"
  end

  if [ $the_app = 'iTerm' -o $the_app = 'iTerm2' ]
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
