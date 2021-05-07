# set tab title to current command & directory
function fish_title
  echo -n (status current-command) '-' (basename $PWD)
end

function upd -d 'Run common software update commands'
    command --query apm && apm upgrade --confirm=false
    command --query npm && npm update -g
    sudo softwareupdate -i -a
    command --query brew && brew update && brew upgrade
end

# Homebrew env vars https://docs.brew.sh/Manpage#shellenv
command --query /usr/local/bin/brew && eval (brew shellenv)

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

# free disk space using diskutil instead of df
function dspa -d 'show disk usage information'
    diskutil info / | grep 'Space' | sed -e 's|^ *||' -e 's| [(].*||'
end

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# flush the DNS cache (Mac OS 10.12 & later)
alias flushdns "sudo killall -HUP mDNSResponder; sudo killall mDNSResponderHelper; sudo dscacheutil -flushcache"

# Show/hide hidden files in Finder
alias show "defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder"
alias hide "defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder"

# restart local SSH server, need to do this before running Portal vagrant sometimes
alias restart_ssh "sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist"

# Clean up LaunchServices to remove duplicates in the "Open With" menu
alias lscleanup "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder"

# IP addresses
alias localip "ipconfig getifaddr en0"

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
