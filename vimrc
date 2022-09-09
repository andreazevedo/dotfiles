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

" completion using <TAB> in INSERT mode.
Bundle 'ervandew/supertab'

" used for tabulating code. The command is :Tabularized
Bundle 'godlygeek/tabular'

" Solarized color scheme
Bundle 'altercation/vim-colors-solarized'

" Clang format plugin
Bundle 'rhysd/vim-clang-format'

" Git wrapper
Bundle 'tpope/vim-fugitive'

" GitHub plugin for the vim-fugitive plugin
Bundle 'tpope/vim-rhubarb'


" Coding "
""""""""""
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

" Asynchronous build and test dispatcher
Bundle 'tpope/vim-dispatch'

" code completition
Bundle 'ycm-core/YouCompleteMe'

" ycm with bazel
Bundle 'grailbio/bazel-compilation-database'


" Programming Languages "
""""""""""""""""""""""""" 
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/c.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'leafgarland/typescript-vim'

" All plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required


"""""""""""""""""""""
" Syntax and indent "
"""""""""""""""""""""
syntax enable
set background=dark
colorscheme solarized

" Color scheme hack for Mac OS's Terminal.app
if colors_name == 'solarized'
  if has('gui_macvim')
    set transparency=0
  endif

  if !has('gui_running') && $TERM_PROGRAM == 'Apple_Terminal'
    let g:solarized_termcolors = &t_Co
    let g:solarized_termtrans = 1
    colorscheme solarized
  endif
endif



""""""""""""""""""
" General Config "
""""""""""""""""""
let mapleader=","  " the default leader (backslash) is too far away on keyboard!
set tags=tags;/    " serach up the directory for tags
set shiftwidth=2   " two spaces indent
set tabstop=2      " number of spaces per tab in display
set expandtab      " substitute spaces for tabs
set ignorecase     " disable case-sensitivity
set smartcase      " enable smart-case. if all in lowercase, its insensitive
set incsearch      " enable incremental search
set hlsearch       " enable search highlighting

" Files to be ignored by VIM, including NERDTree and CtrlP plugings
set wildignore=*.swp,*.zip                            " general stuff
set wildignore+=*.so,*.lo,*.o,*.a                     " C/C++
set wildignore+=autom4te.cache,aclocal.m4,config.log  " autotools
set wildignore+=config.status,depcomp,install-sh      " autotools (cont.)
set wildignore+=Makefile.in,missing                   " autotools (cont.)
set wildignore+=cmake_install.cmake                   " cmake
set wildignore+=CMakeFiles,CMakeCache.txt             " cmake (cont.)
set wildignore+=CTestTestfile.cmake                   " cmake (cont.)
set wildignore+=Testing                               " gtest
set wildignore+=bazel-*                               " bazel
set wildignore+=external                              " bazel

" Sets a maximum number of columns
set colorcolumn=81 " absolute columns to highlight "
"set colorcolumn=+1 " relative (to textwidth) columns to highlight "



"""""""""""""""""""
" Plugins Configs "
"""""""""""""""""""

" For vim-sensible, keep all the undo files in the same place
set undodir^=~/.vim/undo

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <leader>nm :NERDTreeFind<CR>
let g:NERDTreeRespectWildIgnore=1

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
let g:ctrlp_clear_cache_on_exit = 1

" Syntastic
" C++
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

" Clang format
map <C-k> :ClangFormat<CR>
