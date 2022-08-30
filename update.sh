#!/bin/bash

# Remove old configs

rm -rf ./config/*

#Update new vim configs
cp -r ~/.config/nvim ./config/nvim

# Update new tmux config
cp ~/.tmux.conf ./config/tmux.conf

# Update bashrc
cp ~/.bashrc ./config/bashrc
sed -i '/>>> conda initialize >>>/,/<<< conda initialize <<</d' ./config/bashrc
