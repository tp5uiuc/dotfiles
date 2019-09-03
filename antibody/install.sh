#!/usr/bin/env sh

if command -v antibody >/dev/null 2>&1; then
	antibody bundle <"$DOTFILES/antibody/bundles.txt" >~/.zsh_plugins.sh
	antibody update
fi
