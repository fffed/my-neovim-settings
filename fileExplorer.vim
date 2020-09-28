"disable netrw entirely and use something else
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
"let g:NetrwIsOpen=0
"function! ToggleNetrw()
"    if g:NetrwIsOpen
"        let i = bufnr("$")
"        while (i >= 1)
"            if (getbufvar(i, "&filetype") == "netrw")
"                silent exe "bwipeout " . i 
"            endif
"            let i-=1
"        endwhile
"        let g:NetrwIsOpen=0
"    else
"        let g:NetrwIsOpen=1
"        silent Lexplore
"    endif
"endfunction
"
"nnoremap <F2> :call ToggleNetrw()<CR>
"
""Change directory to the current buffer when opening files.
""set autochdir
""Explorer with tree like style
"let g:netrw_liststyle = 3
""Explorer stays in his window, file is opened within new one
"let g:netrw_browse_split = 4
""Explorer window size
"let g:netrw_winsize=20
""Turn off banner
"let g:netrw_banner=0

