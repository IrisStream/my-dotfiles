#!/bin/bash

# update system

sudo apt update

###############
#   NEO-VIM   #
###############

# uninstall vim

sudo apt remove --purge -y vim

sudo apt autoremove -y

# install nvim
sudo apt -y install neovim

# copy vim config file to ~/.config
cp -r ./config/nvim ~/.config/

# install vundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
vim -c 'qa!'
vim +PluginInstall +qall


###############
#    TMUX     #
###############

# install tmux
sudo apt install -y tmux

# copy tmux config to $HOME
cp ./config/tmux.conf ~/.tmux.conf
