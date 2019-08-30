#!/usr/bin/env bash

# Needed for pattern matching
shopt -s extglob;

echo "echoed ${DOTFILES}"
# all of our sh and bash files
config_files=($DOTFILES/**/*.?(ba)sh)
echo "echoed ${config_files[@]}"

# Pattern matching seems to be painful, hence find
# path files separately
# load the path files
path_files=($DOTFILES/**/path.?(ba)sh)
for path_file in ${path_files[@]}; do
  [[ -r "$path_file" && -f "$path_file" ]] && echo "$path_file";
done;
unset path_files path_file
echo "echoed pathfiles"

# load everything but the path, completion and install files
other_files=(${config_files[@]//*path.?(ba)sh})
other_files=(${other_files[@]//*completion.bash})
other_files=(${other_files[@]//*install.sh})
for other_file in ${other_files[@]}; do
  [[ -r "$other_file" && -f "$other_file" ]] && echo "$other_file";
done;
unset other_files other_file
echo "echoed otherfiles"

# Be a good boy and unset
shopt -u extglob;

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
# shellcheck disable=SC1090
[ -f ~/.localrc -a -r ~/.localrc ] && . ~/.localrc
