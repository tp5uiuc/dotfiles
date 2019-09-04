#!/usr/bin/env sh

function version(){
	echo "$@" | awk -F'.' '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'
}

# If MacOS, determine version
if [ "$(uname -s)" = "Darwin" ]; then #MacOS
	macos_version=$(sw_vers | awk '/ProductVersion/ {print $2}')

	# For newer versions of MacOS, we need slightly different formulae
	# See https://superuser.com/a/1155833
	if [ $(version ${macos_version}) -ge $(version "10.12.2") ]; then
		config_file="config.macos.sierra"
	else
		config_file="config.macos.elcapitan"
	fi
else #Linux
	config_file="config.linux"
fi

test -L ~/.ssh/config || {
	mv ~/.ssh/config ~/.ssh/config.local
	ln -s "$DOTFILES"/ssh/"${config_file}" ~/.ssh/config
}
test -f ~/.ssh/config.local || touch ~/.ssh/config.local

unset version macos_version config_file
