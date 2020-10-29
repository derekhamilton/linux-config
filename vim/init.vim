set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if exists('g:started_by_firenvim')
    source ~/.config/linux-config/vim/firenvim.vim
else
    source ~/.config/linux-config/vim/plugs.vim
    if &diff
        source ~/.config/linux-config/vim/diff.vim
    else
        source ~/.config/linux-config/vim/standard.vim
        source ~/.config/linux-config/vim/shortcuts.vim
        " source ~/.config/linux-config/vim/status-line.vim
    endif
endif

let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'selector': 'textarea, div[role="textbox"]',
            \ 'priority': 0,
        \ },
        \ '.*\.slack\.com': { 'selector': '', 'priority': 0 },
        \ 'facebook\.com': { 'selector': '', 'priority': 0 },
        \ 'twitter\.com': { 'selector': '', 'priority': 0 },
        \ 'twitch.tv': { 'selector': '', 'priority': 0 },
        \ 'hangouts.google.com': { 'selector': '', 'priority': 0}
    \ }
\ }
