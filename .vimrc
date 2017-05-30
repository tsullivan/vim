version 6.0
set nocompatible

" vim-plug
call plug#begin('~/.vim/plugged')
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug some original repos on github
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-sensible'
Plug 'dahu/SearchParty'
Plug 'Yggdroot/vim-mark'
Plug 'dominikduda/vim_current_word'
Plug 'gregsexton/MatchTag'
Plug 'chrisbra/unicode.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic'
Plug 'mileszs/ack.vim'
"Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'robbles/logstash.vim'
Plug 'tpope/vim-eunuch'
Plug 'diepm/vim-rest-console'
Plug 'henrik/vim-indexed-search'
" Color theme
Plug 'ciaranm/inkpot'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/vim-tomorrow-theme'
" Add plugins to &runtimepath
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

" git commit messagse
autocmd Filetype gitcommit setlocal spell textwidth=72

" fzf
" let g:fzf_prefer_tmux = 1
nnoremap <C-P> :FZF<CR>

" json
let g:vim_json_syntax_conceal = 0
" js/jsx
let g:jsx_ext_required = 0

" ag
let g:ackprg = 'ag --vimgrep'

" syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_less_lessc_args = "--no-color"
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

hi CurrentWord ctermbg=53
hi CurrentWordTwins ctermbg=237

" Airline
let g:airline_theme='papercolor'

" NERDTree
silent! nnoremap <unique> <silent> <Leader>t :NERDTreeToggle<CR>
silent! nnoremap <unique> <silent> <Leader>f :NERDTreeFind<CR>

" tmux-navigator
let g:tmux_navigator_save_on_switch = 2
let g:tmux_navigator_disable_when_zoomed = 1

" ignore middle mouse button
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>

" cursor to thin line
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/
