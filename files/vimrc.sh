""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General "
" Automatically detect file types. "
filetype on
syntax enable

" no vi compatibility. "
set nocompatible

" Add recently accessed projects menu (project plugin) "
set viminfo^=\!

" Minibuffer Explorer Settings "
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix "
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Enable error files & error jumping. "
set cf

" Yanks go on clipboard instead. "
set clipboard+=unnamed

" Number of things to remember in history. "
set history=256

" Writes on make/shell commands "
set autowrite

" Ruler on "
set ruler

" Line numbers on "
set nu

" Line wrapping off "
set nowrap

" Time to wait after ESC (default causes an annoying delay) "
set timeoutlen=250

" colorscheme vividchalk "
" Uncomment this to set a default theme "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting "

" Tabs are 2 spaces "
set ts=2

" Backspace over everything in insert mode "
set bs=2

" Tabs under smart indent "
set shiftwidth=2
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual "

" Show matching brackets. "
set showmatch

" Bracket blinking. "
set mat=5
set list

" No blinking . "
set novisualbell

" No noise. "
set noerrorbells

" Always show status line. "
set laststatus=2
