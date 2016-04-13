version 6.0
set nocompatible

" fix mapping conflict
nnoremap <leader>c <Plug>SearchPartyHighlightClear

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
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/syntastic'
Bundle 'rking/ag.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/xml.vim'
Bundle 'elzr/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-surround'
Bundle 'dahu/SearchParty'
Bundle 'diepm/vim-rest-console'
Bundle 'henrik/vim-indexed-search'
" Color theme
Bundle 'ciaranm/inkpot'
Bundle 'NLKNguyen/papercolor-theme'

" Bundle 'Tabmerge'
" Bundle 'tpope/vim-haml'
" Bundle 'tpope/vim-markdown'
" Bundle 'digitaltoad/vim-jade'
" Bundle 'mustache/vim-mustache-handlebars'

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

" Filetype handling
filetype plugin indent on
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.es6 set filetype=javascript

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" git commit messagse
autocmd Filetype gitcommit setlocal spell textwidth=72

" json
let g:vim_json_syntax_conceal = 0

" sytastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_less_options = "--no-color"
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" control-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" '
endif

" Airline
let g:airline_theme='papercolor'

" split window switching
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

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
