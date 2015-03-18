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
hi clear SignColumn

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

" Compiles python using pylint
autocmd FileType python compiler pylint

" Vim/Python virtualenv autocomplete
:python << EOF
import os
virtualenv = os.environ.get('VIRTUAL_ENV')
if virtualenv:
	activate_this = os.path.join(virtualenv, 'bin', 'activate_this.py')
	if os.path.exists(activate_this):
		execfile(activate_this, dict(__file__=activate_this))

