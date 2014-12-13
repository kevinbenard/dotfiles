filetype off
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'L9'
Plugin 'FuzzyFinder'
"Plugin 'accelerated-smooth-scroll'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'amdt/vim-niji'
Plugin 'mhinz/vim-startify'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'bkad/CamelCaseMotion'
Plugin 'haya14busa/incsearch.vim'

call vundle#end()
filetype plugin indent on

" Fix :W typo
cmap W w
"Make it so it doesn't complain about hidden buffers 
set hidden

" Syntax and filetype setting stuff
syntax on
syntax enable

set mouse=a
set showmode
set wildmenu
set wrap
set encoding=utf-8

" Theme
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"font
"set guifont=Consolas\ for\ Powerline\ FixedD:h9

set autoread
" Makes the screen scroll when there's 8 lines at the top
" or bottom
set scrolloff=8

" Switch to the current working directory
set autochdir

" Disable system beep
set noeb

" Set 'jj' as escape sequence
inoremap jj <ESC>

" Indenting, tabbing, and search stuff
" set autoindent
set cindent
set smarttab
set smartindent
set cursorline
set hlsearch

" Disable the arrow keys because they're crap
nnoremap <up> <nop> 
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Setting backup dir stuff
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Set persistent undo
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer

" Setting various tab and other stuff
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround
set showmatch
set relativenumber
set number
set ruler
set ttyfast
set colorcolumn=80
"set columns=80

" Make backspace work as you think it should
set backspace=indent,eol,start
fixdel

" This is overriden by Powerline but kept in case I go back
"set statusline=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" Always show a status line
set laststatus=2
"make the command line 1 line high
set cmdheight=1

" Change tab key to go between brackets
nnoremap <Tab> %
vnoremap <Tab> %

" ctags niceties
map <F5> :!ctags -R --c-kinds=+defgstvp --fields=+inaSt .<CR>
map <F4> :TagbarToggle<CR>
set tags=./tags;/

" Shows the full function instead of just the name
set showfulltag

" Mapping for creating/closing/navigating tabs easier
map <C-left> :bprevious<CR>
map <C-right> :bnext<CR>
map <C-up> :tabnew<CR>
map <C-down> :bdelete<CR>
map <C-S-down> :bd!<CR>

" Opening/Closing the NERDTree
map <F2> <ESC>:NERDTreeToggle<RETURN>

" Open CtrlP for fuzzy file/buffer searching and opening
map ` <ESC>:CtrlPMixed<RETURN>

" Y copies the highlighted portion into the system clipboard
vnoremap Y "+y
" Map CTRL-A to select the whole file to the system clipboard
nmap <C-a> :%y+ <CR>

" Open .vimrc
map <f12> <ESC>:e ~/.vimrc<RETURN>

" Remove highlighting
nnoremap <F3> :noh<CR>

" Opens up FuzzyFinder for the current file
" for searching text
map <C-x> :FufLine <CR>

" Tab indent/unindent a selection with tab key
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 2

" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Set CtrlP settings
let g:ctrlp_working_path_mode = 'c'
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \}

let g:niji_match_all_filetypes = 1

let g:startify_session_dir = '~/.vim/sessions'
let g:startify_lists = ['files','sessions','dir']

let NERDTreeIgnore = ['\.o$','\.a$']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

map / <Plug>(incsearch-forward)
