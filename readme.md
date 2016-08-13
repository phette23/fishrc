# Fish Configuration

[Fish shell](http://fishshell.com/) customizations, such as handy aliases & functions.

My configuration dotfiles are in [a separate project](https://github.com/phette23/dotconfig).

## Structure

Everything is sourced through config.fish. The files inside "inc" have self-explanatory names, like "aliases".

Fish autoloads any functions in the "functions" directory.

**setup.sh** gets you up-&-running on a new Mac that doesn't have Fish or [Fisherman](https://github.com/fisherman/fisherman) installed yet (requires Homebrew). It installs the [bass](https://github.com/edc/bass) and [z](https://github.com/rupa/z) plugins as well as iTerm2 integration.

**universal.fish** sets a couple universal variables which you may want, again handy for setting up a new system.

The included "copy.fish" script copies config.fish, as well as the contents of "inc" and "functions", into fish's configuration directory (~/.config/fish).
