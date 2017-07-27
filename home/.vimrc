" vim-plug (https://github.com/junegunn/vim-plug)
call plug#begin()

" Essential Plugins
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'vim-syntastic/syntastic'
Plug 'tsaleh/vim-supertab'
Plug 'tpope/vim-endwise'
Plug 'Townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'moll/vim-bbye'
Plug 'matze/vim-move'

" Syntax highlighting
Plug 'tpope/vim-haml'
Plug 'vim-ruby/vim-ruby'

" Color scheme
Plug 'joshdick/onedark.vim'

call plug#end()

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
if exists('+colorcolumn')
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

" NERDTree (https://github.com/scrooloose/nerdtree)
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '^\.DS_Store$', '^\.bundle$', '^\.git$', '^\.sass-cache$']
let g:nerdtree_tabs_open_on_console_startup=1
map <Leader>n :NERDTreeToggle<CR>

" vim-bbye (https://github.com/moll/vim-bbye)
:nnoremap <Leader>q :Bdelete<CR>

" Easy split navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" vim-move (https://github.com/matze/vim-move)
let g:move_map_keys=0
vmap º <Plug>MoveBlockDown
vmap ∆ <Plug>MoveBlockUp
nmap º <Plug>MoveLineDown
nmap ∆ <Plug>MoveLineUp

" Automatically removing all trailing whitespace
autocmd FileType javascript,ruby,haml,scss autocmd BufWritePre <buffer> :%s/\s\+$//e

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

" The Silver Searcher (https://github.com/ggreer/the_silver_searcher)
if executable('ag')
  " Use ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
endif

" ctrlp.vim (https://github.com/ctrlpvim/ctrlp.vim)
let g:ctrlp_show_hidden=1

" Backup / Swap File
set nobackup   " Do not keep backup files
set noswapfile " Do not write annoying intermediate swap files

" Color scheme
if has('termguicolors')
  set termguicolors
endif
silent! colorscheme onedark

" Vim Git Gutter
highlight clear SignColumn

" vim-airline (https://github.com/vim-airline/vim-airline)
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
set noshowmode

" Speed up transition from modes
if !has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
