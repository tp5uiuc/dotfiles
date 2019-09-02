#!usr/bin/env sh
export PATH="/usr/local/bin:$PATH:$DOTFILES/bin:$HOME/.bin"

# your project folder that we can `c [tab]` to
export PROJECTS="$HOME/code"

# your default editor
export EDITOR='nvim'
export VEDITOR='subl'

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);
