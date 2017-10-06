execute pathogen#infect()
call pathogen#helptags()

"""""""""""
" General "
"""""""""""
" Centralize backup and temporary storage
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
" Keep 1000 lines of command line history
set history=1000
filetype plugin indent on
" SPACES
let g:indentLine_setColors = 0
let g:indentLine_leadingSpaceEnabled = 1
" Shorten messages and dont show intro
set shortmess=atI


"""""""""""""""
" Performance "
"""""""""""""""
" 2 fast 4 u
set ttyfast
set lazyredraw
" Set updatetime
set updatetime=250
set norelativenumber
set synmaxcol=200


"""""""""
" Input "
"""""""""
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start


""""""""""
" Layout "
""""""""""
" Disable line wrapping
set wrap!
" Enable line numbers
set number
" Enable colorcolumn
set colorcolumn=80
" Cursor lines
set cursorcolumn
set cursorline
" Show matching brackets
set showmatch
" Keep at least 2 lines above/below
set scrolloff=2
" Keep at least 2 lines left/right
set sidescrolloff=2


"""""""""""""
" Searching "
"""""""""""""
" Case-insensitive search...
set ignorecase
" ... unless there's a capital letter
set smartcase


""""""""""""
" Themeing "
""""""""""""
syntax on
set background=dark
colorscheme solarized


""""""""""""
" Mappings "
""""""""""""
" Toggle focus to/from NERDTree
map <silent> <C-n> :NERDTreeFocusToggle<CR>
" Trigger ale linting
map <silent> <C-a> :ALELint<CR>
" Ctrl-J and Ctrl-K to navigate ale errors
nmap <silent> <C-j> <Plug>(ale_previous_wrap)
nmap <silent> <C-k> <Plug>(ale_next_wrap)
" Search mappings
" If off-screen, scroll the next find to the center of the screen
nnoremap n nzzzv
nnoremap N Nzzzv
" Copy visual section to xsel
vmap <silent> <C-x> :w !xsel<CR><CR>
" Tabs management
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap tL :tabm +1<CR>
nnoremap tH :tabm -1<CR>


"""""""
" ale "
"""""""
" Symbols
let g:ale_sign_error   = '=>'
let g:ale_sign_warning = '->'
" Disable linting on text change and file open (must save or manually trigger)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" Enable linter list
let g:ale_open_list = 1
" Keep the loc list open
let g:ale_keep_list_window_open = 0
" Use quicklist instead of loclist
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1


"""""""""""""
" Syntastic "
"""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline +=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" Load .pylintrc for syntastic
"function! FindConfig(prefix, what, where)
"    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
"    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
"endfunction
"
"autocmd FileType python let b:syntastic_python_pylint_args =
"    \ get(g:, 'syntastic_python_pylint_args', '') .
"    \ FindConfig('--rcfile', 'pylint.rc', expand('<afile>:p:h', 1))


"""""""""""""""
" vim-airline "
"""""""""""""""
set laststatus=2
let g:airline_solarized_bg='dark'
let g:airline_detect_spell=0
let g:airline_powerline_fonts=0
let g:airline_symbols_ascii=1
"let g:airline_extensions = []
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#ale#enabled = 1


""""""""""""""""""""""""""""""
" Filetype-specific settings "
""""""""""""""""""""""""""""""
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


"""""""""""""""""""""
" vim-indent-guides "
"""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=black
