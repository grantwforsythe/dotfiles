"---------------------
" Basic editing config
"---------------------
set nocompatible " vim is not using vi
filetype off " change the way vim caches filetype rules at runtime
 
set noerrorbells
set guicursor= " set the type of cursor
set relativenumber " the number of lines are relative
set nu " numbers lines
set nohlsearch " after searching for a word, its no longer highlighted
set hidden " allow auto-hiding of edited buffers
set nowrap " doesn't wrap text
set autoindent " copies the indent when starting a new line 
set incsearch " incremental search (as string is being typed)
set scrolloff=8 " show 8 lines above and below the cursor 
set signcolumn=yes " adds the grey bar to the left
set noswapfile " prevents swap files from being created
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch " while you are typing, you will get results
set mouse=a " mouse

set clipboard=unnamed " allows to paste from outside sources

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search
set ignorecase
set smartcase

" display cwd
" source: https://stackoverflow.com/questions/33033646/how-to-show-constantly-current-working-directory-in-vim
set laststatus=2
set statusline=%!getcwd()
" use tab to indent
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" turn off highlighting
nnoremap <F4> :nohl<CR>

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

" =================================================

set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin() " specify a directory for plugins

Plugin 'VundleVim/Vundle.vim'   " let Vundle mange Vundle, required
Plugin 'morhetz/gruvbox'        " colorscheme
Plugin 'jremmen/vim-ripgrep'    " faster grep
Plugin 'kien/ctrlp.vim'         " file finding
Plugin 'Syntastic'              " syntax highlighting
Plugin 'scrooloose/nerdtree'    " file system explorer

call vundle#end() " specify a directory for plugins
filetype plugin indent on " re-establish the 'filetype' functionality

" =================================================
" Configuartion: gruvbox
colorscheme gruvbox
set background=dark

" =================================================
" Configuartion: vim-ripgrep 
if executable('rg')
    let g:rg_derive_root='true'
endif

" =================================================
" Configuartion: ctrlp 
let g:ctrlp_user_command = ['.git/']
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0

" =================================================
" Configuartion: syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" =================================================
" Configuartion: nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"
" Start NERDTree when Vim is opened and leave the cursor in it.
autocmd VimEnter * NERDTree

" Start NERDTree when Vim is opened and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p


" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
