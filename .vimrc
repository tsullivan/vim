set nocompatible

filetype off
set background=dark
set ignorecase smartcase
set hidden hlsearch
set fileformat=unix
set title ttyfast
set mouse=a
set sw=2 ts=2 sts=2 expandtab
set novisualbell noerrorbells
set smartindent
set showcmd number
set wrap linebreak
set nocursorline
set splitbelow splitright

if !has('nvim')
  set ttymouse=xterm2
endif

" Filetype handling
filetype plugin indent on

call plug#begin()

" Always enabled plugins
Plug 'dahu/SearchParty' " NOTE: remember to comment <c-l> mapping out of plugged/SearchParty/searchparty_user_maps.vim
Plug 'Yggdroot/vim-mark'
Plug 'tpope/vim-unimpaired'

if exists('g:vscode')
  " VSCode extension
else
  " VSCode extension
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'christoomey/vim-tmux-navigator'

  Plug 'wesQ3/vim-windowswap'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'dominikduda/vim_current_word'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdtree'
  Plug 'w0rp/ale'
  Plug 'jremmen/vim-ripgrep'

  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'othree/yajs.vim'
  Plug 'mxw/vim-jsx'
  Plug 'elzr/vim-json'
  Plug 'tpope/vim-eunuch'
  Plug 'diepm/vim-rest-console'
  " Plug 'henrik/vim-indexed-search'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " colors
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'relastle/bluewery.vim'
  Plug 'crusoexia/vim-monokai'
  Plug 'morhetz/gruvbox'
endif


call plug#end()

colorscheme PaperColor

" fzf
nmap <C-P> :FZF<CR>

let g:deoplete#enable_at_startup = 1
let g:jsx_ext_required=0
let g:vim_json_syntax_conceal=0
autocmd FileType javascript setlocal suffixesadd+=.js,.ts,.d.ts,.json
autocmd FileType typescript setlocal suffixesadd+=.js,.ts,.d.ts,.json

" ag
let g:ackprg='ag --vimgrep'

highlight CurrentWord term=bold cterm=bold
highlight CurrentWordTwins term=underline cterm=underline gui=underline
highlight Search cterm=bold ctermfg=black ctermbg=LightGray

" NERDTree
let g:NERDTreeWinSize=60
silent! nmap <unique> <silent> <Leader>e :NERDTreeToggle<CR>
silent! nmap <unique> <silent> <Leader>f :NERDTreeFind<CR>

" Airline
" let g:airline_theme='papercolor'

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
  \}

noremap <Leader>ad :ALEGoToDefinition<CR>
noremap <Leader>at :ALEGoToTypeDefinition<CR>
nnoremap <leader>af :ALEFix<cr>
noremap <Leader>ar :ALEFindReferences<CR>
"Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

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

" Turn off built-in plugin
let g:loaded_matchparen=1

set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/

highlight Normal ctermbg=NONE
