function! MyHighlights() abort
   highlight! link cssPositioningProp GruvboxAqua
   highlight! link cssMediaProp GruvboxAqua
   highlight! link cssBorderProp GruvboxAqua
   highlight! link javascriptReserved GruvboxRed
   highlight! link javascriptDebugger GruvboxRedBold
   highlight! link styledNestedRegion GruvboxAqua
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

"Showing highlight groups
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

map <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
