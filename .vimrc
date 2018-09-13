""""""""""""""""""
"""""VUNDLE"""""""
""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Possibly to enable Vundle with Zsh:
set shell=/bin/bash



set guifont=Monaco:h20
set number
filetype indent on
set tabstop=2
set shiftwidth=2
" set expandtab
set smartindent
set autoindent
set relativenumber
" set wrap linebreak nolist


"""IMPORTANT! Perhaps this needs to be turned on:

" filetype plugin on




"autocmd Filetype tex setlocal textwidth=76
"autocmd Filetype html setlocal textwidth=72

"autocmd Filetype python setlocal ts=2 sts=2 sw=2

syntax enable

vmap <D-j> gj
vmap <D-k> gk
nmap <C-j> gj
nmap <C-k> gk

:nnoremap <Leader>mm :let &scrolloff=999-&scrolloff<CR>

" This disables auto comment insertion:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
