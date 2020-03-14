call plug#begin('~/.local/share/nvim/plugged')

" async linting
Plug 'https://github.com/w0rp/ale'
let g:ale_php_php_cs_fixer_executable='~/bin/php-cs-fixer'
let g:ale_fixers = {'php': ['php_cs_fixer']}
let g:ale_php_phpcs_standard = '~/psr2-custom.xml'
let g:ale_php_phpmd_ruleset = 'unusedcode'
let g:ale_php_phpstan_executable = 'phpstan'
let g:ale_php_phpstan_use_global = 1
let g:ale_php_phpstan_level = 7
let psalm_langserver_use_global = 1
let psalm_langserver_options = "--threads=8 --diff --diff-methods"
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 0

" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 0
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" Autocompletion client for use with language servers
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
" To install the language servers, run these commands
" For PHP:
" :CocInstall coc-phpls
" For TypeScript:
" :CocInstall coc-tsserver
nmap <C-i> <Plug>(coc-definition)
nmap <Leader>rn <Plug>(coc-rename)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" For CSS formatting:
" :CocInstall coc-prettier

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

" Load neovim in textareas in the browser
Plug 'glacambre/firenvim', { 'do': function('firenvim#install') }

" Command line fuzzy finder
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
" files tracked by git
nmap <C-o> :GFiles<CR>
" current buffers
nmap <C-l> :Buffers<CR>

