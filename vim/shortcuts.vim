" Rename CTRL+C to perform an escape instaed a literal CTRL+C
imap <C-c> <C-[>

" buffer shortcuts
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

" remap <Esc> to exit terminal mode
:tnoremap <Esc> <C-\><C-n>

" prevent dbext sql error
let g:omni_sql_no_default_maps = 1

" Split, focus, open terminal and go to insert mode
nmap <Leader>tm :vs<CR><C-w>l:term<CR>a

" Clear the current search
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
