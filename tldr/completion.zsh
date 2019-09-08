#!/usr/bin/env zsh

# Installs bash and zsh completion for tldr

# Completion scripts, fetch from repo
# TLDR_BASH="https://raw.githubusercontent.com/dbrgn/tealdeer/master/bash_tealdeer"
TLDR_ZSH="https://raw.githubusercontent.com/dbrgn/tealdeer/master/zsh_tealdeer"

if command -v tldr >/dev/null 2>&1; then # tealdeer exists

	# Determine version
	# tldr --version prints as tealdeer v1.2.0 (macOS / BSD)
	# awk reduces this to 120, taken from https://stackoverflow.com/a/16618516
	tldr_version=$(tldr --version | awk -F '[^0-9]*' '{print $2$3$4}')

	# zsh completion is not installed if version < 120, so download it
	[ "${tldr_version}" -le 120 ] && [ ! -f "${DOTFILES}/functions/_tldr" ] && curl -Lso "${DOTFILES}/functions/_tldr" "${TLDR_ZSH}"
fi
