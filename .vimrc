version 6.0
set nocompatible

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'henrik/vim-indexed-search'
Plug 'tpope/vim-sensible'
Plug 'ciaranm/inkpot'
call plug#end()

filetype off

set ignorecase smartcase
set hidden hlsearch
set fileformat=unix
set title ttyfast
set mouse=a ttymouse=xterm2
set sw=2 ts=2 sts=2 expandtab
set visualbell noerrorbells
set smartindent
set showcmd number
set wrap linebreak
set nocursorline
set colorcolumn=
set background=dark
colorscheme inkpot

set splitbelow splitright

" Filetype handling
filetype plugin indent on

" git commit messagse
autocmd Filetype gitcommit setlocal spell textwidth=72

" Airline
let g:airline_theme='papercolor'

" tmux-navigator
let g:tmux_navigator_save_on_switch=2
let g:tmux_navigator_disable_when_zoomed=1

" ignore middle mouse button
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
