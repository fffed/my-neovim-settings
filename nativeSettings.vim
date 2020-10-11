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
set colorcolumn=120
"highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

"disable linebreaks by max width by ftplugins
set textwidth=0

"horizontal splits will be below
set splitbelow
"vertical splits will be to the right
set splitright
"Diff vertically instead of horizontally
set diffopt+=vertical

"highlighting of the current line
set cursorline

"add scroll offset while scrolling
set scrolloff=6

"shows the absolute number for the current line, and relative numbers for other lines
"set relativenumber

"set languages for spell checking
set spelllang=en_us,ru_yo

"enable relative numbers only in Normal mode, and absolute numbers only in Insert mode
"augroup toggle_relative_number
  "autocmd InsertEnter * :setlocal norelativenumber
  "autocmd InsertLeave * :setlocal relativenumber
"augroup END

"The `path` is where Vim searches for files when executing the various search commands.
"By default `path=.,/usr/include,,.`
"Directories that should be searched are separated by commas
"The first . indicates that Vim should include files relative to the current file’s directory.
"`/usr/include/` typically contains headers so it can be useful if you are doing C and C++ programming.
"The final sequence of `,,` instructs Vim to search in the current working directory.
"by default ** only searches 30 directories deep, see :h starstar for more details. 
set path=.,,,**

"ignore files matching these patterns when opening files based on a glob pattern 
set wildignore+=*/dist*/*,*/**.min.*/,*/node_modules/**/*

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
"when shifting lines, round the indentation to the nearest multiple of 'shiftwidth'
set shiftround
"--</TAB>--

"To ALWAYS use the clipboard for ALL operations (instead of interacting with the '+' and/or '*' registers explicitly)
set clipboard+=unnamedplus

"Maintain undo history between sessions
set undofile

"enable spell only if file type is normal text
let spellable = ['markdown', 'gitcommit', 'txt', 'text']
augroup setSpellCheck
  autocmd!
  autocmd BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif
augroup END

"open help and fugitive in vertical split
augroup verticalHelp
  autocmd!
  autocmd FileType help,fugitive wincmd L
augroup END

"to allow to jump to files with endings .js,ts and .jsx,tsx by `gf`
augroup addSuffix
  autocmd!
  autocmd BufNewFile,BufRead *.js,*.jsx suffixesadd+=.js,.jsx
  autocmd BufNewFile,BufRead *.ts,*.tsx suffixesadd+=.ts,.tsx
augroup END

source $HOME/.config/nvim/statusLine.vim

