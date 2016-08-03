version 6.0
set nocompatible

" vim-plug
call plug#begin('~/.vim/plugged')
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Add plugins to &runtimepath
call plug#end()

filetype off
" Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/vundle/vundle.plugin.zsh#L1
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundle some original repos on github
Bundle 'tpope/vim-sensible'
Bundle 'gregsexton/MatchTag'
Bundle 'vim-scripts/unicode.vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/syntastic'
"Bundle 'othree/yajs.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'elzr/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-eunuch'
Bundle 'dahu/SearchParty'
Bundle 'diepm/vim-rest-console'
Bundle 'henrik/vim-indexed-search'
" Color theme
Bundle 'ciaranm/inkpot'
Bundle 'NLKNguyen/papercolor-theme'

set ignorecase smartcase
set hidden hlsearch
set fileformat=unix
set title mouse=a ttymouse=xterm2
set sw=2 ts=2 sts=2 expandtab
set visualbell noerrorbells
set smartindent
set nowrap number
set showcmd

set cursorline
set colorcolumn=140
set background=dark
colorscheme PaperColor

set splitbelow splitright

" Filetype handling
filetype plugin indent on
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.es6 set filetype=javascript

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" fzf
nnoremap <C-P> :FZF<CR>

" git commit messagse
autocmd Filetype gitcommit setlocal spell textwidth=72

" json
let g:vim_json_syntax_conceal = 0

" syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_less_options = "--no-color"
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
let g:airline_theme='papercolor'

" NERDTree
silent! nnoremap <unique> <silent> <Leader>t :NERDTreeToggle<CR>

" ignore middle mouse button
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>

" cursor to thin line
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
