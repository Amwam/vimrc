execute pathogen#infect()
syntax on
filetype plugin indent on
set number

" Nerd tree with Cntrl-N
map <C-n> :NERDTreeToggle<CR>

" Tab options
set expandtab " Insert spaces instead of tabs
set tabstop=4 " 4 spaces for every tab

" Option click inside vim
set mouse=a

set bs=2 " make backspace behave like normal again

let NERDTreeShowHidden=1

let mapleader = ","

" Search improvements
set incsearch "Highlight as you search
set ignorecase "ignore case when seaching
set smartcase "Ignores case, except when capitals are used

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Change the color of the sign/gutter to be clear
"hi clear SignColumn

" set the color scheme
color darcula

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

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    autocmd FileType python set colorcolumn=120
    augroup END


"===================================
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

let g:pymode_rope_goto_definition_bind = '<Leader>g'

let g:pymode_rope = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_autoimport = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K' 

let g:pymode_folding = 0 " Don't auto fold code

let g:pymode_options_max_line_length = 120 " set line length to 120
 
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Support virtualenv
let g:pymode_virtualenv = 1

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pylint" " comma separated list of tools (such as pyflakes,pep8
"" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_lint_unmodified = 0 " Run on every save, even if unchanged
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1

"===================================

