set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'L9' "'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'
"Plugin 'Raimondi/delimitMate'
Plugin 'Chiel92/vim-autoformat'
"Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:ycm_global_ycm_extra_conf ='~/.vim/.ycm_extra_conf.py'
let g:formatdef_harttle = '"astyle --style=attach --pad-oper"'
let g:formatters_cpp = ['harttle']
let g:formatters_java = ['harttle']
noremap <F3> :Autoformat<CR>
inoremap <F3> :Autoformat<CR>
noremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
inoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
noremap <F9>  <Esc>:w<CR>:!g++ -std=c++11 -Wall -Wextra -Wconversion -Wshadow -fsanitize=address -fsanitize=undefined -fsanitize-address-use-after-scope -fsanitize=signed-integer-overflow % -o %.o && echo -e "\n------------------------------"<CR>
inoremap <F9>  <Esc>:w<CR>:!g++ -std=c++11 -Wall -Wextra -Wconversion -Wshadow -fsanitize=address -fsanitize=undefined -fsanitize-address-use-after-scope -fsanitize=signed-integer-overflow % -o %.o && echo -e "\n------------------------------"<CR>
noremap <F5> <Esc>:w<CR>:!g++ -std=c++11 -Wall -Wextra -Wconversion -Wshadow -fsanitize=address -fsanitize=undefined -fsanitize-address-use-after-scope -fsanitize=signed-integer-overflow % -o %.o && echo -e "\n------------------------------" && ./%.o<CR>
inoremap <F5> <Esc>:w<CR>:!g++ -std=c++11 -Wall -Wextra -Wconversion -Wshadow -fsanitize=address -fsanitize=undefined -fsanitize-address-use-after-scope -fsanitize=signed-integer-overflow % -o %.o && echo -e "\n------------------------------" && ./%.o<CR>

set bg=dark
set autoindent
set number
syntax on
set tabstop=4
set shiftwidth=4
set mouse=a
set backspace=indent,eol,start

set foldmethod=indent   
set foldnestmax=10
"set guifont=Consolas
set ruler
