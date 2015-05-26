set nocompatible " Make Vim more useful

" Vundle, the plug-in manager for Vim
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Essential Plugins
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/syntastic'
Bundle 'tsaleh/vim-supertab'
Bundle 'tpope/vim-endwise'
Bundle 'Townk/vim-autoclose'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'moll/vim-bbye'
Bundle 'matze/vim-move'

" Syntax highlighting
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'vim-ruby/vim-ruby'
Bundle 'nono/vim-handlebars'

filetype plugin indent on " Enable filetype plugins

set encoding=utf-8    " Set utf-8 as standard encoding
set clipboard=unnamed " Use the OS clipboard by default
set wildmenu          " Wild char completion menu
set wildmode=list:longest,list:full
set mouse=a           " Enable mouse in all modes
if exists('$TMUX')
  set ttymouse=xterm2 " Support resizing in tmux
endif
set autoread          " Set to auto read when a file is changed from the outside

syntax on        " Syntax highlighting
set number       " Show line numbers
set showcmd      " Show the (partial) command as it’s being typed
set laststatus=2 " Always show status line
set title        " Change the terminal's title
set ruler        " Show the cursor position all the time
set cursorline   " Highlight current line
set showmatch    " Cursor shows matching ) and }
set showmode     " Show the current mode
if version >= 703
  set colorcolumn=80
endif

" Display unprintable characters
set list listchars=tab:→\ ,trail:·,extends:»,precedes:«

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set hidden " Buffers are hidden instead of closed

set visualbell   " Don't beep
set noerrorbells " Don't beep

" Change the mapleader from '\' to ','
let mapleader=','
let g:mapleader=','

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '^\.DS_Store$', '^\.bundle$', '^\.git$', '^\.sass-cache$']
let g:nerdtree_tabs_open_on_console_startup=1
map <Leader>n :NERDTreeToggle<CR>

" Bbye (Buffer Bye) for Vim
:nnoremap <Leader>q :Bdelete<CR>

" Easy split navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" vim-move
let g:move_map_keys=0
vmap º <Plug>MoveBlockDown
vmap ∆ <Plug>MoveBlockUp
nmap º <Plug>MoveLineDown
nmap ∆ <Plug>MoveLineUp

" Automatically removing all trailing whitespace
autocmd FileType coffee,javascript,ruby,haml,scss autocmd BufWritePre <buffer> :%s/\s\+$//e

" Indentation settings
set nowrap       " Don't wrap lines
set expandtab    " Replace <TAB> with spaces
set tabstop=2
set shiftwidth=2 " Number of spaces to use for autoindenting
set softtabstop=2

" Searching
set hlsearch   " Search highlighting
set incsearch  " Incremental search
set ignorecase " Ignore case when searching
set smartcase  " Ignore case if search pattern is all lc, cs or otherwise

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
endif

" CtrlP
let g:ctrlp_show_hidden=1

" Backup / Swap File
set nobackup   " Do not keep backup files
set noswapfile " Do not write annoying intermediate swap files

" Default color scheme
let base16colorspace=256 " Access colors present in 256 colorspace
set t_Co=256 " 256 color mode
set background=dark
colorscheme base16-ocean

" Vim Git Gutter
highlight clear SignColumn

" vim-airline
let g:airline_theme='base16'
let g:airline_powerline_fonts=1
set guifont=Monaco\ for\ Powerline:h12
set noshowmode

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
