#!/usr/bin/env bash

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"

echo "echoed ${DOTFILES}"
# export logic to profile
# [ -n "$PS1" ] && source ~/.bash_profile;
source ./.bash_profile;
