dotfiles
========

Simple dotfiles that includes mainly `vim`, `bash` and `tmux` stuff.

## Screenshot

![vim screenshot](https://raw.githubusercontent.com/andreazevedo/dotfiles/screenshots/vim01.png)

## Installation

```shell
sh -c "`curl -fsSL https://raw.github.com/andreazevedo/dotfiles/master/install.sh`"
```

### Fonts for neovim

If using neovim via ssh, you have to install NerdFonts to see the cool icons in
the neo-tree:

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip

fc-cache -fv
```

## What's included?

Read on and find out!

### Tmux configuration

Nice and sane configuration is provided with `tmux.conf`, including:
 - Powerful status bar (see [screenshot](#screenshot)).
 - Screen like binding (`Ctrl-a` instead of `Ctrl-b` as the prefix).
 - vim keybindings.

### Mercurial configuration

Sane defaults and some nice and pretty alias:
 - `hg l`: similar to `hg log`, but with nice format and colors.
 - `hg gl`: similar to `hg glog`, but also with nice format and colors.
