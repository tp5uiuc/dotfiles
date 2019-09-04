#!/usr/bin/env sh

# Shell agnostic aliases
# Movement
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Easy directory change, adapted from https://opensource.com/article/18/9/tips-productivity-zsh
alias d='dirs -v | head -10'

# VirtuaCop
alias reload!='exec "$SHELL" -l'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias c="cd ~/code"
alias g="git"
alias h="history"

# Detect which `ls` flavor is in use
if ls --color >/dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
# shellcheck disable=SC2139
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
# shellcheck disable=SC2139
alias la="ls -laF ${colorflag}"

# List only directories
# shellcheck disable=SC2139
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
# shellcheck disable=SC2139
alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# OS dependent aliases
case $(uname -s) in
'Linux')
	alias emptytrash='rm -rf ~/.local/share/Trash/*'

	# Mimics OSX's open
	if [ -e /usr/bin/xdg-open ]; then
		alias open='xdg-open '
	fi

	if [ -z "$(command -v pbcopy)" ]; then
		if [ -n "$(command -v xclip)" ]; then
			alias pbcopy="xclip -selection clipboard"
			alias pbpaste="xclip -selection clipboard -o"
		elif [ -n "$(command -v xsel)" ]; then
			alias pbcopy="xsel --clipboard --input"
			alias pbpaste="xsel --clipboard --output"
		fi
	fi

	;;
'Darwin')
	# Recursively delete `.DS_Store` files
	alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

	# Empty the Trash on all mounted volumes and the main HDD.
	# Also, clear Apple’s System Logs to improve shell startup speed.
	# Finally, clear download history from quarantine. https://mths.be/bum
	alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

	# Hide/show all desktop icons (useful when presenting)
	alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
	alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

	# Merge PDF files
	# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
	# alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'
	# Recoded as a function to accomodate Linux systems

	;;
esac

# mnemonic for copy and Copy
alias c='pbcopy'
alias C="tr -d '\\n' | pbcopy"

# some useful cheatsheets
alias cheattmux='o https://gist.github.com/MohamedAlaa/2961058'
