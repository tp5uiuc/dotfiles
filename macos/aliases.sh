#!/usr/bin/env sh

if [ "$(uname -s)" != "Darwin" ]; then
	return 0
fi

alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
# Lock the screen (when going AFK)
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
