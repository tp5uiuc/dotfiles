#!/bin/sh
export PATH="$PATH:$DOTFILES/bin:$HOME/.bin"

export PATH="/usr/local/bin:$PATH:/usr/local/sbin:$(brew --prefix coreutils)/libexec/gnubin:/Users/tp5/Desktop/ursolver/pythonSource/utils:/Applications/ParaView-5.5.0.app/Contents/bin:/Applications/MATLAB_R2016b.app/bin";

# your project folder that we can `c [tab]` to
export PROJECTS="$HOME/code"

# your default editor
export EDITOR='nvim'
export VEDITOR='subl'

# Added to make finding VTK,TBB easier when using CMake
# Hardcoded as brew is observed to be darn slow when using
# $(brew --prefix)
if command -v brew >/dev/null 2>&1; then
  export TBB_ROOT=/usr/local/opt/tbb
  export VTK_ROOT=/usr/local/opt/vtk
  export FFTW_ROOT=/usr/local/opt/fftw
fi

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
