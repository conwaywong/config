" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'bling/vim-airline'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'airblade/vim-gitgutter'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" ====== end NeoBundle ======

" map leader to the space key
let mapleader = "\<Space>"

" Color Scheme
syntax enable
"set background=dark
let g:solarized_termcolors=256
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif
set number
set cursorline

" Toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" NerdTree mapping
map <C-n> :NERDTreeToggle<CR>

" Allow NerdTree to start without path
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Ctrl-p mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Start Ctrl-p in regex mode
let g:ctrlp_regexp = 1

" Use leader-t for tag fuzzy searching
nnoremap <leader>t :CtrlPTag<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:airline_powerline_fonts = 1

" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

nmap <F8> :TagbarToggle<CR>

" Switch between windows, maximizing the current window
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_
