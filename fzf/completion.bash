#!/usr/bin/env bash

test -d /usr/local/opt/fzf/shell || return 0

export FZF_COMPLETION_TRIGGER='**'

# shellcheck disable=SC1091,SC1094
. /usr/local/opt/fzf/shell/completion.bash
# shellcheck disable=SC1091,SC1094
. /usr/local/opt/fzf/shell/key-bindings.bash # Note that we already source it in config.zsh, but to maintain symmetry with the bash script we do it here too.
