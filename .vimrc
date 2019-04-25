" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'xolox/vim-misc'
Plug 'flazz/vim-colorschemes'

" Initialize plugin system
call plug#end()

" map leader to the space key
let mapleader = "\<Space>"

" Store swap files in fixed location, not current directory.
set swapfile
set dir=~/.vim/swap//,/var/tmp//,/tmp//,.

" Store temporary files in a fixed location, not current directory
set backup
set backupdir=~/.vim/backup//,/var/tmp//,/tmp//,.

" Color Scheme
syntax enable
colorscheme badwolf

set relativenumber
set number
set cursorline

" Allow changing of buffers even with unsaved changes
set hidden

set confirm

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

let g:airline_powerline_fonts = 1

" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Switch between windows, maximizing the current window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffers - next/previous/delete
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
