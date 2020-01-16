filetype off

set ignorecase smartcase
set hidden hlsearch
set fileformat=unix
set title ttyfast
set mouse=a
set sw=2 ts=2 sts=2 expandtab
set visualbell noerrorbells
set smartindent
set showcmd number
set wrap linebreak
set nocursorline
set background=dark
set splitbelow splitright

" Filetype handling
filetype plugin indent on

call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-sensible'
Plug 'dahu/SearchParty' " NOTE: remember to comment <c-l> mapping out of plugged/SearchParty/searchparty_user_maps.vim

Plug 'Yggdroot/vim-mark'
Plug 'dominikduda/vim_current_word'
Plug 'wesQ3/vim-windowswap'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'jremmen/vim-ripgrep'

" JS / Typescript
if has('nvim')
  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'mhartington/nvim-typescript', { 'build': './install.sh' }
  " For async completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " For Denite features
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
endif
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'

Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-eunuch'
Plug 'diepm/vim-rest-console'
Plug 'henrik/vim-indexed-search'

call plug#end()

colorscheme zellner
" fzf
nmap <C-P> :FZF<CR>

" let g:nvim_typescript#default_mappings=1
let g:deoplete#enable_at_startup = 1
let g:jsx_ext_required=0
let g:vim_json_syntax_conceal=0
autocmd FileType javascript setlocal suffixesadd+=.js,.ts,.d.ts,.json
autocmd FileType typescript setlocal suffixesadd+=.js,.ts,.d.ts,.json

" ag
let g:ackprg='ag --vimgrep'

highlight Normal guibg=NONE ctermbg=NONE
highlight CurrentWord term=bold cterm=bold
highlight CurrentWordTwins term=underline cterm=underline gui=underline
highlight Search cterm=bold ctermfg=black ctermbg=LightGray

" NERDTree
let g:NERDTreeWinSize=60
silent! nmap <unique> <silent> <Leader>e :NERDTreeToggle<CR>
silent! nmap <unique> <silent> <Leader>f :NERDTreeFind<CR>

" Airline
let g:airline_theme='papercolor'

" ALE
highlight ALEErrorSign cterm=bold ctermfg=1 ctermbg=234
highlight ALEWarningSign cterm=bold ctermfg=11 ctermbg=234
highlight ALEError cterm=NONE ctermfg=0 ctermbg=1
highlight ALEWarning cterm=NONE ctermfg=0 ctermbg=11
let g:ale_lint_on_insert_leave=1
let g:ale_fix_on_save=1
let g:ale_sign_error='✘'
let g:ale_sign_warning='⚠'
let g:ale_javascript_eslint_options = "--no-ignore"
let g:ale_linters={
  \'javascript': ['eslint'],
  \'typescript': ['tsserver', 'eslint'],
  \}
let g:ale_fixers={
  \'c': ['clang-format'],
  \'javascript': ['eslint'],
  \'typescript': ['eslint'],
  \}
nmap <Leader>a :ALEFix<CR>
nmap <Leader>z :ALENextWrap<CR>

" typescript
let g:nvim_typescript#diagnostics_enable=0

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
