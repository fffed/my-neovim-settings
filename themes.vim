set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox

"cursor styling for Terminal mode
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

let g:undotree_WindowLayout=2

