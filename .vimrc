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
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'};

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
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'

function Term()
	call term_start("bash",{"term_rows":6,"term_name":"vimshell"})
endfunction

function Gdb()
	call term_start(join(["gdb ",expand("%:p:r")]),{"term_rows":6,"term_name":"Debug"})
endfunction

function Run()
	call term_start(expand("%:p:r"),{"term_rows":6,"term_name":"Run program"})
endfunction

function Comp()
	call term_start(join(["g++ -std=c++0x -Wall -g -o ",expand("%:p:r")," ",expand("%:p")]),{"term_rows":6,"term_name":"Comp"})
endfunction

function Nav(problem)
	call term_start(join(["w3m https://www.luogu.org/problem/",a:problem],""),{"vertical":1,"term_cols":35})
endfunction


se nu cc=80 autoread ts=8 sw=8 tw=80 cindent autoindent
color gruvbox
se mouse=a
imap jk <ESC>
imap <F5> <ESC>ggO#include<bits/stdc++.h><ESC>o
map <F5> ggO#include<bits/stdc++.h><ESC>o
imap <F3> <ESC>:make<CR>
map <F3> :make<CR>
imap <F7> <ESC>:call Comp()<CR>
map <F7> :call Comp()<CR>
imap <F8> <ESC>:call Run()<CR>
map <F8> :call Run()<CR>
imap <F9> <ESC>:call Gdb()<CR>
map <F9> :call Gdb()<CR>
imap <C-b> <ESC>:q<CR>
map <C-b> :q<CR>
command -nargs=1 Nav call Nav(<q-args>)
let g:rainbow_active=1
let vim_markdown_preview_github=1
