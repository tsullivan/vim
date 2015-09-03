version 6.0
set nocompatible

" fix mapping conflict
nnoremap <leader>c <Plug>SearchPartyHighlightClear

" Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
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
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/syntastic'
Bundle 'Buffer-grep'
Bundle 'mileszs/ack.vim'
Bundle 'othree/yajs.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'jimmyhchan/dustjs.vim'
Bundle 'othree/xml.vim'
Bundle 'vim-scripts/JSON.vim'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'tpope/vim-eunuch'
Bundle 'dahu/SearchParty'
Bundle 'henrik/vim-indexed-search'
" Color theme
Bundle 'ciaranm/inkpot'

" Bundle 'Tabmerge'
" Bundle 'tpope/vim-haml'
" Bundle 'tpope/vim-markdown'
" Bundle 'digitaltoad/vim-jade'
" Bundle 'mustache/vim-mustache-handlebars'

let g:user_emmet_settings = { 'xml': { 'extends': 'html' }, 'dust': { 'extends': 'html' } }

set ignorecase smartcase
set hidden hlsearch

set wildignore+=*/tmp/*,*.so,*.swn,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules$\|coverage$\|dist$\|bower_components$',
  \ 'file': '\.DS_Store$'
  \ }

set fileformat=unix
set title mouse=a ttymouse=xterm2
set shiftwidth=2 tabstop=2 noexpandtab
set visualbell noerrorbells
set nosmartindent nocindent
set nowrap number
set nowritebackup

set colorcolumn=80
set background=light
colorscheme inkpot

set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ %{SyntasticStatuslineFlag()}\ [POS=%04l,%04v][%p%%][LEN=%L]

" Filetype handling
filetype plugin indent on
au BufNewFile,BufRead *.json set filetype=json
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.es6 set filetype=javascript

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" git commit messagse
autocmd Filetype gitcommit setlocal spell textwidth=72

" sytastic
let g:syntastic_javascript_checkers = ['eslint']
au BufNewFile,BufRead *.es6 let b:syntastic_javascript_eslint_args = "--config .eslintes6rc" " separate lint config for es6 files
let g:syntastic_less_options = "--no-color --include-path=public/css"
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" control-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" split window switching
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

" NERDTree
silent! nnoremap <unique> <silent> <Leader>t :NERDTreeToggle<CR>

" ignore middle mouse button
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>
