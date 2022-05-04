#!/bin/bash

# install nvim
sudo apt -y install nvim

# copy vim config file to ~/.config
cp -r ./nvim ~/.config/

# install vundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
source ~/.config/nvim/init.vim
vim +PluginInstall +qall
