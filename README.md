# Buffet

This is the set of dotfiles I'm using on my development machine.

These configurations assume up-to-date versions of the following tools:
- Bash
- Vim
- Git

## Usage

First, edit `dotfiles/bashrc_base` and `dotfiles/vimrc_base` to point to the
directory where this repo lives.

Next,
```sh
cp dotfiles/bash_profile ~/.bash_profile
cp dotfiles/bashrc_base ~/.bashrc
cp dotfiles/vimrc_base ~/.vimrc
```

## Thanks

Thanks Bendyworks for getting me started (both in dotfiles and in software in general).
I originally forked this project from their excellent
[dotfiles](https://github.com/bendyworks/buffet), then deviated drastically to suit my
new requirements and preferences.

So many lines are cribbed from [Josh][2]'s dotfiles that I lost count. He is
the workflow avatar.

[2]: https://github.com/losingkeys