let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 30
  let width = float2nr(&columns - (&columns * 3 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 5,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" disable manual navigation to force movement commands
Plug 'https://github.com/wikitopian/hardmode'
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Persistent macro storage
Plug 'https://github.com/vim-scripts/marvim'

" Edit macros easily
" <Leader>qe{macro register key}
Plug 'https://github.com/zdcthomas/medit'
let g:medit_no_mappings = 1
nmap <Leader>qe <Plug>MEdit

" Buffer sidebar nav
" Plug 'https://github.com/fholgado/minibufexpl.vim'
" let g:miniBufExplVSplit = 20
" let g:miniBufExplBuffersNeeded = 1

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
" nmap <C-i> :call phpactor#GotoDefinition()<CR>
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

" Tab completion
Plug 'https://github.com/ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

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

" JavaScript linting
Plug 'mtscout6/syntastic-local-eslint.vim'

" Align Consecutive Assignments (equal signs)
" visual highlight then :Tab /=<CR>
Plug 'https://github.com/godlygeek/tabular'
vmap <C-t> :Tab /=

" Sidebar for function names, vars, etc
Plug 'https://github.com/majutsushi/tagbar'
let g:tagbar_width = 26
let g:tagbar_left = 1
"autocmd VimEnter * nested :TagbarOpen<CR>
set <F8>=[19~
"nmap <F8> :MBEClose<CR>:TagbarToggle<CR>:MBEOpen<CR>
nmap <F8> :TagbarToggle<CR>

" Debugger
Plug 'https://github.com/vim-vdebug/vdebug'
let g:vdebug_features = { 'max_children': 256 }
let g:vdebug_options= {}
let g:vdebug_options['port'] = 9001
let g:vdebug_options['break_on_open'] = 0
let g:vdebug_options['watch_window_style'] = 'compact'
let g:vdebug_options['path_maps'] = { '/var/www': $HOME.'/www' }

" Status bar
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    if l:counts.total == 0
        highlight AleStatus guifg=#ffffff  guibg=#00A000 ctermfg=255 ctermbg=87
        return 'OK'
    else
        highlight AleStatus guifg=#ffffff  guibg=#ff0000 ctermfg=255 ctermbg=88
        return printf(
    \   '%dE %dW',
    \   all_errors,
    \   all_non_errors
    \)
    endif
endfunction

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_snazzy'
let g:airline_section_c = '%#AleStatus# %{LinterStatus()} %#airline_x# %<%F'
function! AirlineInit()
endfunction
autocmd VimEnter * call AirlineInit()

" Multiline function arguments
" <Leader>A to convert single line arguments to multiline
Plug 'https://github.com/FooSoft/vim-argwrap/'
nnoremap <silent> <leader>A :ArgWrap<CR>

" Close buffers without closing the window
Plug 'https://github.com/moll/vim-bbye'
nmap <Leader>qq :Bdelete<CR>

" Syntax highlighting for Blade templates
Plug 'https://github.com/jwalton512/vim-blade'

" expressive addition of comments
Plug 'https://github.com/tpope/vim-commentary'

" Vim to character in file
Plug 'https://github.com/easymotion/vim-easymotion'
nmap <C-s> <Plug>(easymotion-s2)
nmap <C-j> <Leader><Leader>s
nmap <C-t> <Plug>(easymotion-t2)

" Git wrapper
Plug 'https://github.com/tpope/vim-fugitive'
nnoremap <space>gfa :Git add %:p<CR><CR>
nnoremap <space>gfs :Gstatus<CR>
nnoremap <space>gfc :Gcommit -v -q<CR>
nnoremap <space>gft :Gcommit -v -q %:p<CR>
nnoremap <space>gfd :Gdiff<CR>
nnoremap <space>gfe :Gedit<CR>
nnoremap <space>gfr :Gread<CR>
nnoremap <space>gfw :Gwrite<CR><CR>
nnoremap <space>gfl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gfp :Ggrep<Space>
nnoremap <space>gfm :Gmove<Space>
nnoremap <space>gfb :Git branch<Space>
nnoremap <space>gfo :Git checkout<Space>
nnoremap <space>gfps :Dispatch! git push<CR>
nnoremap <space>gfpl :Dispatch! git pull<CR>

" Tag management
Plug 'https://github.com/ludovicchabant/vim-gutentags'
" let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
let g:gutentags_file_list_command = 'rg --files . vendor'

" Highlight indentations
Plug 'https://github.com/nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guide_start_level = 2
let g:indent_guides_guide_size = 1

" indent custom text object
" use `I` to represent an indentation level
" e.g. diI for delete in the current indent level
Plug 'https://github.com/michaeljsmith/vim-indent-object'

" JSX syntax highlighting
Plug 'https://github.com/mxw/vim-jsx'

" Faster paren matching
" Plug 'https://github.com/itchyny/vim-parenmatch'
Plug 'https://github.com/luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = { 'guifgs': ['yellow', 'lightgreen', 'magenta', 'cyan'], 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'] }

" use statement import and alphabetize
Plug 'https://github.com/arnaud-lb/vim-php-namespace'
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
function! CasePhpInsertUse()
    set noignorecase
    call PhpInsertUse()
    set ignorecase
endfunction

function! ICasePhpInsertUse()
    set noignorecase
    call IPhpInsertUse()
    set ignorecase
endfunction

autocmd FileType php inoremap <Leader>u <Esc>:call ICasePhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call CasePhpInsertUse()<CR>
let g:php_namespace_sort_after_insert = 1

" Refactoring tools
Plug 'https://github.com/adoy/vim-php-refactoring-toolbox'

" Colorschemes
Plug 'https://github.com/connorholyday/vim-snazzy'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'https://github.com/cormacrelf/vim-colors-github'

" Navigate by indent level
" ]= next line of the same indent level
" ]+ next line of greater indent level
" ]- next line of lesser indent level
Plug 'https://github.com/jeetsukumaran/vim-indentwise'

" Show indicate git changes in the gutter
" ]c and [c to navigate hunks
Plug 'https://github.com/mhinz/vim-signify'
nnoremap <Leader>sghd :SignifyHunkDiff<CR>
nnoremap <Leader>sghu :SignifyHunkUndo<CR>

" jump to location by letters, like cvim
Plug 'https://github.com/t9md/vim-smalls'
let g:smalls_auto_jump = 1
let g:smalls_auto_jump_min_input_length = 2
let g:smalls_auto_jump_timeout = 0.2  " you may want to increase this
let g:smalls_auto_set = 1
let g:smalls_auto_set_min_input_length = 1
let g:smalls_exit_at_notfound = 1
nmap <Space> <Plug>(smalls)

" two-letter single line search
" s[two letters here]
" ; to move to next instance
Plug 'https://github.com/justinmk/vim-sneak'

" change surrounding characters
" ex. change 'foo' to "foo" => cs'"
Plug 'https://github.com/tpope/vim-surround'

" PHP formatting
" Plug 'https://github.com/2072/vim-syntax-for-PHP'

" vim-powered built-in wiki
" <Leader>ww to open wiki index
Plug 'https://github.com/vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" TypeScript syntax highlighting
" Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/HerringtonDarkholme/yats.vim'

" Commented out for testing undo stack
" vim-surround
" vim-syntax-for-PHP
call plug#end()

" Commented out for testing undo stack
" vim-surround
