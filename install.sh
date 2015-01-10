#!/bin/sh

# Only run on first install
if [ ! -d "$HOME/.dotfiles" ]; then
  echo "Installing andreazevedo/dotfiles for the first time."

  echo "Installing dependencies."
  if hash brew 2> /dev/null; then
    brew update
    brew install git cmake macvim
  elif hash apt-get 2> /dev/null; then
    sudo apt-get update
    sudo apt-get install git cmake build-essential python-dev
  elif hash yum 2> /dev/null; then
    sudo yum install git cmake vim gcc clang
  fi

  git clone https://github.com/andreazevedo/dotfiles.git "$HOME/.dotfiles"
  cd "$HOME/.dotfiles"
fi


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

# Install tmux.conf
if [ -f "$HOME/.tmux.conf" ]; then
  if [ -f "$HOME/.tmux.conf.bkp" ]; then
    rm -f "$HOME/.tmux.conf.bkp"
  fi
  mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bkp"
fi
echo source \$HOME/.dotfiles/tmux.conf > $HOME/.tmux.conf

# Install vimrc
if [ -f "$HOME/.vimrc" ]; then
  if [ -f "$HOME/.vimrc.bkp" ]; then
    rm -f "$HOME/.vimrc.bkp"
  fi
  mv "$HOME/.vimrc" "$HOME/.vimrc.bkp"
fi
echo source \$HOME/.dotfiles/vimrc > $HOME/.vimrc

# Install vim plugins
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
echo "Installing vim plugins. This may take some time."
vim +PluginInstall +qall

# Finishing
echo "dotfiles installed successfully!"
