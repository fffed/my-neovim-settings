"Remove trailing spaces on save for specified files
autocmd BufWritePre  *.{js.,ts.}  call TrimWhitespace()

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

" winsaveview() will save the current 'view', which includes the cursor position, folds, jumps, etc.
" winrestview() at the end will restore this from the saved variable.
" :keeppatterns prevents the \s\+$ pattern from being added to the search history.
" The last-used search term is automatically restored after leaving a function, so we don't have to do anything else for this.
