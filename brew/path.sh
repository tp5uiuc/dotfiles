#!/usr/bin/env sh

if command -v brew >/dev/null 2>&1; then
	case $(uname -m) in
		'x86_64')
			export HOMEBREW_PREFIX="/usr/local"
			export HOMEBREW_CELLAR="/usr/local/Cellar";
			export HOMEBREW_REPOSITORY="/usr/local/Homebrew";
			export MANPATH="/usr/local/share/man${MANPATH+:$MANPATH}:";
			export INFOPATH="/usr/local/share/info:${INFOPATH:-}";
			;;
		'arm64')
			# M1 Mac or newer
			export HOMEBREW_PREFIX="/opt/homebrew";
			export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
			export HOMEBREW_REPOSITORY="/opt/homebrew";
			export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
			export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
			;;
	esac
fi
