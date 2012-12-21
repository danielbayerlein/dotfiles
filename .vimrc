set nocompatible " Make Vim more useful

" Vundle, the plug-in manager for Vim
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'Lokaltog/vim-easymotion'

filetype plugin indent on " Enable filetype plugins

set encoding=utf-8    " Set utf-8 as standard encoding
set clipboard=unnamed " Use the OS clipboard by default
set wildmenu          " Wild char completion menu
set mouse=a           " Enable mouse in all modes
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
set list         " Display unprintable characters
set listchars=tab:→\ ,trail:·,extends:»,precedes:«

set visualbell   " Don't beep
set noerrorbells " Don't beep

" Change the mapleader from '\' to ','
let mapleader=','
let g:mapleader=','

let NERDTreeShowHidden=1
map <Leader>n :NERDTreeToggle<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

au BufWritePre * :set binary | set noeol
au BufWritePost * :set nobinary | set eol

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

" Backup / Swap File
set nobackup   " Do not keep backup files
set noswapfile " Do not write annoying intermediate swap files

" Default color scheme
set t_Co=256 " 256 color mode
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
" set guifont=Monaco:h12

" Powerline
set guifont=Monaco\ for\ Powerline:h12
let g:Powerline_symbols='fancy'
" let g:Powerline_theme='solarized256'
let g:Powerline_colorscheme='solarized256'
let g:Powerline_stl_path_style='short'
