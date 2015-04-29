#!/bash/sh

# Include .bashrc files
for CONFIG_FILE in $HOME/.dotfiles/bash/*.sh
do
  . $CONFIG_FILE
done
