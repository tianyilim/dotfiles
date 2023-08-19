#!/bin/bash
set +e

# Setup fonts to be used for Alacritty
cp RobotoMonoNerdFontMono-Regular.ttf ~/.local/share/fonts/

# Install the packages that I usually use in a fresh Linux install
sudo apt update
sudo apt -y upgrade
sudo apt install tmux ranger highlight xclip python3-pip

# I have configured my bashrc to alias Ranger to do something slightly different, so copy ranger configs now.
ranger --copy-config=all

# I also use YCM so you will need this part.
sudo apt install build-essential cmake vim-nox python3-dev
sudo apt install mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm

if [ -f ~/.vimrc ]; then
    echo "~/.vimrc moved to ~/.vimrc_cp."
    mv ~/.vimrc ~/.vimrc_cp
fi
ln -s $(pwd)/vimrc ~/.vimrc

# This should open vim. Close it after plugins are installed.
vim 

# Complete YCM Setup
cd ~/.vim/plugged/youcompleteme
python3 install.py --all
cd ~/dotfiles

# Install Powerline
pip install --user powerline-status

# Sets aside exisitng config files, if they exist, and replaces them with the new files 
# inside this folder.
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

