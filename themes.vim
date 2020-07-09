set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

"cursor styling for Terminal mode
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

