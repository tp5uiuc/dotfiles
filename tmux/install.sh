#!/bin/sh

if test -d ~/.tmux/plugins/tpm; then
	cd "$_" && git pull
else
	mkdir -p ~/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
