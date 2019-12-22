call plug#begin('~/.local/share/nvim/plugged')

" Load neovim in textareas in the browser
Plug 'glacambre/firenvim', { 'do': function('firenvim#install') }
Plug 'https://github.com/cormacrelf/vim-colors-github'

call plug#end()

" ---------------- Standard vim config --------------------------------
set background=light
syntax on
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set hlsearch
set lazyredraw
set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc file
set hidden
set nostartofline
set fileformats+=dos
set noeol
scriptencoding utf-8
set encoding=utf-8
set nofoldenable
set noshowmatch     " prevent <?php matching against first method call
set nomodeline
set laststatus=1
colorscheme github

" Rename CTRL+C to perform an escape instaed a literal CTRL+C
imap <C-c> <C-[>
