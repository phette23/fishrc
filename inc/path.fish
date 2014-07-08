# this basically only runs once, since Fish persists Universal vars across sessions
for path in /usr/local/share/npm/bin /usr/local/pear/bin $HOME/bin
    if not contains $path $fish_user_paths
        # append path to var
        set -U fish_user_paths $path $fish_user_paths
    end
end

# Ensure 1) Gnu Utils & 2) Homebrew bins are used over /bin, /usr/bin etc. (e.g. git)
set -x PATH (brew --prefix coreutils)/libexec/gnubin $PATH
set -x PATH /usr/local/bin $PATH
