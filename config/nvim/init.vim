let g:python3_host_prog=$CONDA_PYTHON_EXE

call plug#begin('~/.local/share/nvim/plugged')

"Plug 'kien/ctrlp.vim' replaced by fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
"Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-unimpaired'
"Plug 'pangloss/vim-javascript'

" python editing
Plug 'davidhalter/jedi-vim'
" disable jedi automatically adding `import` when I am doing `from ...` import statements
let g:jedi#smart_auto_mappings = 0
" disable the auto-preview feature
autocmd FileType python setlocal completeopt-=preview
Plug 'psf/black', { 'branch': 'stable', 'for': 'python' }
Plug 'hdima/python-syntax'
Plug 'vim-scripts/python_fold'
Plug 'fisadev/vim-isort'

Plug 'tpope/vim-vinegar'
"Plug 'django.vim'
"Plug 'scrooloose/syntastic' replaced with ALE

Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'mxw/vim-jsx'
Plug 'sukima/xmledit'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'JulesWang/css.vim'
Plug 'mg979/vim-visual-multi'

Plug 'gregsexton/MatchTag'
Plug 'rstacruz/sparkup'
Plug 'wavded/vim-stylus'
Plug 'majutsushi/tagbar'
Plug 'alvan/vim-closetag'
Plug 'pix/git-rebase-helper', { 'for': 'git' }
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'

Plug 'junegunn/vim-easy-align'

" for writing
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'reedes/vim-wordy', { 'for': 'pandoc' }
Plug 'junegunn/goyo.vim'
let g:goyo_width = 82
let g:limelight_paragraph_span = 1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
Plug 'junegunn/limelight.vim', { 'for': ['pandoc', 'tex'] }

Plug 'leifdenby/vim-spellcheck-toggle'
"Plug 'beloglazov/vim-online-thesaurus'
Plug 'Ron89/thesaurus_query.vim'

" better yaml support
Plug 'chase/vim-ansible-yaml'

Plug 'vim-scripts/matchit.zip'

" Syntax highlighting and linting
let g:ale_completion_enabled = 1
Plug 'w0rp/ale'

" who uses ncl anymore?
Plug 'dongli/vim-ncl'

" for markdown writing:
Plug 'tpope/vim-markdown', { 'for': 'pandoc' }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'pandoc' }

" latex
Plug 'vim-voom/VOoM', { 'for': 'tex' }
Plug 'lervag/vimtex', { 'for': 'tex' }
let g:vimtex_compiler_method = 'tectonic'

" Julia
Plug 'JuliaEditorSupport/julia-vim'
autocmd FileType julia setlocal shiftwidth=4 foldmethod=indent tabstop=4 softtabstop=4
au BufNewFile,BufRead *.jl set ts=4 sts=4 sw=4 foldmethod=indent
Plug 'prabirshrestha/asyncomplete.vim', { 'for': 'julia' }
Plug 'kdheepak/JuliaFormatter.vim', { 'for': 'julia' }
" normal mode mapping
nnoremap <localleader>jf :JuliaFormatterFormat<CR>
" visual mode mapping
vnoremap <localleader>jf :JuliaFormatterFormat<CR>

" Plug 'blindFS/vim-taskwarrior'

" repeating mapped commands like surround
Plug 'tpope/vim-repeat'

" easy working with increments
Plug 'triglav/vim-visual-increment'

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=0

Plug 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

" for auduino dev:
Plug 'MaskRay/ccls'
Plug 'vim-scripts/Arduino-syntax-file'

" autocomplete
"Plug 'prabirshrestha/vim-lsp'
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')
"let g:asyncomplete_log_file = expand('~/asyncomplete.log')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi'

call plug#end()

let g:limelight_conceal_ctermfg = 240

let g:vimtex_compiler_progname = "~/datastore/a289/anaconda2/envs/tectonic/bin/tectonic"

" trying to deal with weird terminal symbols
" https://stackoverflow.com/a/62150215
" let &t_TI = ""
" let &t_TE = ""

filetype plugin indent on
syntax enable

set nocompatible hidden laststatus=2 cursorline


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
" easy navigation through errors reported by ALE, https://vi.stackexchange.com/a/14307
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>


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
" set printoptions=portrait:n,number:y

set nowrap         " don't wrap lines

au FileType python,php set ts=4 sts=4 sw=4 expandtab nocindent

let g:tq_map_keys=0
nnoremap <S-T> :ThesaurusQueryReplaceCurrentWord<CR>
"nnoremap <S-T> :OnlineThesaurusCurrentWord<CR>


set backspace=2

" delimitMate settings
au BufNewFile,BufRead *.html let b:delimitMate_matchpairs = "(:),[:],{:}"

au FileType python,php set ts=4 sts=4 sw=4 expandtab nocindent nosmartindent
au FileType python set foldmethod=indent
au BufNewFile,BufRead *.html set ts=2 sts=2 sw=2 expandtab nocindent
au BufNewFile,BufRead *.css set ts=2 sts=2 sw=2 expandtab nocindent

let tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'


au BufNewFile,BufRead *.f90,*.F90 set ts=3 sts=3 sw=3 expandtab nocindent
au BufNewFile,BufRead *.F90 set ts=3 sts=3 sw=3 expandtab nocindent
" ensure to indent do https://stackoverflow.com/a/17619568
let fortran_do_enddo=1


au BufNewFile,BufRead *.yaml set ts=2 sts=2 sw=2 expandtab nocindent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
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

let g:syntastic_python_checkers = []

" I like new c++ features
let g:syntastic_cpp_compiler_options = ' -std=c++0x'


"Remove all trailing whitespace by pressing F5
nnoremap <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


"autocmd filetype crontab setlocal nobackup nowritebackup


"" vim-jedi config
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
