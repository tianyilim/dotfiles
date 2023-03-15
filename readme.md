# Dotfiles

Contains dotfiles (Configuration files) for:
- `.alacritty.yml`: Alacritty (terminal emulator)
- `.bashrc`: Bash configuration files
- `.tmux.conf`: Tmux configuration files and keybindings
- `.vimrc`: Vim config files

## Usage:
1. Clone this repo
2. Make a backup of your personal config files
3. Delete your personal config files
4. Create a symlink from this repo to where the dotfile should be. 
5. An easy way to change the Alacritty theme is with [`alacritty-themes`](https://www.funkyspacemonkey.com/how-to-easily-apply-and-change-alacritty-themes). Follow instructions to NPM install this package.


For example:
`ln -s <PATH_TO_REPO>/.bashrc ~/.bashrc`

## Dependencies
- I used the patched fonts from the [Vim Dev Icons](https://github.com/ryanoasis/vim-devicons) extension. Do download and install the patched version of `RobotoMono Nerd Font`. Or just change the value in the [`alacritty.yml`](.alacritty.yml) file under `font`.
- I installed the YouCompleteMe extension. Follow along their entire install process.

## TODO:
- Add a shell script that auto-installs (or replaces) the files in the user's Home folder
- Add a shell script that installs the relevant dependencies (like fonts)
- Documentation of keybindings
