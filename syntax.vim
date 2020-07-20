function! ChangeColors()
    "highlight javascriptImport guifg=#fe8019
    "highlight typescriptReserved guifg=#fe8019
endfunction

"peitalin/vim-jsx-typescript
"include .jsx files as typescript.tsx files for syntax highlighting.
autocmd BufNewFile,BufRead *.js,*.jsx call ChangeColors() 

"highlight tsxTag guifg=#fabd2f
"highlight tsxTagName guifg=#fabd2f
"highlight tsxComponentName guifg=#fabd2f
"highlight tsxCloseComponentName guifg=#fabd2f
"
"highlight tsxCloseString guifg=#fabd2f
"highlight tsxCloseTag guifg=#fabd2f
"highlight tsxCloseTagName guifg=#fabd2f
"highlight tsxAttributeBraces guifg=#fabd2f
"highlight tsxEqual guifg=#fabd2f
"
"highlight tsxAttrib guifg=#F8BD7F cterm=italic
