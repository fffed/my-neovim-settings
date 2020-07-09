"Remove trailing spaces on save for specified files
function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

" winsaveview() will save the current 'view', which includes the cursor position, folds, jumps, etc.
" winrestview() at the end will restore this from the saved variable.
" :keeppatterns prevents the \s\+$ pattern from being added to the search history.
" The last-used search term is automatically restored after leaving a function, so we don't have to do anything else for this.
augroup trimSpaces
  autocmd!
  autocmd BufWritePre  *.{js,jsx,ts,tsx,json}  call TrimWhitespace()
augroup END

"Auto save files when focus is lost
"The command will complain if you have untitled buffers open.
:au FocusLost * :wa

augroup autoSourceVim
  autocmd!
   "automatically source all the neovim related files after saving it
  autocmd bufwritepost *.vim source $MYVIMRC
augroup END

