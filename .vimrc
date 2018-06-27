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
Plug 'dahu/SearchParty' " NOTE: remember to comment <c-l> mapping out of plugged/SearchParty/searchparty_user_maps.vim
Plug 'Yggdroot/vim-mark'
Plug 'dominikduda/vim_current_word'
Plug 'wesQ3/vim-windowswap'
Plug 'gregsexton/MatchTag'
Plug 'chrisbra/unicode.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
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
Plug 'tmux-plugins/vim-tmux-focus-events'
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
set showcmd number
set wrap linebreak
set nocursorline
set colorcolumn=
set background=dark
colorscheme inkpot

set splitbelow splitright

" Filetype handling
filetype plugin indent on
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.es6 set filetype=javascript

let &t_SI="\<Esc>]50;CursorShape=1\x7"
let &t_EI="\<Esc>]50;CursorShape=0\x7"

" git commit messagse
autocmd Filetype gitcommit setlocal spell textwidth=72

" custom
nmap <Leader>p :.!pbpaste<CR>
" nmap <Leader>x :!tmux send-keys -t 0:1.0 C-p C-j <CR><CR>

" fzf
" let g:fzf_prefer_tmux=1
nmap <C-P> :FZF<CR>
nmap <Leader>b :Buffers<CR>

" yaml
autocmd FileType yaml let b:did_indent = 1
autocmd FileType yaml setlocal indentexpr=

autocmd FileType javascript set keywordprg=random-bulk-data

" json
let g:vim_json_syntax_conceal=0
" js/jsx
let g:jsx_ext_required=0

" ag
let g:ackprg='ag --vimgrep'

highlight Normal guibg=NONE ctermbg=NONE
highlight CurrentWord term=bold cterm=bold
highlight CurrentWordTwins term=underline cterm=underline gui=underline
highlight Search cterm=bold ctermfg=black ctermbg=LightRed

" Airline
let g:airline_theme='papercolor'

" NERDTree
silent! nmap <unique> <silent> <Leader>t :NERDTreeToggle<CR>
silent! nmap <unique> <silent> <Leader>f :NERDTreeFind<CR>

" tmux-navigator
let g:tmux_navigator_save_on_switch=2
let g:tmux_navigator_disable_when_zoomed=1

" ignore middle mouse button
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>

" ALE
highlight ALEErrorSign cterm=bold ctermfg=1 ctermbg=234
highlight ALEWarningSign cterm=bold ctermfg=11 ctermbg=234
highlight ALEError cterm=NONE ctermfg=0 ctermbg=1
highlight ALEWarning cterm=NONE ctermfg=0 ctermbg=11
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_fixers = {
  \   'javascript': ['eslint'],
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


