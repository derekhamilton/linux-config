set background=dark
syntax on
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set hlsearch
set ignorecase
set smartcase
set cursorline
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
set termguicolors
set number
set relativenumber
set path+=**

" Set theme
colorscheme snazzy
highlight Normal guibg=#202020

"highlight CursorLine cterm=none ctermbg=black
highlight CursorLine cterm=none ctermbg=black

" highlighting per filetype
autocmd BufRead,BufNewFile      *.txt set spell
autocmd BufRead,BufNewFile      *.src set syntax=javascript
autocmd BufRead,BufNewFile      *.tpl set syntax=php
autocmd BufRead,BufNewFile      *.handlebars set syntax=html
"autocmd BufReadPost             *.php if &ma && ! &ro | retab | endif

"highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" vdebug line highlighting
highlight DbgBreakptLine guibg=#400040 ctermbg=113 ctermfg=244
highlight DbgBreakptSign guibg=#400040 ctermbg=113 ctermfg=244
highlight DbgCurrentLine guibg=#000000 ctermbg=none ctermfg=none
highlight DbgCurrentSign guibg=#000000 ctermbg=none ctermfg=red
