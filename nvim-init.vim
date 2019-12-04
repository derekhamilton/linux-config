set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"if get(g:, 'started_by_firenvim', 0)
"    " load firenvim vimrc
"    get(g:, 'started_by_firenvim', 0)
"else
"    source ~/.vimrc
"endif
if exists('g:started_by_firenvim')
  source ~/.vimrc-firenvim
else
  source ~/.vimrc
endif

let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'selector': 'textarea, div[role="textbox"]',
            \ 'priority': 0,
        \ }
    \ }
\ }
