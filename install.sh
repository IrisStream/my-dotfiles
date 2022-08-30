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

# Install tmux vim select pane plugin
sudo curl -fsSL https://raw.github.com/mislav/dotfiles/1500cd2/bin/tmux-vim-select-pane \
  -o /usr/local/bin/tmux-vim-select-pane

sudo chmod +x /usr/local/bin/tmux-vim-select-pane

###############
#    BASH     #
###############
cp ./config/bashrc ~/.bashrc
