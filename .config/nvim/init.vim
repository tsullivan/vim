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

" Filetype handling
filetype plugin indent on

call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/symbols-outline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dahu/SearchParty' " NOTE: remember to comment <c-l> mapping out of plugged/SearchParty/searchparty_user_maps.vim
Plug 'Yggdroot/vim-mark'
Plug 'tpope/vim-unimpaired'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'wesQ3/vim-windowswap'
Plug 'ruanyl/vim-gh-line'
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


call plug#end()

lua << EOF
require'lspconfig'.tsserver.setup{}
EOF

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
  \'typescriptreact': ['eslint'],
  \}

nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> 1gD    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <space>q  <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <leader>ag <cmd>lua vim.lsp.buf.code_action()<CR>

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" use :Fix to autofix eslint issues in current buffer
command! -nargs=0 Fix :CocCommand eslint.executeAutofix
nnoremap <leader>af :Fix<cr>

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

set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
