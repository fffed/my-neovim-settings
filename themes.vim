set termguicolors
" set background=light

" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark='hard'
" let g:monotone_color = [10, 5, 60]
" let g:monotone_contrast_factor = -0.8
" ./colors/my-paper.vim
colorscheme my-monotone

" colorscheme mono
" packadd! colorbuddy.vim
" lua require('colorbuddy').colorscheme('mono')
"
" let g:falcon_lightline = 1
" let g:lightline.colorscheme = 'falcon'
"colorscheme falcon
"set background=light
"colorscheme solarized8

"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"colorscheme OceanicNext

"cursor styling for Terminal mode
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

let g:undotree_WindowLayout=2

source $HOME/.config/nvim/syntax.vim
