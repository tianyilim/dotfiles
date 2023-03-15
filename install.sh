#!/bin/bash

# Sets aside exisitng config files, if they exist, and replaces them with the new files 
# inside this folder.

set +e
# I also use YCM so you will need this part.
sudo apt install build-essential cmake vim-nox python3-dev
sudo apt install mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm # I don't think these are necessary...

if [ -f ~/.vimrc ]; then
    echo "~/.vimrc moved to ~/.vimrc_cp."
    mv ~/.vimrc ~/.vimrc_cp
fi
ln -s $(pwd)/vimrc ~/.vimrc

vim # This should open vim. Close it after plugins are installed.

cd ~/.vim/plugged/youcompleteme
python3 install.py --all

if [ -f ~/.bashrc ]; then
    echo "~/.bashrc moved to ~/.bashrc_cp."
    mv ~/.bashrc ~/.bashrc_cp
fi
ln -s $(pwd)/bashrc ~/.bashrc


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

