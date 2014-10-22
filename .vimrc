set nocompatible              " be iMproved, required
filetype off                  " required

""""""""""""""""""""""""""""
" Vundle Setup and Plugins "
""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" General "
"""""""""""
" set good default
Bundle 'tpope/vim-sensible'

" navigation tree
Bundle 'scrooloose/nerdtree'

" fuzzy search
Bundle 'kien/ctrlp.vim'

" nice status bar
Bundle 'bling/vim-airline'

" file navigation - using brackets, like: [n and ]n
Bundle 'tpope/vim-unimpaired'

" unix commands, like :Mkdir and :Move
"Bundle 'tpope/vim-eunuch'

" completion using <TAB> in INSERT mode.
Bundle 'ervandew/supertab'

" used for tabulating code. The command is :Tabularized
Bundle 'godlygeek/tabular'

" Solarized color scheme
Bundle 'altercation/vim-colors-solarized'


" Coding "
""""""""""
" git wrapper (:Gstatus, :Gmove, etc)
Bundle 'tpope/vim-fugitive' 

" ack perl module. Used for grep.
Bundle 'mileszs/ack.vim'

" shows tags on a split window. The main command is :TagbarToggle
Bundle 'majutsushi/tagbar'

" syntax checker
Bundle 'scrooloose/syntastic'

" manage arguments (Commands: daa, cia, via)
Bundle 'vim-scripts/argtextobj.vim'

" surrounds stuff with parenthensis, brakets, etc
Bundle 'tpope/vim-surround'

" navigate from .c to .h and vice-versa. The main commands is :A
Bundle 'vim-scripts/a.vim'


" Programming Languages "
""""""""""""""""""""""""" 
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/c.vim'

" All plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required


"""""""""""""""""""""
" Syntax and indent "
"""""""""""""""""""""
"syntax enable
"set background=dark
"colorscheme solarized


"""""""""""
" General "
"""""""""""
set tags=tags;/         " serach up the directory for tags
set shiftwidth=2        " two spaces indent
set tabstop=2           " number of spaces per tab in display
set expandtab           " substitute spaces for tabs

" Sets a maximum number of columns
"set colorcolumn=81,101  " absolute columns to highlight "
"set colorcolumn=+1,+21  " relative (to textwidth) columns to highlight "



"""""""""""""""""""
" Plugins Configs "
"""""""""""""""""""

" For vim-sensible, keep all the undo files in the same place
set undodir^=~/.vim/undo

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_follow_symlinks=1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/\.git/*,*/\.hg/* " MaxOSX/Linux
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

