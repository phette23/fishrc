# Fish Configuration

[Fish shell](http://fishshell.com/) customizations, such as handy aliases & functions.

My configuration dotfiles are in [a separate project](https://github.com/phette23/dotconfig) now.

## Structure

Everything is sourced through config.fish. The files inside "inc" have self-explanatory names, like "path" & "aliases".

Fish autoloads any functions in the functions directory.

**setup.sh** should get you up-&-running on a new Mac that doesn't have Fish installed yet (requires Homebrew).

## Grunt Tasks

If you have Node & Grunt installed, you can run `npm i` inside this project to get started.

**`grunt copy`** (also the default `grunt`) moves the files into place.

**`grunt watch`** monitors functions/, inc/, & config.fish for changes & then runs `copy`.

## To Do

A lot of [my Bash customizations](https://github.com/phette23/bashrc) haven't been ported to Fish yet.

- [x] basics of prompt
- [x] exports
- [x] path
- [x] all aliases
- [x] git branch & working dir status in prompt
- [x] load z
- [x] functions
- [ ] cheat sheets
- [x] Mac specific settings
- [ ] Linux specific settings
- [x] `rbenv init`

