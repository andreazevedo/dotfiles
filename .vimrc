set nocompatible              " be iMproved, required
filetype off                  " required

""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" To start with:
Bundle 'tpope/vim-sensible'

" General
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-eunuch'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'altercation/vim-colors-solarized'

" Coding
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/argtextobj.vim'
Bundle 'tpope/vim-surround'

" Programming languages
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



"""""""""""
" Plugins "
"""""""""""

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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MaxOSX/Linux

