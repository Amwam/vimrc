execute pathogen#infect()
syntax on " Syntax highlighting
filetype plugin indent on
set relativenumber " Line numbers in the gutter
set number " Show the current line number instead of '0'
set hidden " hide buffers instead of closing
set title " Change the terminal title

let mapleader = " "
" When not in insert mode, use normal line numbers, Write mode for relative
autocmd InsertEnter * :set norelativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"Don't use vims backup/swapfiles
set nobackup
set noswapfile

set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting

" Toggle the tag bar
nnoremap <F7> :TagbarToggle<CR>

" Run python module (useful?)
map <F10> :RunModule<CR>


" Force the use of hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Flip the background color to be dark when in 'Insert' mode
augroup modes
  autocmd!
  autocmd InsertEnter * :hi Normal ctermfg=146 ctermbg=233 cterm=NONE guifg=#a9b7c6 guibg=#000000 gui=NONE
  autocmd InsertLeave * :hi Normal ctermfg=146 ctermbg=235 cterm=NONE guifg=#a9b7c6 guibg=#2b2b2b gui=NONE
augroup END

" Write the file if there is a change, on exiting insert mode
au InsertLeave * if &mod && expand('%')!=''|write|endif

" Leave insert mode quickly
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Write file on focus lost
au FocusLost * :wa

set textwidth=150 " default text width, purposly high just in case

" Nerd tree with Cntrl-N
map <C-n> :NERDTreeToggle<CR>

" NerdTree ignore certain file types (array of regular expressions
let NERDTreeIgnore = ['\.pyc$', '.DS_Store$', '.git/*', '.idea/*']

" Tab options
set expandtab " Insert spaces instead of tabs
set tabstop=4 " 4 spaces for every tab
set shiftwidth=4

set mouse=a " Option click inside vim

set bs=2 " make backspace behave like normal again

let NERDTreeShowHidden=1

" Search improvements
set incsearch "Highlight as you search
set ignorecase "ignore case when seaching
set smartcase "Ignores case, except when capitals are used

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" set the color scheme
color darcula

" Change the background and foreground color of the gutter to be black
highlight SignColumn ctermbg=black ctermfg=black guibg=#000000 guifg=#000000

" Set the line limits for a git commit message
au FileType gitcommit set tw=72 | set spell | set colorcolumn=69

" Show the vim-airline always
set laststatus=2

" Trim trailing whitespace on save, for specified file types only
autocmd BufWritePre *.{py,h,c,java,rs,js,json,php} :%s/\s\+$//e

" enables :Paste to just do what you want
command Paste execute 'set noai | insert | set ai'

" Minimap stuff
let g:minimap_highlight='Visual'

" Set the clipboard to use the OS X default, rather than vim's
set clipboard=unnamed

" highlight variables with '*'
nnoremap * yiw:let @/=@"<CR>:set hls<CR>zz

" Turn off by double tapping ,
nnoremap <leader><leader> :set hls!<CR>

nmap <leader>a <Esc>:Ack! <space>

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 100
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%100v.*/
    autocmd FileType python set nowrap
    autocmd FileType python set colorcolumn=100
    augroup END

let g:ctrlp_custom_ignore = 'pyc$'
nnoremap <leader>. :CtrlPTag<cr>

" Speed up ctrlp by using a cache dir
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag') " may need to install the_silver_searcher via brew
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator
" modes)

"Enable Rope
let g:pymode_rope = 1

" Remap go to definition 
let g:pymode_rope_goto_definition_bind = "<leader>g"

" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

let g:pymode_folding = 0 " Don't auto fold code

let g:pymode_options_max_line_length = 100 " set line length to 100

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Support virtualenv
let g:pymode_virtualenv = 1

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes" " comma separated list of tools (such as pyflakes,pep8
"" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_lint_unmodified = 0 " Run on every save, even if unchanged
let g:pymode_lint_on_fly = 1
let g:pymode_lint_message = 1
let g:pymode_lint_signs = 1

"===================================

let g:easytags_async = 1
let g:easytags_languages = {
            \ 'javascript': {
            \    'cmd': 'jsctags',
            \    'args': [],
            \    'fileoutput_opt': '-f',
            \    'stdout_opt': '-f-',
            \    'recurse_flag': '-R',
            \   }
            \ }
let g:easytags_file = './tags'
:let g:easytags_auto_update = 1

"Syntastic settings
" Use rope of python stuff
let g:syntastic_ignore_files = ['\.py$']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

"React
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

