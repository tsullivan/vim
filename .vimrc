version 6.0
set nocompatible

" Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundle some original repos on github
Bundle 'tpope/vim-sensible'
Bundle 'gregsexton/MatchTag'
Bundle 'jimmyhchan/dustjs.vim'
Bundle 'othree/xml.vim'
Bundle 'vim-scripts/JSON.vim'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/unicode.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'dahu/SearchParty'
Bundle 'henrik/vim-indexed-search'
Bundle 'Tabmerge'
Bundle 'Buffer-grep'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/syntastic'

Bundle 'ciaranm/inkpot'

let g:user_emmet_settings = { 'xml': { 'extends': 'html' }, 'dust': { 'extends': 'html' } }

set ignorecase smartcase
set hidden hlsearch
set wildignore+=node_modules/*,public/vendor/*,vendor/*
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|coverage'

set fileformat=unix
set title mouse=a ttymouse=xterm2
set shiftwidth=4 tabstop=4 noexpandtab
set visualbell noerrorbells
set nosmartindent nocindent
set nowrap number

set background=light
colorscheme inkpot

" Filetype handling
filetype plugin indent on
au BufRead,BufNewFile *.json set filetype=json
au BufNewFile,BufRead *.ejs set filetype=html

set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ %{SyntasticStatuslineFlag()}\ [POS=%04l,%04v][%p%%][LEN=%L]

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" sytastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_less_options = "--no-color --include-path=public/css"

" control-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" split window switching
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

" ignore middle mouse button
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>
