#!/usr/bin/env bash

###################################
# This script creates symlinks from the home directory to
# any desired dotfiles in ${HOMEDIR}/dotfiles.
###################################

# error handling
set -eu

is_app_installed(){
    type "$1" &>/dev/null
}

# constants
HOMEDIR=$1

# dotfiles directory
DOTFILEDIR=${HOMEDIR}/dotfiles
BUNDLE=${HOMEDIR}/.vim/bundle/

# list of FILES/folders to symlink in ${HOMEDIR}
FILES="bash_profile bashrc vimrc tmux.conf gitconfig"

# how to use this script
if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

# check if tmux is installed
if ! is_app_installed tmux ; then
    printf "Warning: \"tmux\" command is not found. \
            Install it first.\n"
    exit 1
fi

# check if vim is installed
if ! is_app_installed vim ; then
    printf "Warning: \"vim\" is not found.\
            Install it first.\n"
    exit 2
fi

# change to the dotfiles directory
echo "Changing to the ${DOTFILEDIR} directory..."
cd ${DOTFILEDIR}
echo "...done."

# create symlinks
# NOTE: will overwrite old dotFILES
for file in ${FILES}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${DOTFILEDIR}/.${file} ${HOMEDIR}/.${file}
done

# source tmux.conf
echo "Sourcing.tmux.conf..."
tmux source-file ${HOMEDIR}/.tmux.conf
echo "...finished sourcing."

# setting up Vundle 
if [ ! -d "${BUNDLE}" ]; then
    echo "Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ${BUNDLE}/Vundle.vim
else
    echo "Vundle already installed."
fi

echo "Installing Vim Plugins via Vundle"
vim +PluginInstall +qall
