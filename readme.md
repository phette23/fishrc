# Fish Configuration

[Fish shell](http://fishshell.com/) customizations, such as handy aliases & functions.

My configuration dotfiles are in [a separate project](https://github.com/phette23/dotconfig).

## Structure

Everything is sourced through config.fish. The files inside "inc" have self-explanatory names, like "aliases".

Fish autoloads any functions in the functions directory.

**setup.sh** should get you up-&-running on a new Mac that doesn't have Fish installed yet (requires Homebrew).

**universal.fish** sets a couple universal variables which you may want, again handy for setting up a new system.

## Grunt Tasks

If you have Node & Grunt installed, you can run `npm i` inside this project to get started.

**`grunt copy`** (also the default `grunt`) moves the files into place.

**`grunt watch`** monitors functions/, inc/, & config.fish for changes & then runs `copy`.
