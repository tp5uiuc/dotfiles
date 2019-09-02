#!/bin/zsh
# Set in aliases.sh instead
# export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true

fpath=($DOTFILES/functions $fpath)

autoload -U "$DOTFILES"/functions/*(:t)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

HISTFILE=~/.zsh_history
HISTSIZE=32768
SAVEHIST=10000

# Automatic CD
setopt AUTO_CD
# set globbing to be case-insensitive
setopt NO_CASE_GLOB
# set extended globbing like bash
setopt KSH_GLOB;
# don't nice background tasks
setopt NO_BG_NICE
# don't send hup when shell exists
setopt NO_HUP
# don't beep on error in ZLE.
setopt NO_BEEP
# allow functions to have local options
setopt LOCAL_OPTIONS
# allow functions to have local traps
setopt LOCAL_TRAPS
# share history between sessions ???
setopt SHARE_HISTORY
# add timestamps to history
setopt EXTENDED_HISTORY
# enable parameter expansion, command substitution and arithmetic expansion prompts.
setopt PROMPT_SUBST
# correct your incorrect commands
setopt CORRECT
# don't move cursor while completion
setopt COMPLETE_IN_WORD
# adds history
setopt APPEND_HISTORY
# adds history incrementally and share it across sessions
setopt INC_APPEND_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# don't execute history commands directly, but put it in edit
setopt HIST_VERIFY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# dont ask for confirmation in rm globs*
setopt RM_STAR_SILENT

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# emacs mode
# I always enter vi mode by mistake
bindkey -e

# fuzzy find: start to type
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "$terminfo[cuu1]" up-line-or-beginning-search
bindkey "$terminfo[cud1]" down-line-or-beginning-search

# backward and forward word with option+left/right
bindkey '^[^[[D' backward-word
bindkey '^[b' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[f' forward-word

# # to to the beggining/end of line with fn+left/right or home/end
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey '^[[H' beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line
# bindkey '^[[F' end-of-line

# delete char with backspaces and delete
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# delete word with ctrl+backspace
bindkey '^[[3;5~' backward-delete-word
# bindkey '^[[3~' backward-delete-word

# search history with fzf if installed, default otherwise
if test -d /usr/local/opt/fzf/shell; then
	# shellcheck disable=SC1091
	. /usr/local/opt/fzf/shell/key-bindings.zsh
else
	bindkey '^R' history-incremental-search-backward
fi
