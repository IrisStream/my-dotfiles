#!/bin/bash

# uninstall vim

sudo apt remove --purge -y vim

sudo apt autoremove -y

# install nvim
sudo apt -y install neovim

# copy vim config file to ~/.config
cp -r ./nvim ~/.config/

# install vundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
vim -c 'qa!'
vim +PluginInstall +qall
