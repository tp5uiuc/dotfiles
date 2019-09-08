#!/usr/bin/env sh

download_hosts() {
	BLACK_URL="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts"
	TOPSIFY_URL="https://raw.githubusercontent.com/zackad/dotfiles/master/hosts.d/ads_spotify.conf"
	mkdir -p /tmp/hosts.d/
	curl -L -s -o /tmp/hosts.d/steven_black.host "$BLACK_URL"
	curl -L -s -o /tmp/hosts.d/topsify.host "$TOPSIFY_URL"

	unset BLACK_URL TOPSIFY_URL
}

cat_hosts() {
	cat /tmp/hosts.d/*.host >/tmp/hosts.d/master.hosts
	echo '#DOTFILE_HOSTS#' | cat - /tmp/hosts.d/master.hosts >/etc/hosts && rm -fr /tmp/hosts.d/master.hosts
}

if [ $(id -u) -eq 0 ]; then
	# If dotfiles, don't create a backup
	test "$(head -n1 /etc/hosts)" = '#DOTFILE_HOSTS#' || mv /etc/hosts /etc/hosts.bkup
	download_hosts
	cat_hosts
else
	echo "Please run hosts as root"
	exit 1
fi
unset download_hosts cat_hosts
