call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-vinegar'
"Plug 'django.vim'
Plug 'scrooloose/syntastic'
Plug 'hdima/python-syntax'
Plug 'python_fold'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'mxw/vim-jsx'
Plug 'sukima/xmledit'
Plug 'othree/html5.vim'
"Plug 'amirh/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'JulesWang/css.vim'
Plug 'terryma/vim-multiple-cursors'



call plug#end()

set background=dark
colorscheme solarized

" Always show airline
set laststatus=2
set encoding=utf-8
let g:airline_powerline_fonts = 1

" disable Ex mode
map Q <Nop>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set list

set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case when searching 
set title           " show title in console title bar
set ttyfast         " smoother changes
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files

set expandtab
set autoindent     " always set autoindenting on
set smartindent        " smart indent

au FileType python,php,markdown set ts=4 sts=4 sw=4 expandtab nocindent
au FileType vim,javascript,html set ts=2 sts=2 sw=2 expandtab nocindent

set nowrap         " don't wrap lines

au FileType python,php set ts=4 sts=4 sw=4 expandtab nocindent

set backspace=2

" delimitMate settings
au BufNewFile,BufRead *.html let b:delimitMate_matchpairs = "(:),[:],{:}"

au FileType python,php set ts=4 sts=4 sw=4 expandtab nocindent
au BufNewFile,BufRead *.html set ts=2 sts=2 sw=2 expandtab nocindent
au BufNewFile,BufRead *.css set ts=2 sts=2 sw=2 expandtab nocindent

"au FileType htmldjango so ~/.vim/plugged/HTML-AutoCloseTag/ftplugin/html_autoclosetag.vim

" popup navigation on code-completion
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
