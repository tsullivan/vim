set nocompatible

filetype off
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

Plug 'chrisbra/Colorizer'
Plug 'gpanders/vim-oldfiles'

" colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'bluz71/vim-moonfly-colors'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'relastle/bluewery.vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }

Plug 'christoomey/vim-tmux-navigator'

Plug 'pangloss/vim-javascript'    " JavaScript suppor
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""
" This makes the time before it updates your hover faster
set updatetime=300
" Highlight the symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for gotos
nmap gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
nmap <leader>q :CocList diagnostics<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap for autofix the problem under the cursor
nnoremap <silent> <leader>qf <Plug>(coc-fix-current)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use :OR to organize the imports
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript setlocal formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use K to show documentation in floating window.
nnoremap <silent> K :call ShowDocumentation()<CR>
" Show hover when provider exists, fallback to vim's builtin behavior.
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('definitionHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)
nmap <leader>f :call CocAction('runCommand', 'eslint.executeAutofix')<CR>

" Open the files tree with the current file highlighted
nnoremap <leader>e :CocCommand explorer --reveal<CR>
"""""""""""""""""""""""""""""""""""""""""""""

" fzf
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fo :History<CR>
nnoremap <leader>fb :Buffers<CR>

" custom window resize
nnoremap <C-Q><Up> <C-W>+
nnoremap <C-Q><Down> <C-W>-
nnoremap <C-Q><Left> <C-W><
nnoremap <C-Q><Right> <C-W>>

" rainbow
let g:rainbow_active = 0 "enable via :RainbowToggle

set wildignore+=*/.git/*,*/node_modules,*/build,*/target

highlight CurrentWord term=bold cterm=bold
highlight CurrentWordTwins term=underline cterm=underline gui=underline
highlight Search cterm=bold ctermfg=black ctermbg=LightGray

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

map <ScrollWheelDown> <C-E>
map <ScrollWheelUp> <C-Y>
