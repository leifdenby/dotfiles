call plug#begin('~/.vim/plugged')

"Plug 'kien/ctrlp.vim' replaced by fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'

Plug 'davidhalter/jedi-vim'
" disable jedi automatically adding `import` when I am doing `from ...` import statements
let g:jedi#smart_auto_mappings = 0

Plug 'tpope/vim-vinegar'
"Plug 'django.vim'
"Plug 'scrooloose/syntastic' replaced with ALE
Plug 'hdima/python-syntax'
Plug 'python_fold'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'mxw/vim-jsx'
Plug 'sukima/xmledit'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'JulesWang/css.vim'
Plug 'terryma/vim-multiple-cursors'

Plug 'gregsexton/MatchTag'
Plug 'rstacruz/sparkup'
Plug 'wavded/vim-stylus'
Plug 'majutsushi/tagbar'
Plug 'alvan/vim-closetag'
Plug 'pix/git-rebase-helper', { 'for': 'git' }
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'

Plug 'junegunn/vim-easy-align'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'junegunn/goyo.vim'

Plug 'leifdenby/vim-spellcheck-toggle'
Plug 'beloglazov/vim-online-thesaurus'

Plug 'matchit.zip'

Plug 'w0rp/ale'

" for markdown writing:
Plug 'reedes/vim-pencil', { 'for': 'markdown' }
Plug 'tpope/vim-markdown', { 'for': 'pandoc' }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'pandoc' }

Plug 'blindFS/vim-taskwarrior'

" repeating mapped commands like surround
Plug 'tpope/vim-repeat'

" ensure that vim uses the correct python version
Plug 'cjrh/vim-conda'
let g:conda_startup_msg_suppress = 1


Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

call plug#end()



" fzf settings
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set background=dark
colorscheme solarized

" Always show airline
set laststatus=2
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
" Enable wordcount
let g:airline#extensions#wordcount#enabled = 1
" Add notes to filetypes
let g:airline#extensions#wordcount#filetypes = '\vnotes|help|markdown|rst|org|text|asciidoc|tex|mail'


let g:ale_objcpp_clang_options = "-Wall"
let g:ale_python_flake8_options = '--ignore=E302,E226,E231'

" Config closetag
let g:closetag_filenames = "*.jsx,*.html"

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
au FileType python,php,markdown set colorcolumn=80
au FileType vim,javascript,html set ts=2 sts=2 sw=2 expandtab nocindent
au FileType stylus set ts=2 sts=2 sw=2 expandtab nocindent
au FileType cpp,c set ts=2 sts=2 sw=2 expandtab nocindent

" hardcopy (print) settings: in landscape with linenumbers
set printoptions=portrait:n,number:y

set nowrap         " don't wrap lines

au FileType python,php set ts=4 sts=4 sw=4 expandtab nocindent

nnoremap <F6> :OnlineThesaurusCurrentWord<CR>

set backspace=2

" delimitMate settings
au BufNewFile,BufRead *.html let b:delimitMate_matchpairs = "(:),[:],{:}"

au FileType python,php set ts=4 sts=4 sw=4 expandtab nocindent nosmartindent
au FileType python set foldmethod=indent
au BufNewFile,BufRead *.html set ts=2 sts=2 sw=2 expandtab nocindent
au BufNewFile,BufRead *.css set ts=2 sts=2 sw=2 expandtab nocindent


au BufNewFile,BufRead *.f90,*.F90 set ts=3 sts=3 sw=3 expandtab nocindent
au BufNewFile,BufRead *.F90 set ts=3 sts=3 sw=3 expandtab nocindent
" ensure to indent do https://stackoverflow.com/a/17619568
let fortran_do_enddo=1


au BufNewFile,BufRead *.yaml set ts=2 sts=2 sw=2 expandtab nocindent
au BufNewFile,BufRead *.dot set ts=2 sts=2 sw=2 expandtab nocindent
au BufNewFile,BufRead *.sh set ts=2 sts=2 sw=2 expandtab nocindent

au BufNewFile,BufRead *.md nnoremap <silent> <F6> :!make<CR><CR>

augroup pandoc_syntax
  au! BufNewFile,BufFilePRe,BufRead *.md set filetype=markdown.pandoc
  au! BufNewFile,BufFilePRe,BufRead *.md set foldlevel=1
augroup END

au FileType htmldjango so ~/.vim/plugged/HTML-AutoCloseTag/ftplugin/html_autoclosetag.vim
"
nmap <F7> :TagbarToggle<CR>
let g:tagbar_left=1

" popup navigation on code-completion
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_left=1


au BufNewFile,BufRead *.md set filetype=markdown

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init({'wrap': 'hard'})
augroup END

let g:syntastic_python_checkers = []

" I like new c++ features
let g:syntastic_cpp_compiler_options = ' -std=c++0x'


nnoremap <S-T> :OnlineThesaurusCurrentWord<CR>

autocmd filetype crontab setlocal nobackup nowritebackup

let g:jedi#smart_auto_mappings = 0
