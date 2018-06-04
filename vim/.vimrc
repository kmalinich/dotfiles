let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'jedi-vim')
call add(g:pathogen_disabled, 'coveragepy')
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
" Disable folding
set nofoldenable


"""""""""""""""
" Performance "
"""""""""""""""
" 2 fast 4 u
set ttyfast
set lazyredraw
" set updatetime
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
set nocursorcolumn
set nocursorline
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
" Highlight finds
set hlsearch


""""""""""""
" Themeing "
""""""""""""
syntax on
set background=dark
set t_Co=256
colorscheme solarized


""""""""""""
" Mappings "
""""""""""""
" Toggle focus to/from NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>
" Trigger ale linting
map <silent> <C-a> :ALELint<CR>
" Ctrl-J and Ctrl-K to navigate ale errors
nmap <silent> <C-h> <Plug>(ale_previous_wrap)
nmap <silent> <C-l> <Plug>(ale_next_wrap)
" Search mappings
" If off-screen, scroll the next find to the center of the screen
nnoremap n nzzzv
nnoremap N Nzzzv
" Copy visual section to xsel
vmap <silent> <C-x> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i -selection primary", getreg("\""))<CR>
" Tabs management
nnoremap t, :tabprev<CR>
nnoremap t. :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap t> :tabm +1<CR>
nnoremap t< :tabm -1<CR>
" Clear search highlighting
nnoremap <silent> ZZ :let @/ = ""<CR>
" Copy visually selected text and search for contents
vnoremap // y/<C-R>"<CR>
" Generate ctags in current directory
map <f12> :!start /min ctags -R .<cr>
" Open tagbar
nmap <F8> :TagbarToggle<CR>
" Tags
nnoremap ]t :tnext<CR>
nnoremap [t :tprev<CR>
" CtrlPTag
nnoremap <leader>. :CtrlPTag<cr>


""""""""""""
" NERDTree "
""""""""""""
let NERDTreeIgnore = [
\	"\.pyc$",
\	"\.o$"
\]
" Open by default
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Auto-close on file open
let NERDTreeQuitOnOpen = 1
" Auto-close tab if only remaining window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Auto-delete buffer on file deletion
let NERDTreeAutoDeleteBuffer = 1
" Prettify
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"""""""
" ale "
"""""""
" Symbols
let g:ale_sign_column_always = 1
let g:ale_sign_error   = '=>'
let g:ale_sign_warning = '->'
" Message formatting
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%][%code%]: %s'
" Disable linting on text change
let g:ale_lint_on_text_changed = 'never'
" Disable linting on file open
let g:ale_lint_on_enter = 0
" Disable linting on file save
let g:ale_lint_on_save = 0
" Enable linter list
let g:ale_open_list = 1
" Close loclist when no errors found
let g:ale_keep_list_window_open = 0
" Define Python checkers
let g:ale_linters = {
\	"python": ["pylint", "mypy"],
\	"c": ["cppcheck"],
\	"cpp": ["cppcheck"],
\	"bash": ["shellcheck"]
\}


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


""""""""""""""""
" vim-sessions "
""""""""""""""""
set sessionoptions-=buffers


""""""""""""""""""""""""""""""
" Filetype-specific settings "
""""""""""""""""""""""""""""""
" C
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
au Filetype c let b:comment_leader = '/* '
au Filetype c set autoindent
au Filetype c set expandtab
au Filetype c set fileformat=unix
au Filetype c set shiftwidth=4
au Filetype c set tabstop=4
au Filetype c set softtabstop=4
"au Filetype c set foldmethod=syntax
"au Filetype c set foldnestmax=1
"au Filetype c,cpp let g:c_no_comment_fold = 1
au Filetype c,cpp let g:load_doxygen_syntax = 1
au Filetype c let g:ale_c_cppcheck_options = '-x c --std=c99 --language=c --enable=all'
" Python
au Filetype python set tabstop=8
au Filetype python set softtabstop=4
au Filetype python set expandtab
au Filetype python set shiftwidth=4
let python_highlight_all = 1
"let g:SimpylFold_fold_import = 0
"let g:SimpylFold_fold_docstring = 0
let g:ale_python_pylint_options = '--rcfile pylint.rc'
au Filetype python let g:ale_python_mypy_options = '--python-version 3.4 --follow-imports=silent --ignore-missing-imports'
" PHP
au Filetype php set tabstop=4
au Filetype php set softtabstop=4
au Filetype php set expandtab
au Filetype php set shiftwidth=4
" RestructuredText
au Filetype rst set tabstop=8
au Filetype rst set softtabstop=4
au Filetype rst set expandtab
au Filetype rst set shiftwidth=4
" JSON
au Filetype json set tabstop=2
au Filetype json set softtabstop=2
au Filetype json set expandtab
au Filetype json set shiftwidth=2
au FileType json set fdm=syntax
" text
au Filetype text set tabstop=4
au Filetype text set softtabstop=4
au Filetype text set expandtab
au Filetype text set shiftwidth=4
" sh
au Filetype sh,shell set tabstop=4
au Filetype sh,shell set softtabstop=4
au Filetype sh,shell set expandtab
au Filetype sh,shell set shiftwidth=4


"""""""""""""""""""""
" vim-indent-guides "
"""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=black


""""""""""""
" vim-jedi "
""""""""""""

"let g:jedi#use_splits_not_buffers = "top"
"let g:jedi#popup_on_dot = 1


"""""""""""""""""
" YouCompleteMe "
"""""""""""""""""

"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_extra_conf_globlist = ['/usr/share/vim/vimfiles/third_pary/ycmd/cpp/ycm/', '~/Repos/*/*']
"let g:ycm_server_python_interpreter = '/usr/bin/python2.7'


""""""""""""""""""
" DoxygenToolkit "
""""""""""""""""""

let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns "
let g:DoxygenToolkit_authorTag="@author "
"let g:DoxygenToolkit_versionTag="@version "
let g:DoxygenToolkit_compactDoc = "yes"
let g:DoxygenToolkit_authorName="Zane Mingee <zane.mingee@beyondhosting.net>"
let g:DoxygenToolkit_licenseTag="Copyright Beyond Hosting - closed source"

"""""""""""""
" Auto-save "
"""""""""""""

let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 0


"""""""""""""
" Templates "
"""""""""""""

augroup templates
	au!
	" Read in template files
	autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/templates/skeleton.'.expand("<afile>:e")

	" Parse special text in the templates after read
	autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END


""""""""
" MISC "
""""""""

" Modeline shortcut
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
	let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
		\ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>


" Highlight TODO's
augroup vimrc_todo
	au!
	au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX)/
		\ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

" Switch to last-active tab
if !exists('g:Lasttab')
    let g:Lasttab = 1
    let g:Lasttab_backup = 1
endif
autocmd! TabLeave * let g:Lasttab_backup = g:Lasttab | let g:Lasttab = tabpagenr()
autocmd! TabClosed * let g:Lasttab = g:Lasttab_backup
nnoremap <silent> tl :exe "tabn " . g:Lasttab<CR>
