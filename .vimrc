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
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/syntastic'
Bundle 'Buffer-grep'
Bundle 'rking/ag.vim'
Bundle 'othree/yajs.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'jimmyhchan/dustjs.vim'
Bundle 'othree/xml.vim'
Bundle 'vim-scripts/JSON.vim'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'tpope/vim-eunuch'
Bundle 'dahu/SearchParty'
Bundle 'diepm/vim-rest-console'
Bundle 'henrik/vim-indexed-search'
Bundle 'nathanaelkane/vim-indent-guides'
" Color theme
Bundle 'ciaranm/inkpot'

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

set cursorline
set colorcolumn=140
set background=light
set lazyredraw
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
let g:syntastic_less_options = "--no-color"
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
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" '
endif

" emmet
let g:user_emmet_settings = { 'xml': { 'extends': 'html' }, 'dust': { 'extends': 'html' } }

" indent guides
let g:indent_guides_enable_on_vim_startup=0

" split window switching
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

" NERDTree
silent! nnoremap <unique> <silent> <Leader>t :NERDTreeToggle<CR>

" ignore middle mouse button
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>
