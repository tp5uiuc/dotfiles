#!/usr/bin/env zsh

# zsh specific aliases

# Load help
autoload -Uz run-help
# By default, run-help is an alias for man
unalias run-help 2> /dev/null
# Create shell agnostic help
alias help=run-help
