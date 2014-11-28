set nocompatible 
filetype off

set background=dark
set t_Co=16
set rtp+=~/.vim/bundle/Vundle.vim
set number

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

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
call vundle#end()

colorscheme codeschool
filetype plugin indent on
map <silent> <C-n> :NERDTreeToggle<CR>

silent !wmctrl -r :ACTIVE: -b add,fullscreen
syntax on
