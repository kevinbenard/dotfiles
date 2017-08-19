call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""
"           PLUGINS            "
""""""""""""""""""""""""""""""""
Plug 'VundleVim/Vundle.vim'         "Plugin manager
Plug 'Lokaltog/vim-easymotion'   "Adds extended movement motions
Plug 'mhinz/vim-startify'        "Adds list of recent and CWD files on startup
Plug 'majutsushi/tagbar'         "Displays symbols for current file (ctags)
Plug 'bling/vim-airline'         "Pretty status/tabline
Plug 'bkad/CamelCaseMotion'      "Add motions for camel-case words
Plug 'haya14busa/incsearch.vim'  "Nicer/faster incsearch
Plug 'kshenoy/vim-signature'     "Displays current marks into the vim gutter
Plug 'junegunn/vim-easy-align'   "Nice alignment plugin
Plug 'terryma/vim-expand-region' "Easy highlighting of blocks
Plug 'sheerun/vim-polyglot'      "Filetype plugins for lots of languages
Plug 'tpope/vim-surround'        "Easy add/remove/modify of brackets/parens/tags
Plug 'nanotech/jellybeans.vim'   "Colorscheme
Plug 'scrooloose/Syntastic'      "Syntax checker
Plug 'luochen1990/rainbow'       "Adds rainbow coloured parentheses/brackets
Plug 'Raimondi/delimitMate'      "Adds completion for end quotes/parens/brackets
Plug 'tpope/vim-fugitive'        "git integration
Plug 'tpope/vim-dispatch'        "asynchronous command dispatching
Plug 'tpope/vim-commentary'      "better vim commenting
Plug 'Shougo/vimproc.vim'        "command dispatching (required by unite.vim)
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } "buffer viewer, file searching, swiss army knife
Plug 'Shougo/unite-outline'      "outline source code plugin for unite.vim
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'rizzatti/dash.vim'

" LANGUAGE PLUGINS
"Plug 'nvie/vim-flake8'           "Python syntax checker
Plug 'davidhalter/jedi-vim'      "Python completion and stuff
Plug 'elixir-lang/vim-elixir'

call plug#end()
" End Vundle

""""""""""""""""""""""""""""""""
"         VIM SETTINGS         "
""""""""""""""""""""""""""""""""
"set runtimepath+=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after

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
"colorscheme molokai
colorscheme jellybeans

highlight SignColumn ctermbg=233
highlight ColorColumn ctermbg=232

syn match myTodo "\<\l\{2\}TODO\>"
hi def link myTodo Todo

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

" Indenting, and tabbing
set autoindent
set smarttab
set smartindent
set cursorline

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

" Tabs are 4 spaces, expand tabs into spaces, backspace 
" deletes 4 spaces at a time, indent moves to the nearest 
" tabstop width
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set shiftround

" Show relative line number and absolute line number
set relativenumber
set number
" Enable ruler (character column, percent scrolled)
set ruler
" Our terminal isn't slow so don't wait
set ttyfast
" Set column to wrap at
set textwidth=0
set wrapmargin=0

" Make backspace work as you think it should
set backspace=indent,eol,start

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

set completeopt-=preview
""""""""""""""""""""""""""""""""
"       PLUGIN SETTINGS        "
""""""""""""""""""""""""""""""""

" Deoplete
let g:deoplete#enable_at_startup = 1

" Set directory to store startify sessions
let g:startify_session_dir = '~/.vim/sessions'
" Startify shoes recently used files, files in cwd, and saved sessions
let g:startify_lists = ['files','sessions','dir']

" Enable tabline and buffer numbers 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

" Enable tagbar airline integration
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Use rainbow parentheses
let g:rainbow_active = 1

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0

" Run PEP8 checker when saving python files
"autocmd BufWritePost *.py call Flake8()
" show markers in gutter
let g:flake8_show_in_gutter = 1

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

" Remove highlighting
nnoremap <F3> :noh<CR>

" ctags niceties, F5 builds ctags, F4 opens TagBar
map <F4> :TagbarToggle<CR>
map <F5> :!/usr/local/bin/ctags -R --c-kinds=+defgstvp --fields=+inaStl .<CR>

" Open Startify
map <f8> <ESC>:Startify<RETURN>

" Open .vimrc
map <f12> <ESC>:e $MYVIMRC<RETURN>

" Mapping for creating/closing/navigating tabs easier
map <C-left> :bprevious<CR>
map <C-right> :bnext<CR>
map <C-up> :enew<CR>
map <C-down> :bdelete<CR>
map <C-S-down> :bd!<CR>

" Y copies the highlighted portion into the system clipboard
vnoremap Y "+y
" Map CTRL-A to select the whole file to the system clipboard
nmap <C-a> :%y+ <CR>

" Tab indent/unindent a selection with tab key
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

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
" nnoremap <Leader>b :buffers<CR>:buffer<space>

" Scroll the screen without moving the cursor (4 lines instead of 1)
noremap <C-e> 4<C-e>
noremap <C-y> 4<C-y>

" Build sources by calling make asynchronously
nnoremap <Leader>m :Make!<CR>

" Go to last used buffer
nnoremap <BS> :e#<CR>

inoremap jj <ESC>

" git shortcut commands
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gp :Git push<CR>

" Denite.vim shortcuts
" Recursive file picker and search
nnoremap <Leader>r :<C-u>Denite -start-insert file_rec/async:! -prompt=><CR>
" File picker
nnoremap <Leader>f :<C-u>Denite file -start-insert -prompt=><Space><CR>
" View clipboard history
nnoremap <Leader>y :<C-u>Denite history/yank<CR>
" Buffer chooser
nnoremap <Leader>b :Denite buffer -start-insert -prompt=><CR>
" Search files
nnoremap <Leader>/ :Denite grep:.<CR>
" Search within files
nnoremap <Leader>s :<C-u>Denite line -start-insert -prompt=><CR>
" See code outline
nnoremap <Leader>o :Denite outline -prompt=><CR>

if has('nvim')
    tnoremap <ESC> <C-\><C-n>
    nmap <C-Tab> :bn<CR>
    nmap <C-S-Tab> :bp<CR>
endif
