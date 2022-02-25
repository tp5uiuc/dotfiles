#!/usr/bin/env zsh

# Installs zsh completion for poetry

if hash poetry 2>/dev/null; then # poetry exists
	[ ! -f "${DOTFILES}/functions/_poetry" ] && poetry completion zsh > "${DOTFILES}/functions/_poetry"
fi
