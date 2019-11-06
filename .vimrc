call plug#begin('~/.local/share/nvim/plugged')

" Autocompletion client for use with language servers
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
" To install the language servers, run these commands
" For PHP:
" :CocInstall coc-phpls
" For TypeScript:
" :CocInstall coc-tsserver

" fuzzy file search
Plug 'https://github.com/kien/ctrlp.vim'
" search project files by name
nnoremap <A-h> <C-o>
nnoremap <A-l> <C-i>
let g:ctrlp_map = '<C-o>'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/files/*,*/photoArchive/*,*/node_modules/*,*/dump/*,*/_private/*
" Search file names in open buffers
nmap <C-l> :CtrlPBuffer<CR>

" HTML expansion to full tags
" e.g. div.container>span.label>a.link<C-y>,
Plug 'https://github.com/mattn/emmet-vim'

" Multifile search with :Ack command
" :Ack [patternhere]
" :Acks /[patternhere]/replacewith/
" <Leader>r populates :Acks with the last search of :Ack
" Escaping isn't perfect in all cases and changes from vim mode
" Ack Collection< in Acks needs to be :Acks Collection\<
Plug 'https://github.com/wincent/ferret'
" Use vim +job to run in the background
" Prevents errors from too many buffers
let g:FerretJob=0

" Command line fuzzy finder
Plug 'https://github.com/junegunn/fzf.vim'
set rtp+=~/.fzf
let g:fzf_files_options = '--preview "(bat --style=numbers --color=always {}) 2> /dev/null | head -'.&lines.'"'

" the space after Rg is intentional
" grep file contents and show a list of matches
nmap <Leader>g :Rg 
" grep file contents for word under cursor and show a list of matches
nmap <Leader>G :Rg <C-r>=expand("<cword>")<CR><CR>
" show list of marks
nmap <C-m> :Marks<CR>

" Persistent macro storage
Plug 'https://github.com/vim-scripts/marvim'

" More detail on matching bracket line
Plug 'https://github.com/vim-scripts/matchparenpp'

" Buffer sidebar nav
Plug 'https://github.com/fholgado/minibufexpl.vim'
let g:miniBufExplVSplit = 20
let g:miniBufExplBuffersNeeded = 1

" Generates PHP doc blocks
Plug 'https://github.com/tobyS/pdv'
Plug 'https://github.com/tobyS/vmustache'
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/algotech/ultisnips-php'
let g:UltiSnipsExpandTrigger="<tab>"

let g:pdv_template_dir = $HOME ."/.local/share/nvim/plugged/pdv/templates"
nnoremap <C-h> :call pdv#DocumentWithSnip()<CR>

" Set of completiong and refactoring tools
Plug 'https://github.com/phpactor/phpactor', {'do': ':!composer install -d ~/.local/share/nvim/plugged/phpactor'}
" autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:phpactorOmniError = v:true
" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone ",noselect
" Include use statement
" nmap <Leader>u :call phpactor#UseAdd()<CR>
" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>
" Goto definition of class or class member under the cursor
nmap <C-i> :call phpactor#GotoDefinition()<CR>
" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>
" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>
" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>
" Scan for all references to a class member in the project
nmap <Leader>ff :call phpactor#FindReferences()<CR>
" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
" Extract method from selection
" vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

" Indentation rules
Plug 'https://github.com/2072/PHP-Indenting-for-VIm'

" Python syntax rules, linting, etc.
" Plug 'https://github.com/python-mode/python-mode.git'

" Set of tools
" Plug 'https://github.com/spf13/PIV'
"" PIV settings
" let g:DisableAutoPHPFolding = 1
" Remove some annoying stuff when use omni completion, checkout the vim help for more detail
" set completeopt-=preview
" set completeopt+=menu,menuone,noinsert,noselect
" set shortmess+=c

" Tab completion
Plug 'https://github.com/ervandew/supertab'
vmap <C-t> :Tab /=

" Syntax checking
Plug 'https://github.com/vim-syntastic/syntastic'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['eslint']
let g:syntastic_python_checkers=['flake8']

Plug 'mtscout6/syntastic-local-eslint.vim'

" Align Consecutive Assignments (equal signs)
" visual highlight then :Tab /=<CR>
Plug 'https://github.com/godlygeek/tabular'

" Sidebar for function names, vars, etc
Plug 'https://github.com/majutsushi/tagbar'
let g:tagbar_width = 26
autocmd VimEnter * nested :call tagbar#autoopen(1)
set <F8>=[19~
nmap <F8> :MBEClose<CR>:TagbarToggle<CR>:MBEOpen<CR>

" TypeScript syntax
Plug 'https://github.com/leafgarland/typescript-vim'

" CTRL+o File finder
Plug 'https://github.com/Shougo/unite.vim'

" Multiline function arguments
" <Leader>A to convert single line arguments to multiline
Plug 'https://github.com/FooSoft/vim-argwrap/'
nnoremap <silent> <leader>A :ArgWrap<CR>

" Debugger
Plug 'https://github.com/vim-vdebug/vdebug'
let g:vdebug_options = {
      \ 'port' : 9000,
      \}

" Auto update ctags
" Plug 'https://github.com/craigemery/vim-autotag'

" Syntax highlighting for Blade templates
Plug 'https://github.com/jwalton512/vim-blade'

" Vim to character in file
Plug 'https://github.com/easymotion/vim-easymotion'
nmap <C-s> <Plug>(easymotion-s2)
nmap <C-j> <Leader><Leader>s
nmap t <Plug>(easymotion-t2)

" Git wrapper
Plug 'https://github.com/tpope/vim-fugitive'

" Tag management
Plug 'https://github.com/ludovicchabant/vim-gutentags'

" Highlight indentations
Plug 'https://github.com/nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guide_start_level = 2
let g:indent_guides_guide_size = 1

" JSX syntax highlighting
Plug 'https://github.com/mxw/vim-jsx'

" Faster paren matching
Plug 'https://github.com/itchyny/vim-parenmatch'

" use statement import and alphabetize
Plug 'https://github.com/arnaud-lb/vim-php-namespace'
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
let g:php_namespace_sort_after_insert = 1

" Refactoring tools
Plug 'https://github.com/adoy/vim-php-refactoring-toolbox'

" Don't think is relevant anymore
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Colorschemes
Plug 'https://github.com/connorholyday/vim-snazzy'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" async linting
Plug 'https://github.com/w0rp/ale'
let g:ale_php_php_cs_fixer_executable='~/bin/php-cs-fixer'
let g:ale_fixers = {'php': ['php_cs_fixer']}
let g:ale_php_phpcs_standard = '~/psr2-custom.xml'
let g:ale_php_phpmd_ruleset = 'codesize,controversial,design,unusedcode'
let g:ale_php_phpstan_executable = 'phpstan'
let g:ale_php_phpstan_use_global = 1
let g:ale_php_phpstan_level = 7
let g:ale_fix_on_save = 1

" TypeScript syntax highlighting
Plug 'https://github.com/HerringtonDarkholme/yats.vim'

call plug#end()




" ---------------- Standard vim config --------------------------------
set background=dark
syntax on
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set hlsearch
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

" Rename CTRL+C to perform an escape instaed a literal CTRL+C
imap <C-c> <C-[>

" Set theme
colorscheme snazzy
hi Normal guibg=#202020
let g:jellybeans_overrides = {
\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
\              'attr': 'bold' },
\}

"hi CursorLine cterm=none ctermbg=black
hi CursorLine cterm=none ctermbg=black

if &diff

" if doing diffs the only config should be showing line numbers
set nu

else

set nu
set rnu " relative line numbers

" Left Padding
" set foldcolumn=1

" Left Padding background color dark grey
" hi FoldColumn ctermbg=233

autocmd BufRead,BufNewFile      *.txt set spell
autocmd BufRead,BufNewFile      *.src set syntax=javascript
autocmd BufRead,BufNewFile      *.tpl set syntax=php
autocmd BufRead,BufNewFile      *.handlebars set syntax=html
"autocmd BufReadPost             *.php if &ma && ! &ro | retab | endif

" Use 256 color mode
" set t_Co=256

"highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" buffer shortcuts
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

" remap <Esc> to exit terminal mode
:tnoremap <Esc> <C-\><C-n>

" statusline settings
set statusline=
set statusline+=%1*\[%n]                                 "buffernr
set statusline+=\ %<%F\                                  "File+path
set statusline+=%2*\ %y\                                 "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}     "Encoding
set statusline+=%4*\ %{(&bomb?\",BOM\":\"\")}\           "Encoding2
set statusline+=%5*\ %=\ row:%l/%L\                      "Rownumber/total (%)
set statusline+=%6*\ words:%{len(split(getline('.')[col('.'):]))}\  "Words after cursor
set statusline+=%6*%{len(split(getline('.')))}\          "Words on the line
" set statusline+=%6*%{WordCount()}\                       "Total word count
set statusline+=%7*\ col:%03c\                           "Colnr
set statusline+=%8#warningmsg#
" set statusline+=%8{SyntasticStatuslineFlag()}
"set statusline+=%0*\ %y%=%{v:register}\                  "Current paste register
"set statusline+=%6*\ \ %m%r%w\ %P\ \                     "Modified? Readonly? Top/bot.


function! HighlightSearch()
    return &hls ? 'H' : ''
endfunction

function! WordCount()
    let s:old_status = v:statusmsg
    let position = getpos(".")
    exe ":silent normal g\<c-g>"
    let stat = v:statusmsg
    let s:word_count = 0
    if stat != '--No lines in buffer--'
        let s:word_count = str2nr(split(v:statusmsg)[11])
        let v:statusmsg = s:old_status
    end
    call setpos('.', position)
    return s:word_count
endfunction

hi User1 guifg=#ffdad8  guibg=#880c0e   ctermfg=255 ctermbg=88
hi User2 guifg=#000000  guibg=#F4905C   ctermfg=0   ctermbg=209
hi User3 guifg=#292b00  guibg=#f4f597   ctermfg=0   ctermbg=228
hi User4 guifg=#112605  guibg=#aefe7B   ctermfg=0   ctermbg=155
hi User5 guifg=#051d00  guibg=#7dcc7d   ctermfg=0   ctermbg=77
hi User6 guifg=#ffffff  guibg=#5b7fbb   ctermfg=255 ctermbg=27
hi User7 guifg=#ffffff  guibg=#810085   ctermfg=255 ctermbg=90
hi User8 guifg=#ffffff  guibg=#880c0e   ctermfg=255 ctermbg=88   gui=bold
hi User0 guifg=#ffffff  guibg=#094afe   ctermfg=255 ctermbg=27
hi statusline ctermfg=255 ctermbg=237

endif

" Padawan
" let g:padawan#composer_command = "/usr/local/bin/composer"

" prevent dbext sql error
let g:omni_sql_no_default_maps = 1

" Split, focus, open terminal and go to insert mode
nmap <Leader>tm :vs<CR><C-w>l:term<CR>a

" Closed search
nmap <C-_> :let @/=""<CR>

" Convert MySQL table to CSV
nmap <Leader>mycsv :g/^+/d <bar> %s/^\| /"/g <bar> %s/ \| /\",\"/g <bar> %s/\s\+\"/\"/g <bar> %s/\s\+\|/\"/g<CR>

" Format SQL
nmap <Leader>sql :%!sqlformat --reindent --keywords upper -<CR>

" Toggle fix on save
function! FixOnSaveToggle()
    echo "RUNNING"
    if g:ale_fix_on_save
        let g:ale_fix_on_save = 0
    else
        let g:ale_fix_on_save = 1
    endif
endfunction
nmap <Leader>fos FixOnSaveToggle()
