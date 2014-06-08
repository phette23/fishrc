# Fish uses (set -xU) to export vars
set -xU EDITOR vim

# don't remember common commands
set -xU HISTIGNORE 'ls:cd:cd -:pwd'

# Prefer US English and use UTF-8
set -xU LANG en_US.UTF-8
set -xU LC_ALL en_US.UTF-8

# Highlight section titles in manual pages
set -xU LESS_TERMCAP_md (set_color yellow)

# Always enable colored `grep` output
set -xU GREP_OPTIONS '--color=auto'
