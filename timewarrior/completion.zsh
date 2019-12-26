#!/usr/bin/env zsh

# Installs zsh completion for timewarrior

# Completion scripts, fetch from repo
# TLDR_BASH="https://raw.githubusercontent.com/dbrgn/tealdeer/master/bash_tealdeer"
TIMEW_COMPLETION_ZSH="https://raw.githubusercontent.com/svenXY/timewarrior/master/_timew"
if hash timew 2>/dev/null; then # timewarrior exists

	# Determine version
	# timew --version prints as 1.2.0 (macOS / BSD)
	# awk reduces this to 120, taken from https://stackoverflow.com/a/16618516
	timew_version=$(timew --version | awk -F '[^0-9]*' '{print $1$2$3}')

	# zsh completion is not installed if version < 120, so download it
	# Note : this is just a safeguard for Homebrew's installation, as zsh
	# completion scripts are not installed, at least till version 1.2.0
	# Once `brew` starts installing the completion scripts, we can do away
	# with these checks
	[ "${timew_version}" -le 120 ] && [ ! -f "${DOTFILES}/functions/_timew" ] && curl -Lso "${DOTFILES}/functions/_timew" "${TIMEW_COMPLETION_ZSH}"
fi
