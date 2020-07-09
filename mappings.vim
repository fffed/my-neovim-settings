"change the default Leader key from \ to SPACE
let mapleader = " "

"turn off default SPACE behavior
nnoremap <Space> <Nop>

"to move to the first non-blank character
nnoremap <Leader>h ^
"to move to the last non-blank character
nnoremap <Leader>l g_

"Toggle vim's spell checking
nnoremap <silent> <Leader>s :set spell!<CR>

"Turn off highliting on ESC press
map <esc> :noh<cr>

"ESC in insert mode
inoremap kj <esc>
"ESC in command mode
"Note: In command mode mappings to ESC run the command for some odd historical vi compatibility reason. We use the alternate method of existing which is Ctrl-C
cnoremap kj <C-C>      

"Delete selected text to BlackHole register
vnoremap X "_d

"Move to next buffer
nnoremap <TAB> :bnext<CR>
"Move to previous buffer
nnoremap <TAB> :bprevious<CR>

"remap ESC key in terminal mode so we can send an Escape key to the terminal by pressing <C-v><Esc> (mnemonic: Verbatim escape).
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

"Windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
if has('nvim')
  tnoremap <C-h> <c-\><c-n><c-w>h
  tnoremap <C-j> <c-\><c-n><c-w>j
  tnoremap <C-k> <c-\><c-n><c-w>k
  tnoremap <C-l> <c-\><c-n><c-w>l
endif

"Moving lines up and down https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"remap ESC key in terminal mode so we can send an Escape key to the terminal by pressing <C-v><Esc> (mnemonic: Verbatim escape).
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif
