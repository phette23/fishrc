# Fish Configuration

[Fish shell](http://fishshell.com/) customizations, such as handy aliases & functions.

My configuration dotfiles are in [a separate project](https://github.com/phette23/dotconfig).

## Structure

Everything is sourced through config.fish. The files inside "inc" have self-explanatory names, like "aliases".

Fish autoloads any functions in the "functions" directory.

**setup.sh** gets you up-&-running on a new Mac by adding fish to /etc/shells, downloading the iTerm integration script, and copying these files into place.

**universal.fish** sets a couple universal variables which you may want, again handy for setting up a new system.

The included "copy.fish" script copies config.fish, as well as the contents of "inc" and "functions", into fish's configuration directory (~/.config/fish).
