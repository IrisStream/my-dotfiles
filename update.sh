#!/bin/bash

# Remove old configs

rm -rf ./config/*

#Update new vim configs
cp -r ~/.config/nvim ./config/nvim

# Update new tmux config
cp ~/.config/.tmux.conf ./config/tmux.conf
