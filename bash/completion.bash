#!/usr/bin/env bash

# Add tab completion for many Bash commands
# CHANGELOG : Updated path based on brew recommendation
if command -v brew &>/dev/null && [ -f "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# shellcheck source=/dev/null
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
	# CHANGELOG : updated the following path based on new Linux distros
elif [ -f /usr/share/bash-completion/bash_completion ]; then
	# shellcheck source=/dev/null
	source /usr/share/bash-completion/bash_completion
fi

# Enable tab completion for `g` by marking it as an alias for `git`
# CHANGELOG : complete -o default -o nospace -F doesnt seem to work
# see https://stackoverflow.com/a/15009611, so switched to using
# git-core helpers
if type __git_complete &>/dev/null; then
	__git_complete g __git_main
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults
