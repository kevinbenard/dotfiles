" Prepare for Vundle
filetype off
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""""""""""""""""
"           PLUGINS            "
""""""""""""""""""""""""""""""""
Plugin 'gmarik/Vundle.vim'         "Plugin manager
Plugin 'Lokaltog/vim-easymotion'   "Adds extended movement motions
Plugin 'L9'                        " VimScript library functions (required by FuzzyFinder)
Plugin 'FuzzyFinder'               "Fuzzy searching in the file
Plugin 'kien/ctrlp.vim.git'        "Fuzzy file/buffer opener
Plugin 'scrooloose/nerdtree'       "Tree file browser
Plugin 'scrooloose/nerdcommenter'  "Commenting plugin
Plugin 'mhinz/vim-startify'        "Adds list of recent and CWD files on startup
Plugin 'majutsushi/tagbar'         "Displays symbols for current file (ctags)
Plugin 'bling/vim-airline'         "Pretty status/tabline
Plugin 'bkad/CamelCaseMotion'      "Add motions for camel-case words
Plugin 'haya14busa/incsearch.vim'  "Nicer/faster incsearch
Plugin 'kshenoy/vim-signature'     "Displays current marks into the vim gutter
Plugin 'junegunn/vim-easy-align'   "Nice alignment plugin
Plugin 'terryma/vim-expand-region' "Easy highlighting of blocks
Plugin 'ervandew/supertab'         "Easier completion with Tab
Plugin 'sheerun/vim-polyglot'      "Filetype plugins for lots of languages
Plugin 'tpope/vim-surround'        "Easy add/remove/modify of brackets/parens/tags
Plugin 'modess/molokai'            "Colorscheme
Plugin 'nanotech/jellybeans.vim'   "Colorscheme
Plugin 'scrooloose/Syntastic'      "Syntax checker
Plugin 'luochen1990/rainbow'       "Adds rainbow coloured parentheses/brackets
Plugin 'Raimondi/delimitMate'      "Adds completion for end quotes/parens/brackets
Plugin 'bufkill.vim'               "Adds :BD,:BUN to not close the window
Plugin 'Valloric/YouCompleteMe'    "Autocompletion plugin

call vundle#end()
filetype plugin indent on
" End Vundle

""""""""""""""""""""""""""""""""
"         VIM SETTINGS         "
""""""""""""""""""""""""""""""""

" Change <Leader> to <Space>
let mapleader = "\<Space>"
" Set terminal vim to be faster
set timeoutlen=1000
set ttimeoutlen=0

"Make it so it doesn't complain about hidden buffers 
set hidden

" Syntax and filetype setting stuff
syntax on
syntax enable

" Enable mouse when supported
set mouse=a
" Show current mode (normal,insert,visual)
set showmode
" Show current command in statusline)
set showcmd
" Turn on the wildmenu
set wildmenu
" Wrap lines at EOL
set wrap
" UTF-8 encoding
set encoding=utf-8

" Theme settings
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set background=dark
"let g:solarized_termcolors=256
"let g:airline_theme = 'powerlineish'
"colorscheme molokai
colorscheme jellybeans
"let g:rehash256 = 1
highlight SignColumn ctermbg=black

"font
"set guifont=Consolas\ for\ Powerline\ FixedD:h9

" Automatically read in file if externally modified
set autoread
" Makes the screen scroll when there's 8 lines at the top
" or bottom
set scrolloff=8

" Switch to the current working directory
set autochdir

" Disable system beep
set noeb

" Indenting, tabbing, and search stuff
" set autoindent
set cindent
set smarttab
set smartindent
set cursorline
"set hlsearch

" Setting backup dir stuff
set backup
set backupdir=~/.vim/backup
" Swap files are more hassle than they're worth
set noswapfile

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
" Show relative line number and absolute line number
set relativenumber
set number
" Enable ruler (character column, percent scrolled)
set ruler
" Our terminal isn't slow so don't wait
set ttyfast
" Add column at line 80
set colorcolumn=80
" Set column to wrap at
set columns=80
set textwidth=0
set wrapmargin=0

" Make backspace work as you think it should
set backspace=indent,eol,start
fixdel

" This is overriden by Powerline but kept in case I go back
"set statusline=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" Always show a status line
set laststatus=2
"make the command line 1 line high
set cmdheight=1

" Set tags director for TagBar to look for
" Looks up a directory until it finds one
set tags=./tags;/

" Shows the full function instead of just the name
set showfulltag

set list
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:~

""""""""""""""""""""""""""""""""
"       PLUGIN SETTINGS        "
""""""""""""""""""""""""""""""""

" Set CtrlP settings
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlPMixed'
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules',
  \ 'file': '\v\.(exe|so|dll)$'
  \}

" Set directory to store startify sessions
let g:startify_session_dir = '~/.vim/sessions'
" Startify shoes recently used files, files in cwd, and saved sessions
let g:startify_lists = ['files','sessions','dir']

" NerdTree should ignore .o and .a files
let NERDTreeIgnore = ['\.o$','\.a$']

" Enable tabline and buffer numbers 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

" Enable tagbar airline integration
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Use rainbow parentheses
let g:rainbow_active = 1

""""""""""""""""""""""""""""""""
"       KEY MAPPINGS           "
""""""""""""""""""""""""""""""""

" Disable the arrow keys because they're crap
nnoremap <up> <nop> 
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Set 'jj' as escape sequence
inoremap jj <ESC>

" Alternate save file mapping
nnoremap <Leader>w :w<CR>

" Change tab key to go between brackets
nnoremap <Tab> %
vnoremap <Tab> %

" Opening/Closing the NERDTree
map <F2> <ESC>:NERDTreeToggle<RETURN>

" Remove highlighting
nnoremap <F3> :noh<CR>

" ctags niceties, F5 builds ctags, F4 opens TagBar
map <F4> :TagbarToggle<CR>
map <F5> :!ctags -R --c-kinds=+defgstvp --fields=+inaSt .<CR>

" Open Startify
map <f8> <ESC>:Startify<RETURN>

" Open .vimrc
map <f12> <ESC>:e $MYVIMRC<RETURN>

" Mapping for creating/closing/navigating tabs easier
map <C-left> :bprevious<CR>
map <C-right> :bnext<CR>
map <C-up> :tabnew<CR>
map <C-down> :bdelete<CR>
map <C-S-down> :bd!<CR>

" Y copies the highlighted portion into the system clipboard
vnoremap Y "+y
" Map CTRL-A to select the whole file to the system clipboard
nmap <C-a> :%y+ <CR>

" Tab indent/unindent a selection with tab key
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Opens up FuzzyFinder for the current file
" for searching text
map <C-x> :FufLine <CR>

" Fix :W,:Q typo, and entering ex mode by accident
cmap W w
cmap Q q
map q: :q

" Use incsearch plugin for search
map / <Plug>(incsearch-forward)

" Map Enter for alignment plugin in visual mode
vmap <Enter> <Plug>(EasyAlign)
" Map ga for alignment in normal mode
nmap ga <Plug>(EasyAlign)

" Pressing v repeatedly expands the visual selection
vmap v <Plug>(expand_region_expand)
" Ctrl-v shrinks visual selection
vmap <C-v> <Plug>(expand_region_shrink)

" Go to next/previous buffers
nnoremap <Leader>j :bn<CR>
nnoremap <Leader>k :bp<CR>

" Shortcut to select buffer to switch to
nnoremap <Leader>b :buffers<CR>:buffer<space>

" Scroll the screen without moving the cursor (4 lines instead of 1)
noremap <C-e> 4<C-e>
noremap <C-y> 4<C-y>

