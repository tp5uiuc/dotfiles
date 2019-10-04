#!/usr/bin/env sh

install_bundles() {
	antibody bundle <"$DOTFILES/antibody/bundles.txt" >~/.zsh_plugins.sh
	antibody update
}

# Build antibody only in CI environments
test -n "$CI" &&
	curl -sL https://git.io/antibody | sh -s

echo "$PATH"
if command -v antibody >/dev/null 2>&1; then
	install_bundles
fi

unset install_bundles
