#!/usr/bin/env sh

# Build antibody only in CI environments
test -n "$CI" &&
	curl -sL https://git.io/antibody | sh -s

if command -v antibody >/dev/null 2>&1; then
	antibody bundle <"$DOTFILES/antibody/bundles.txt" >~/.zsh_plugins.sh
	antibody update
fi
