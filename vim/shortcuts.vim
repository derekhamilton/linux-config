" Remap CTRL+C to perform an escape instead a literal CTRL+C
imap <C-c> <C-[>

" buffer shortcuts
":nnoremap <C-n> :bnext<CR>
":nnoremap <C-p> :bprevious<CR>
:nnoremap <C-p> :b#<CR>

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

" Format JSON
nmap <Leader>json :%!python -m json.tool<CR>

" Formal XML
nmap <Leader>xml :% ! xmllint --format -<CR>

" Run phpunit
nmap <Leader>pu :!vendor/bin/phpunit %<CR>

" Toggle fix on save
function! FixOnSaveToggle()
    if g:ale_fix_on_save
        let g:ale_fix_on_save = 0
        echo "ALE Fix On Save [Off]"
    else
        let g:ale_fix_on_save = 1
        echo "ALE Fix On Save [On]"
    endif
endfunction
nmap <Leader>fos :call FixOnSaveToggle()<CR>

" coc-prettier
" Installed with :CocInstall coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" output current file path
nmap <Leader>file :echo expand("%:p")<CR>

" copy current file path
nmap <Leader>yfile :let @+ = expand("%:p")<CR>:echo "Copied " . expand("%:p")<CR>
