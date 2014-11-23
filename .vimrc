set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set number

call vundle#begin()
	Plugin 'gmarik/Vundle.vim'
	Plugin 'spf13/vim-colors'
	Plugin 'kien/ctrlp.vim'
	Plugin 'bling/vim-airline'
	Plugin 'myusuf3/numbers.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'fatih/vim-go'
	Plugin 'vim-scripts/bash-support.vim'
	Plugin 'vim-scripts/nginx.vim'
	Plugin 'honza/dockerfile.vim'
	Plugin 'tpope/vim-surround'
call vundle#end()

filetype plugin indent on
map <silent> <C-n> :NERDTreeToggle<CR>
