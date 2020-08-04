function! VexToggle(dir)
  if exists("t:vex_buf_nr") "to track whether the sidebar is currently open. The t: is scoping the variable to the current tab, so each tab can have its own sidebar. 
    call VexClose()
  else
    call VexOpen(a:dir) "the `dir` argument that was passed into VexToggle()
  endif
endfunction

function! VexOpen(dir)
  let vex_width = 30

 "we use vimscript’s string concatenation operator (.) to compose the Vexplore call.
  execute "Vexplore " . a:dir
  let t:vex_buf_nr = bufnr("%") "now that we have an explorer open - remember it
 "If you have several splits open, calling :Vexplore will open a Netrw explorer in a vertical split next to the current split,
 "so there’s no guarantee it will sit on the far left of the screen or even occupy the full height of Vim. Calling wincmd H fixes that. 
  wincmd H

  call VexSize(vex_width)
endfunction

function! VexClose()
  let cur_win_nr = winnr() "save which window it was called from, so it can return the cursor to that window after the sidebar has closed.
  "when the cursor was in the sidebar when VexClose() was called, in which case the cursor will land in the previous window (whichever window holds the alternate file '#')
  let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  "switches to the sidebar and then close it
  1wincmd w "we have to subtract 1 from the original window number that was stored, since closing the sidebar window decremented all the remaining window numbers.
  close
  unlet t:vex_buf_nr "removes the internal variable that was tracking its presence

  "switch to the appropriate destination window
  execute (target_nr - 1) . "wincmd w"
  call NormalizeWidths()
endfunction

"sets and locks the sidebar width
function! VexSize(vex_width)
  execute "vertical resize" . a:vex_width
  set winfixwidth
  call NormalizeWidths()
endfunction

"normalize the widths of all open windows without affecting their heights.
function! NormalizeWidths()
  let eadir_pref = &eadirection
  set eadirection=hor
  set equalalways! equalalways!
  let &eadirection = eadir_pref
endfunction

"Netrw lets you open a selected file in a vertical split with the `v` key, we want to normalize window widths when such a split was added so things would remain evenly sized.
augroup NetrwGroup
  autocmd! BufEnter * call NormalizeWidths()
augroup END

nnoremap <F2> :call VexToggle(getcwd())<CR>
nnoremap <F3> :call VexToggle("")<CR>

"Change directory to the current buffer when opening files.
"set autochdir
"Explorer with tree like style
let g:netrw_liststyle = 3
"Explorer stays in his window, file is opened within new one
let g:netrw_browse_split = 4
"Explorer window size
let g:netrw_winsize=30
"Turn off banner
let g:netrw_banner=0

