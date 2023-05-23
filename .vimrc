set nocompatible

filetype off
set background=dark
set ignorecase smartcase
set hidden hlsearch
set fileformat=unix
set title ttyfast
set mouse=a
set textwidth=111
set sw=2 ts=2 sts=2 expandtab
set novisualbell noerrorbells
set smartindent
set showcmd number
set wrap linebreak
set nocursorline
set splitbelow splitright

set ttymouse=xterm2

" Filetype handling
filetype plugin indent on

call plug#begin()

Plug 'dahu/SearchParty' " NOTE: remember to comment <c-l> mapping out of plugged/SearchParty/searchparty_user_maps.vim

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'ruanyl/vim-gh-line'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/vim-mark'
Plug 'tpope/vim-unimpaired'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-eunuch'
Plug 'diepm/vim-rest-console'

Plug 'scrooloose/nerdtree'

" colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'relastle/bluewery.vim'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'chrisbra/Colorizer'
Plug 'gpanders/vim-oldfiles'

call plug#end()

colorscheme PaperColor

" fzf
nmap <C-P> :FZF<CR>

" rainbow
let g:rainbow_active = 0 "enable via :RainbowToggle

let g:deoplete#enable_at_startup = 1
let g:jsx_ext_required=0
let g:vim_json_syntax_conceal=0
autocmd FileType javascript setlocal suffixesadd+=.js,.ts,.d.ts,.json
autocmd FileType typescript setlocal suffixesadd+=.js,.ts,.d.ts,.json

set wildignore+=*/.git/*,*/node_modules,*/build,*/target

highlight CurrentWord term=bold cterm=bold
highlight CurrentWordTwins term=underline cterm=underline gui=underline
highlight Search cterm=bold ctermfg=black ctermbg=LightGray

" NERDTree
let g:NERDTreeWinSize=60
silent! nmap <unique> <silent> <Leader>e :NERDTreeToggle<CR>
silent! nmap <unique> <silent> <Leader>f :NERDTreeFind<CR>

" ALE
let g:ale_completion_enabled = 1
let g:ale_lint_on_insert_leave=1
let g:ale_fix_on_save=1
let g:ale_sign_error='✘'
let g:ale_sign_warning='⚠'
let g:ale_javascript_eslint_options = "--no-ignore"
let g:ale_linters={
  \'javascript': ['eslint'],
  \'typescript': ['tsserver', 'eslint'],
  \'javascriptreact': ['eslint'],
  \}
let g:ale_fixers={
  \'c': ['clang-format'],
  \'javascript': ['eslint'],
  \'typescript': ['eslint'],
  \'javascriptreact': ['eslint'],
  \'typescriptreact': ['eslint'],
  \}

" VRC
let g:vrc_trigger='<Leader>j'
let g:vrc_syntax_highlight_response=1
let g:vrc_curl_opts={
  \'--include': '',
  \'--location': '',
  \'--show-error': '',
  \'--silent': '',
  \ '-k': '',
  \}
let g:vrc_auto_format_response_enabled=1
let g:vrc_auto_format_response_patterns={ 'json': "jq --sort-keys '.'" }

set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/

highlight Normal ctermbg=NONE

map <ScrollWheelDown> <C-E>
map <ScrollWheelUp> <C-Y>
