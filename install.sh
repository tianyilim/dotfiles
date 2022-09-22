#!/bin/bash

# Sets aside exisitng config files, if they exist, and replaces them with the new files 
# inside this folder.

if [ -f ~/.bashrc ]; then
    echo "~/.bashrc moved to ~/.bashrc_cp."
    mv ~/.bashrc ~/.bashrc_cp
fi
ln -s $(pwd)/bashrc ~/.bashrc

if [ -f ~/.vimrc ]; then
    echo "~/.vimrc moved to ~/.vimrc_cp."
    mv ~/.vimrc ~/.vimrc_cp
fi
ln -s $(pwd)/vimrc ~/.vimrc

if [ -f ~/.tmux.conf ]; then
    echo "~/.tmux.conf moved to ~/.tmux.conf_cp."
    mv ~/.tmux.conf ~/.tmux.conf_cp
fi
ln -s $(pwd)/tmux.conf ~/.tmux.conf

if [ -f ~/.alacritty.yml ]; then
    echo "~/.alacritty.yml moved to ~/.alacritty.yml_cp."
    mv ~/.alacritty.yml ~/.alacritty.yml_cp
fi
ln -s $(pwd)/alacritty.yml ~/.alacritty.yml