function! MyHighlights() abort
"   highlight! link cssPositioningProp GruvboxAqua
"   highlight! link cssMediaProp GruvboxAqua
"   highlight! link cssBorderProp GruvboxAqua
    highlight! link javascriptReserved GruvboxRed
    highlight! link javascriptDebugger GruvboxRedBold
    highlight! link typescriptDebugger GruvboxRedBold
    highlight! link javascriptString GruvboxFg3
    highlight! link javascriptDomEventTargetMethod GruvboxAqua
    highlight! link javascriptObjectStaticMethod GruvboxAqua
    highlight! link javascriptPaymentShippingOptionProp GruvboxYellow
    highlight! link javascriptES6SetMethod GruvboxYellow
    "make ts and js history the same
    highlight! link javascriptImport GruvboxOrange
    highlight! link javascriptExport GruvboxOrange
    highlight! link javascriptVariable GruvboxBlue
    highlight! link typescriptString GruvboxFg3
"   highlight! link styledNestedRegion GruvboxAqua
"   change background
    hi clear Normal
    hi Normal guifg=GruvboxFg1 ctermfg=249 guibg=#1E1E1E ctermbg=0 gui=NONE cterm=NONE
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
    autocmd FileType coc-explorer :highlight! link Directory GruvboxBlueBold
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
