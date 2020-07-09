"precede each line with its line
set number
"turn on current file name for window title
set title
"make possible to switch buffers without saving
set hidden
"display long lines as one line
set nowrap
"wrap lines at convenient points, avoid wrapping a line in the middle of a word(only for when wrap is enabled)
"set linebreak
"width for vertical linebreak
"set colorcolumn=120
"highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

"horizontal splits will be below
set splitbelow
"vertical splits will be to the right
set splitright

"highlighting of the current line
set cursorline

"add scroll offset while scrolling
set scrolloff=8

"shows the absolute number for the current line, and relative numbers for other lines
"set relativenumber

"set languages for spell checking
set spelllang=en_us,ru_yo

"enable relative numbers only in Normal mode, and absolute numbers only in Insert mode
"augroup toggle_relative_number
  "autocmd InsertEnter * :setlocal norelativenumber
  "autocmd InsertLeave * :setlocal relativenumber

"--<TAB>--
"number of spaces within Tab, default=8
set tabstop=4 
"replace virtual tab instead of one symbol with 4 space
set softtabstop=4
"when indenting with `>`, use 2 spaces width
set shiftwidth=4
"on pressing `tab`, insert 4 spaces(from 'tabstop')
set expandtab
"turn on smart indenting
set smartindent
"--</TAB>--

"To ALWAYS use the clipboard for ALL operations (instead of interacting with the '+' and/or '*' registers explicitly)
set clipboard+=unnamedplus

"Maintain undo history between sessions
set undofile

"Explorer with tree like style
let g:netrw_liststyle = 3
"Explorer stays in his window, file is opened within new one
"let g:netrw_browse_split = 4
