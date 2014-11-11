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

" code completition - OBS: Additional steps required for C code completition.
Bundle 'Valloric/YouCompleteMe'


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


""""""""""""""""""
" General Config "
""""""""""""""""""
let mapleader=","  " the default leader (backslash) is too far away on keyboard!
set tags=tags;/    " serach up the directory for tags
set shiftwidth=2   " two spaces indent
set tabstop=2      " number of spaces per tab in display
set expandtab      " substitute spaces for tabs
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Sets a maximum number of columns
"set colorcolumn=81 " absolute columns to highlight "
"set colorcolumn=+1 " relative (to textwidth) columns to highlight "



"""""""""""""""""""
" Plugins Configs "
"""""""""""""""""""

" For vim-sensible, keep all the undo files in the same place
set undodir^=~/.vim/undo

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <leader>nm :NERDTreeFind<CR>

" CtrlP
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'
nmap <leader>pd :CtrlP 
nmap <leader>pb :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_follow_symlinks=1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Syntastic
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = $HOME . '/.dotfiles/vim/plugins/YouCompleteMe/.ycm_extra_conf.py'
