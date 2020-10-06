"as we already show it in status line
set noshowmode

set statusline=
"left hand side
set statusline+=%1*\%h                       "help file?
set statusline+=\ %r                         "readonly?
set statusline+=\ %<%f                       "add User color group; add path to file; '<' means truncate direction
set statusline+=\ %{FugitiveStatusline()}
set statusline+=\ %{ObsessionStatus()}
set statusline+=%2*%m                        "modified flag
set statusline+=%1*                          
"right hand side
set statusline+=%="
set statusline+=%1*\ %l:%03c/%L\ (%02p%%)\  "Rownumber:Columnnr/total (%)
 
	  " :set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
highlight! link User1 Statusline
highlight! link User2 DiffChange
" hi User2 guifg=#000000  guibg=#F4905C
"let g:lightline = {
"      \ 'colorscheme': 'gruvbox',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified', 'obsession'] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'FugitiveHead',
"      \   'cocstatus': 'coc#status',
"      \   'obsession': 'ObsessionStatus'
"      \ },
"      \ }
