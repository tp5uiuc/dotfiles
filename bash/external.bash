#!/usr/bin/env bash

# Manage/source external bash scripts

# z!
ANTIBODY_Z_FILEPATH="$HOME/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-rupa-SLASH-z/z.sh"

BREW_Z_FILEPATH="/usr/local/etc/profile.d/z.sh"

if [[ -d "$(dirname "${ANTIBODY_Z_FILEPATH}")" && -f "${ANTIBODY_Z_FILEPATH}" ]]; then
	# shellcheck source=/dev/null
	. "${ANTIBODY_Z_FILEPATH}"
elif [[ -r "${BREW_Z_FILEPATH}" && -f "${BREW_Z_FILEPATH}" ]]; then
	# shellcheck source=/dev/null
	. "${BREW_Z_FILEPATH}"
fi
