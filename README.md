# Dotfiles

[![License][lb]][ll]
[![Pipeline Status][pb]][pl]
[![Powered by Antibody][ab]][ap]

> Personal configuration files for *sh, Editors, Tmux, Terminals and more.

![screenshot 1][scrn1]

[lb]: https://img.shields.io/badge/license-MIT-blue.svg
[ll]: https://gitlab.com/parthas1/dotfiles/blob/master/LICENSE.md
[ab]: https://img.shields.io/badge/powered%20by-antibody-blue.svg?style=flat-square
[ap]: https://github.com/getantibody/antibody
[pb]: https://gitlab.com/parthas1/dotfiles/badges/master/pipeline.svg
[pp]: https://gitlab.com/parthas1/dotfiles/commits/master
[scrn1]: /docs/screenshot.png

## Installation

### Dependencies

First, make sure you have all those things installed:

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `zsh`: to actually run the dotfiles
- `sudo`: some configs may need that

### Install

Then, run these steps:

```console
$ git clone https://github.com/caarlos0/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./script/bootstrap
$ zsh # or just close and open your terminal again.
```
> All changed files will be backed up with a `.backup` suffix.

## Thanks

Inspired from [carlos' dotfiles](https://github.com/caarlos0/dotfiles)
