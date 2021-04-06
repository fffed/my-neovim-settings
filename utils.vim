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
  " autocmd BufWritePre  *.{js,jsx,ts,tsx,json}  call TrimWhitespace()
augroup END

"Auto save files when focus is lost
"The command will complain if you have untitled buffers open.
augroup autoSave
  autocmd!
  autocmd FocusLost * wall
augroup END

augroup autoSourceVim
  autocmd!
   "automatically source all the neovim related files after saving it
  autocmd bufwritepost *.vim source $MYVIMRC
augroup END


"add any cscope database in current directory
"if filereadable("cscope.out")
"    cs add cscope.out  
"" else add the database pointed to by environment variable 
"elseif $CSCOPE_DB != ""
"    cs add $CSCOPE_DB
"endif


function! InsertSkeleton(extention) abort
  let filename = expand('%')
  let componentName = expand('%:t:r')

  " abort on non-empty buffer or exitant file
  if !(line('$') == 1 && getline('$') == '') || filereadable(filename)
    return
  endif

  execute '0r $HOME/.config/nvim/templates/skeleton.' . a:extention .''
            \ .'| %s/Component/' . componentName . '/g'
            \ .'| /function '
endfunction

augroup templates
    autocmd!
    autocmd BufNewFile *.jsx call InsertSkeleton('jsx')
    autocmd BufNewFile *.tsx call InsertSkeleton('tsx')
augroup END

"rename current file with saving undo history via 'saveas'
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        exec ':silent bw ' . old_name
        redraw!
    endif
endfunction
nmap <Leader>n :call RenameFile()<cr>

augroup highlightYank
  au!
  au TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 200 })
augroup END
