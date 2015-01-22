set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

let g:airline_powerline_fonts = 1

call vundle#begin()
	Plugin 'gmarik/Vundle.vim'
	Plugin 'kien/ctrlp.vim'
	Plugin 'bling/vim-airline'
	Plugin 'myusuf3/numbers.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'fatih/vim-go'
	Plugin 'vim-scripts/bash-support.vim'
	Plugin 'vim-scripts/nginx.vim'
	Plugin 'honza/dockerfile.vim'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-rails'
	Plugin 'tpope/vim-bundler'
	Plugin 'vim-ruby/vim-ruby'
	Plugin 'nathanaelkane/vim-indent-guides'
	Plugin 'flazz/vim-colorschemes'
call vundle#end()

filetype plugin indent on

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set background=dark
set number


if has("gui_running")
	colorscheme codeschool
endif

map <silent> <C-n> :NERDTreeToggle<CR>
autocmd FileType ruby,yml,html,eruby,yaml setlocal expandtab shiftwidth=2 softtabstop=2
syntax on
