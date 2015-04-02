# Include .bashrc files
for CONFIG_FILE in $HOME/.dotfiles/bash/*.sh
do
  source $CONFIG_FILE
done
