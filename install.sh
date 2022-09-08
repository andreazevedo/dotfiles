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
    sudo apt-get install git cmake build-essential python-dev clang-format vim-nox python3-dev
  elif hash yum 2> /dev/null; then
    sudo yum install git cmake vim gcc clang python3-devel cmake3
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

# Install YouCompleteMe
echo "Installing YouCompleteMe."
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer

# Finishing
echo "dotfiles installed successfully!"
