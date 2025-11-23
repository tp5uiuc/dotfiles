#!/usr/bin/env sh

install_bundles() {
	ln -s "$DOTFILES/antidote/bundles.txt" ~/.zsh_plugins.txt
}

install_localrc() {
	echo "# source /path/to/antidote/antidote.zsh" >>~/.localrc
	echo "# antidote load" >>~/.localrc
}

install_bundles
install_localrc

unset install_bundles
unset install_localrc
