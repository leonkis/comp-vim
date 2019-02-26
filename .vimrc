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



" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



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

"filetype plugin on





"autocmd Filetype python setlocal ts=2 sts=2 sw=2

syntax enable

vmap <D-j> gj
vmap <D-k> gk
nmap <C-j> gj
nmap <C-k> gk

:nnoremap <Leader>mm :let &scrolloff=999-&scrolloff<CR>

"This ensures double brackets when typing just one:
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap [			[]<Left>
inoremap [<CR>	[<CR>]<Esc>O
inoremap [[			[
inoremap []			[]
inoremap (			()<Left>
inoremap (<CR>	(<CR>)<Esc>O
inoremap ((			(
inoremap ()			()
inoremap <			<><Left>
inoremap <<CR>	<<CR>><Esc>O
inoremap <<			<
inoremap <>			<>


" This disables auto comment insertion:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Runtime path manipulation (pathogen):
execute pathogen#infect()

" Open nerdtree:
nmap <F2> :NERDTreeToggle<CR>

" When searching highlight found words:
set hlsearch

" Fixes UltiSnipsEdit creating directory in the wrong path:
let g:UltiSnipsSnippetDirectories = ['~/.vim/bundle/vim-snippets/UltiSnips', 'UltiSnips']

" Remapped the ultisnips triggers:

" This makes sure Vim recognized LaTeX instead of plain TeX:
let g:tex_flavor = "latex"

" Disable arrow keys:
noremap <Up> <Nop>
inoremap <Up> <Nop>
noremap <Down> <Nop>
inoremap <Down> <Nop>
noremap <Left> <Nop>
inoremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Right> <Nop>

"Bind to save command:
map <F3> :w! <CR>

"Unforce word-wrapping:
set textwidth=0
set wrapmargin=0

"Remove delays while pressing esc key:
set timeoutlen=1000 ttimeoutlen=0

"Open at last line:
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	    \| exe "normal! g'\"" | endif
endif

"Constantly print file path:
set laststatus=2
set statusline+=%F

"Move lines with ctrl-j and ctrl-k:
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

