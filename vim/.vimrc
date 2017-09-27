execute pathogen#infect()
syntax on
set background=dark
colorscheme solarized
filetype plugin indent on

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Keep 1000 lines of command line history
set history=100

" 2 fast 4 u
set ttyfast
set lazyredraw

" Disable line wrapping
set wrap!

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline +=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" C
au Filetype c,cpp let b:comment_leader = '/* '
au Filetype c,cpp set autoindent
au Filetype c,cpp set expandtab
au Filetype c,cpp set fileformat=unix
au Filetype c,cpp set shiftwidth=4
au Filetype c,cpp set tabstop=4
au Filetype c,cpp set softtabstop=4
au Filetype c,cpp set foldmethod=syntax

" Python
au Filetype python set tabstop=8
au Filetype python set softtabstop=4
au Filetype python set expandtab
au Filetype python set shiftwidth=4
let python_highlight_all = 1
let g:SimpylFold_fold_import = 0
let g:SimpylFold_fold_docstring = 0
let g:ale_python_pylint_options = '--rcfile pylint.rc'
let g:ale_open_list = 1

" RestructuredText
au Filetype rst set tabstop=8
au Filetype rst set softtabstop=4
au Filetype rst set expandtab
au Filetype rst set shiftwidth=4

" JSON
au Filetype json set tabstop=4
au Filetype json set softtabstop=4
au Filetype json set expandtab
au Filetype json set shiftwidth=4
au FileType json set fdm=syntax

" text
au Filetype text set tabstop=4
au Filetype text set softtabstop=4
au Filetype text set expandtab
au Filetype text set shiftwidth=4

" SPACES
let g:indentLine_setColors = 0
let g:indentLine_leadingSpaceEnabled = 1

" Airline
set laststatus=2
let g:airline_solarized_bg='dark'
let g:airline_detect_spell=0
let g:airline_powerline_fonts=0
let g:airline_symbols_ascii=1
let g:airline_extensions = []
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Enable line numbers
set number

" Enable colorcolumn
set colorcolumn=80

" Tabs
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap tL :tabm +1<CR>
nnoremap tH :tabm -1<CR>

" xsel on visual
vmap <silent> <C-x> :w !xsel<CR><CR>

" Real men use spaces
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=black

" Cursor lines
set cursorcolumn
set cursorline

" Performance tuning
set norelativenumber
set synmaxcol=200

" Ale config
" Ctrl-J and Ctrl-K to navigate ale errors
nmap <silent> <C-j> <Plug>(ale_previous_wrap)
nmap <silent> <C-k> <Plug>(ale_next_wrap)
" ale (Asynchronous Lint Engine) symbol config
let g:ale_sign_error   = '=>'
let g:ale_sign_warning = '->'
" Increase lint delay to 1 second
let g:ale_lint_delay = 5000

" Auto reload .vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Centralize backup and temporary storage
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Case-insensitive search...
set ignorecase
" ... unless there's a capital letter
set smartcase
"
" Search mappings
" If off-screen, scroll the next find to the center of the screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Show matching brackets
set showmatch

" Keep at least 2 lines above/below
set scrolloff=2
" Keep at least 2 lines left/right
set sidescrolloff=2

" Shorten messages and dont show intro
set shortmess=atI

" Load .pylintrc for syntastic
"function! FindConfig(prefix, what, where)
"    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
"    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
"endfunction
"
"autocmd FileType python let b:syntastic_python_pylint_args =
"    \ get(g:, 'syntastic_python_pylint_args', '') .
"    \ FindConfig('--rcfile', 'pylint.rc', expand('<afile>:p:h', 1))

map <silent> <C-n> :NERDTreeFocusToggle<CR>
"nmap sph :SyntasticCheck sphinx<CR>
