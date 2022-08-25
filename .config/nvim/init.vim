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

" Filetype handling
filetype plugin indent on

call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'simrat39/symbols-outline.nvim'
Plug 'mhartington/formatter.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'

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
Plug 'jremmen/vim-ripgrep'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'tpope/vim-eunuch'
Plug 'diepm/vim-rest-console'

" colors
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'luochen1990/rainbow'
Plug 'NLKNguyen/papercolor-theme'
Plug 'relastle/bluewery.vim'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'chrisbra/Colorizer'

call plug#end()

lua << EOF
require("lspconfig").tsserver.setup({})
require("symbols-outline").setup()
require("nvim-tree").setup()
require("lint").linters_by_ft = {
  typescript = {"eslint"},
}
require("formatter").setup({
  logging = false,
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescript").prettier,
    },
  }
})
EOF

colorscheme PaperColor

" fzf and symbols-outline
nmap <C-P> :FZF<CR>
"silent! nmap <unique> <silent> <Leader>w :SymbolsOutline<CR>

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

silent! nmap <unique> <silent> <Leader>E :NvimTreeToggle<CR>
silent! nmap <unique> <silent> <Leader>e :NvimTreeFindFile<CR>

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gI <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> 1gd <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> [g <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <space>q <cmd>lua vim.diagnostic.setloclist()<CR>
nnoremap <leader>ag <cmd>lua vim.lsp.buf.code_action()<CR>

autocmd BufWritePost lua require('lint').try_lint()
autocmd BufRead,BufWritePost * lua require('lint').try_lint()
nnoremap <silent> <leader>l <cmd>lua require('lint').try_lint()<CR>

" formatter
nnoremap <silent> <leader>f :Format<CR>
nnoremap <silent> <leader>F :FormatWrite<CR>
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

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
