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

Plugin 'https://github.com/scrooloose/nerdtree.git'

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
inoremap "      ""<Left>
inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     "


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
"inoremap <C-j> <Esc>:m .+1<CR>==gi
"inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Sorts numbers in ascending order.
" Examples:
" [2, 3, 1, 11, 2] --> [1, 2, 2, 3, 11]
" ['2', '1', '10','-1'] --> [-1, 1, 2, 10]
function! Sorted(list)
  " Make sure the list consists of numbers (and not strings)
  " This also ensures that the original list is not modified
  let nrs = ToNrs(a:list)
  let sortedList = sort(nrs, "NaturalOrder")
  echo sortedList
  return sortedList
endfunction

" Comparator function for natural ordering of numbers
function! NaturalOrder(firstNr, secondNr)
  if a:firstNr < a:secondNr
    return -1
  elseif a:firstNr > a:secondNr
    return 1
  else 
    return 0
  endif
endfunction

" Coerces every element of a list to a number. Returns a new list without
" modifying the original list.
function! ToNrs(list)
  let nrs = []
  for elem in a:list
    let nr = 0 + elem
    call add(nrs, nr)
  endfor
  return nrs
endfunction

function! WordFrequency() range
  " Words are separated by whitespace or punctuation characters
  let wordSeparators = '[[:blank:][:punct:]]\+'
  let allWords = split(join(getline(a:firstline, a:lastline)), wordSeparators)
  let wordToCount = {}
  for word in allWords
    let wordToCount[word] = get(wordToCount, word, 0) + 1
  endfor

  let countToWords = {}
  for [word,cnt] in items(wordToCount)
    let words = get(countToWords,cnt,"")
    " Append this word to the other words that occur as many times in the text
    let countToWords[cnt] = words . " " . word
  endfor

  " Create a new buffer to show the results in
  new
  setlocal buftype=nofile bufhidden=hide noswapfile tabstop=20

  " List of word counts in ascending order
  let sortedWordCounts = Sorted(keys(countToWords))

  call append("$", "count \t words")
  call append("$", "--------------------------")
  " Show the most frequent words first -> Descending order
  for cnt in reverse(sortedWordCounts)
    let words = countToWords[cnt]
    call append("$", cnt . "\t" . words)
  endfor
endfunction

command! -range=% WordFrequency <line1>,<line2>call WordFrequency()

set ignorecase
