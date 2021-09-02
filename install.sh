#!/usr/bin/env bash
###################################
# This script creates symlinks from the hoke directory to any desired dotfiles in ${homedir}/dotfiles
###################################

# error handling
set -eu

is_app_installed(){
    type "$1" &>/dev/null
}

# how to use this script
if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

if ! is_app_installed tmux; then
    printf "Warning: \"tmux\" command is not found. \
            install it first\n"
    exit 1
fi

homedir=$1

# dotfiles directory
dotfiledir=${homedir}/dotfiles
bundle=${homedir}/.vim/bundle

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc vimrc.tmux.conf gitconfig"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks
# NOTE: will overwrite old dotfiles
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# source.tmux.conf
echo "Sourcing.tmux.conf..."
tmux source-file ${homedir}/.tmux.conf
echo "...finished sourcing"

# installing vim plugins
echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ${homedir}/.vim/bundle/Vundle.vim

echo "Installing Vim Plugins via Vundle"
vim +PluginInstall +qall
