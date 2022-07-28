" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" formatting rules for ROS
set shiftwidth=2  " Two space indents
set tabstop=2     " Tab key indents two spaces at a time
set expandtab     " Use spaces when the <Tab> key is pressed
set cindent       " Turn on automatic C-code indentation
set smarttab

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" This sets the timeout length for ESC (for responsive exit from
" INSERT->NORMAL mode)
set timeoutlen=1000
set ttimeoutlen=50

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Mappings for tmux-style pane splitting (but with <C-w> as leader)
" This is how TY configures his splitting 
nnoremap <C-w><bar> <C-w>v  
nnoremap <C-w>- <C-w>s
" Emulate the 'Z' zoom functionality of Tmux
nnoremap <C-w>z <C-w>_
" And capital Z to return to equalized splits
nnoremap <C-w>Z <C-w>=

" Mappings for Vim Tabs
" Empty new window, with file explorer 
nnoremap <C-w>c :tabnew<CR>:NERDTree<CR> 
" Toggle between windows (use {i}gt to get to a specific one)
nnoremap <C-w>L gT
nnoremap <C-w>H gt

" Mappings to move lines up and down ala VS Code
" Press ALT + j/k to move a line up and down.
" These two lines of code are needed to remap the ALT key (which somehow
" produces an ESCAPE character) to their desired functionality.
execute "set <A-j>=\ej"
execute "set <A-k>=\ek"
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Plugin manager (vim-plug)
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'wakatime/vim-wakatime'
Plug 'taketwo/vim-ros'

Plug 'ryanoasis/vim-devicons'	" Dev Icons should always be the last plugin loaded
call plug#end()

" Settings necessary for vim-devicons
set encoding=UTF-8
" An example of how to set vim fonts
" set guifont=<FONT_NAME> <FONT_SIZE>
set guifont=DroidSansMono\ Nerd\ Font\ 11
