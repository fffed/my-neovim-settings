function! MyHighlights() abort
"   highlight! link cssPositioningProp GruvboxAqua
"   highlight! link cssMediaProp GruvboxAqua
"   highlight! link cssBorderProp GruvboxAqua
    " highlight! link javascriptReserved GruvboxRed
    " highlight! link javascriptDebugger GruvboxRedBold
    " highlight! link typescriptDebugger GruvboxRedBold
    " highlight! link javascriptString GruvboxFg3
    " highlight! link javascriptDomEventTargetMethod GruvboxAqua
    " highlight! link javascriptObjectStaticMethod GruvboxAqua
    " highlight! link javascriptPaymentShippingOptionProp GruvboxYellow
    " highlight! link javascriptES6SetMethod GruvboxYellow
    "make ts and js history the same
    " highlight! link javascriptImport GruvboxOrange
    " highlight! link javascriptExport GruvboxOrange
    " highlight! link javascriptVariable GruvboxBlue
    " highlight! link typescriptString GruvboxFg3
"   highlight! link styledNestedRegion GruvboxAqua

"   Tree-sitter
    " highlight! link TSBoolean GruvboxFg3
    " highlight! link TSConditional GruvboxFg3
    " highlight! link TSConstructor GruvboxFg3
    " highlight! link TSFunction GruvboxFg3
    " highlight! link TSInclude GruvboxFg3
    " highlight! link TSKeyword GruvboxFg3
    " highlight! link TSKeywordOperator GruvboxFg3
    " highlight! link TSMethod GruvboxFg3
    " highlight! link TSNumber GruvboxFg3
    " highlight! link TSOperator GruvboxFg3
    " highlight! link TSParameter GruvboxFg3
    " highlight! link TSProperty GruvboxFg3
    " highlight! link TSPunctBracket GruvboxFg3
    " highlight! link TSPunctDelimiter GruvboxFg3
    " highlight! link TSPunctSpecial GruvboxFg3
    " highlight! link TSString GruvboxFg3
    " highlight! link TSTag GruvboxFg3
    " highlight! link TSTagDelimiter GruvboxFg3
    " highlight! link TSType GruvboxFg3
    " highlight! link TSTypeBuiltin GruvboxFg3
    " highlight! link TSVariable GruvboxFg3
    " highlight! link TSVariableBuiltin GruvboxFg3

"   change background
    " hi clear Normal
    highlight Normal guifg=GruvboxFg1 ctermfg=249 guibg=#1E1E1E ctermbg=0 gui=NONE cterm=NONE
endfunction

function! TreeSitterHighlight() abort
    " highlight! TSBoolean guifg=blue
    " highlight! TSConditional GruvboxFg3
    " highlight! TSConstructor GruvboxFg3
    " highlight! TSFunction GruvboxFg3
    " highlight! TSInclude GruvboxFg3
    highlight! TSKeyword guifg=#46BBF5
    " highlight! TSKeywordOperator GruvboxFg3
    " highlight! TSMethod GruvboxFg3
    " highlight! TSNumber GruvboxFg3
    " highlight! TSOperator GruvboxFg3
    " highlight! TSParameter GruvboxFg3
    " highlight! TSProperty GruvboxFg3
    " highlight! TSPunctBracket GruvboxFg3
    " highlight! TSPunctDelimiter GruvboxFg3
    " highlight! TSPunctSpecial GruvboxFg3
    " highlight! TSString GruvboxFg3
    " highlight! TSTag guifg=#9C9695
    " highlight! TSTagDelimiter GruvboxFg3
    " highlight! TSType GruvboxFg3
    " highlight! TSTypeBuiltin GruvboxFg3
    " highlight! TSVariable guifg=#9C9695
    " highlight! TSVariableBuiltin guifg=red
endfunction

function! TreeSitterHighlightGruvbox() abort
    highlight! TSString guifg=#b8bb26

    highlight! TSFunction guifg=#ebdbb2

    highlight! TSParameter guifg=#8ec07c
    highlight! TSConditional guifg=#8ec07c

    highlight! TSVariable guifg=#fbf1c7
    highlight! TSConstructor guifg=#fbf1c7
    highlight! TSPunctBracket guifg=#fbf1c7
    highlight! TSPunctDelimiter guifg=#fbf1c7

    highlight! TSReturn guifg=#fb4934 
    highlight! TSArrow guifg=#fb4934
    highlight! TSDebugger guifg=#fb4934 gui=bold
    highlight! TSVariableBuiltin guifg=#fb4934 

    highlight! TSInclude guifg=#fe8019
    highlight! TSExport guifg=#fe8019

    highlight! TSKeyword guifg=#fe8019

    highlight! TSJsxProp guifg=#fabd2f
    highlight! TSJsxElement guifg=#b8bb26
    highlight! TSTag guifg=#8ec07c
    highlight! TSTagDelimiter guifg=#a89984
endfunction

function! TreeSitterHighlightMonokai() abort
    highlight! TSInclude guifg=#F92672 gui=none
    highlight! TSExport guifg=#F92672 gui=none
    highlight! TSKeyword guifg=#66d9ef gui=italic
    highlight! TSParameter guifg=#FD971F gui=italic
    highlight! TSArrow guifg=#66d9ef gui=italic
    highlight! TSProperty guifg=#E6DB74
    highlight! TSPunctBracket guifg=#FFFFFF
    highlight! TSPunctDelimiter guifg=#FFFFFF
    highlight! TSDot guifg=#F92672
    highlight! TSConstructor guifg=#66d9ef
    highlight! TSReturn guifg=#F92672
    highlight! TSVariable guifg=#FFFFFF
    highlight! TSTagDelimiter guifg=#FFFFFF
    highlight! TSJsxElement guifg=#66d9ef gui=italic
    highlight! TSJsxProp guifg=#A6E22E
    " highlight! TSType guifg=#66d9ef gui=italic
endfunction

augroup MyColors
    autocmd!
    " autocmd ColorScheme * call MyHighlights()
    " autocmd FileType typescript,javascript,javascriptreact,typescriptreact call TreeSitterHighlightGruvbox()
    " autocmd FileType coc-explorer :highlight! link Directory GruvboxBlueBold
    " autocmd FileType LuaTree :highlight! link Directory GruvboxBlueBold
    " autocmd ColorScheme * highlight! Normal guibg=#1E1E1E
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
