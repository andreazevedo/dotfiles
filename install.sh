#!/bin/sh

# Only run on first install
if [ ! -d "$HOME/.dotfiles" ]; then
  echo "Installing andreazevedo/dotfiles for the first time."

  echo "Installing dependencies."
  if hash brew 2> /dev/null; then
    brew update
    brew install git cmake macvim clang-format
  elif hash apt-get 2> /dev/null; then
    sudo apt-get update
    sudo apt-get install git cmake build-essential python-dev clang-format python3-dev clangd clang-format npm
  elif hash yum 2> /dev/null; then
    sudo yum install git cmake gcc clang python3-devel cmake3 clangd clang-format npm
  fi

  git clone https://github.com/andreazevedo/dotfiles.git "$HOME/.dotfiles"
  cd "$HOME/.dotfiles"
fi


# Install necessary npm packets
sudo npm install -g prettier

# Install bashrc
if [ -f "$HOME/.bashrc" ]; then
  if [ -f "$HOME/.bashrc.bkp" ]; then
    rm -f "$HOME/.bashrc.bkp"
  fi
  mv "$HOME/.bashrc" "$HOME/.bashrc.bkp"
fi
echo source \$HOME/.dotfiles/bashrc > $HOME/.bashrc

# Install gitconfig
if [ -f "$HOME/.gitconfig" ]; then
  if [ -f "$HOME/.gitconfig.bkp" ]; then
    rm -f "$HOME/.gitconfig.bkp"
  fi
  mv "$HOME/.gitconfig" "$HOME/.gitconfig.bkp"
fi
echo "[include]
  path = ~/.dotfiles/gitconfig" > $HOME/.gitconfig

# Install hgrc
if [ -f "$HOME/.hgrc" ]; then
  if [ -f "$HOME/.hgrc.bkp" ]; then
    rm -f "$HOME/.hgrc.bkp"
  fi
  cp "$HOME/.hgrc" "$HOME/.hgrc.bkp"
fi
echo "
%include ~/.dotfiles/mercurial/hgrc" >> $HOME/.hgrc

# Install tmux.conf
if [ -f "$HOME/.tmux.conf" ]; then
  if [ -f "$HOME/.tmux.conf.bkp" ]; then
    rm -f "$HOME/.tmux.conf.bkp"
  fi
  mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bkp"
fi
echo source \$HOME/.dotfiles/tmux.conf > $HOME/.tmux.conf

# Install nvimrc
mkdir $HOME/.config/nvim
if [ -f "$HOME/.config/nvim/init.lua" ]; then
  if [ -f "$HOME/.config/nvim/init.lua.bkp" ]; then
    rm -f "$HOME/.config/nvim/init.lua.bkp"
  fi
  mv "$HOME/.config/nvim/init.lua.bkp" "$HOME/.config/nvim/init.lua.bkp"
fi
echo "dofile(\"$HOME/.dotfiles/nvim/init.lua\"" > $HOME/.config/nvim/init.lua
ln -s "$HOME/.dotfiles/nvim/lua/" "$HOME/.config/nvim/lua"

# Finishing
echo "dotfiles installed successfully!"
