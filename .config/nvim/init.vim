call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'
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

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" JS / Typescript
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-eunuch'
Plug 'diepm/vim-rest-console'
Plug 'henrik/vim-indexed-search'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Color theme
Plug 'ciaranm/inkpot'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()

filetype off

set ignorecase smartcase
set hidden hlsearch
set fileformat=unix
set title ttyfast
set mouse=
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

" custom
nmap <Leader>p :.!pbpaste<CR>
" nmap <Leader>x :!tmux send-keys -t 0:1.0 C-p C-j <CR><CR>

" fzf
" let g:fzf_prefer_tmux=1
nmap <C-P> :FZF<CR>

" javascript
" let g:nvim_typescript#default_mappings = 1
let g:deoplete#enable_at_startup = 1
let g:jsx_ext_required=0
let g:vim_json_syntax_conceal=0
autocmd FileType javascript setlocal suffixesadd+=.js,.ts,.json
autocmd FileType typescript setlocal suffixesadd+=.js,.ts,.json

" ag
let g:ackprg='ag --vimgrep'

highlight Normal guibg=NONE ctermbg=NONE
highlight CurrentWord term=bold cterm=bold
highlight CurrentWordTwins term=underline cterm=underline gui=underline
highlight Search cterm=bold ctermfg=black ctermbg=LightGray

" NERDTree
silent! nmap <unique> <silent> <Leader>e :NERDTreeToggle<CR>
silent! nmap <unique> <silent> <Leader>f :NERDTreeFind<CR>

" Airline
let g:airline_theme='papercolor'

" tmux-navigator
let g:tmux_navigator_save_on_switch=2
let g:tmux_navigator_disable_when_zoomed=1

" ignore middle mouse button
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" ALE
highlight ALEErrorSign cterm=bold ctermfg=1 ctermbg=234
highlight ALEWarningSign cterm=bold ctermfg=11 ctermbg=234
highlight ALEError cterm=NONE ctermfg=0 ctermbg=1
highlight ALEWarning cterm=NONE ctermfg=0 ctermbg=11
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'typescript': ['tslint'],
  \}
let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \   'typescript': ['tslint'],
  \}
nmap <Leader>a :ALEFix<CR>

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

if exists('neovim_dot_app')
  colorscheme industry
endif
