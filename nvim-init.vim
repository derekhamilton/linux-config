set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if exists('g:started_by_firenvim')
  source ~/.vimrc-firenvim
else
  if &diff
    source ~/.vimrc-diff
  else
    source ~/.vimrc
  endif
endif

let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'selector': 'textarea, div[role="textbox"]',
            \ 'priority': 0,
        \ }
    \ }
\ }
