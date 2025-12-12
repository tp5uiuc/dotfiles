#!/usr/bin/env sh

if command -v brew >/dev/null 2>&1; then
	case $(uname -s) in
		'Linux')
			export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
			export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
			;;
		'Darwin')
			case $(uname -m) in
				'x86_64')
					export HOMEBREW_PREFIX="/usr/local"
					export HOMEBREW_REPOSITORY="/usr/local/Homebrew";
					;;
				'arm64')
					# M1 Mac or newer
					export HOMEBREW_PREFIX="/opt/homebrew";
					export HOMEBREW_REPOSITORY="/opt/homebrew";
					;;
			esac
			;;
	esac
	export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar";
	export MANPATH="${HOMEBREW_PREFIX}/share/man${MANPATH+:$MANPATH}:";
	export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}";
fi
