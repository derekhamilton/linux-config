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
