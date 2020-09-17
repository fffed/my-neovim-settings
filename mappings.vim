"change the default Leader key from \ to SPACE
let mapleader = " "

"turn off default SPACE behavior
nnoremap <Space> <Nop>

"make "Y" to work from the cursor to the end of line (which is more logical, but not Vi-compatible)
nnoremap Y y$

"don't copy single letter deletes
"nnoremap x "_x   "brake letters swapping

"to move to the first non-blank character
"nnoremap <Leader>h ^
"to move to the last non-blank character
"nnoremap <Leader>l g_

"close current buffer without closing its window: Close Location windows, if exist, switch to the previous view buffer, and then close the last switched buffer.
nnoremap <silent> <leader>q :lclose<bar>b#<bar>bd #<CR>

"Toggle vim's spell checking
nnoremap <silent> <Leader>s :<C-u>set spell!<CR>

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
nnoremap <TAB> :<C-u>bnext<CR>
"Move to previous buffer
nnoremap <S-TAB> :<C-u>bprevious<CR>

"remap ESC key in terminal mode so we can send an Escape key to the terminal by pressing <C-v><Esc> (mnemonic: Verbatim escape).
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

"Windows navigation
nnoremap <Leader>w <C-w>w
"nnoremap <Leader>wh <C-w>h
"nnoremap <Leader>wj <C-w>j
"nnoremap <Leader>wk <C-w>k
"nnoremap <Leader>wl <C-w>l
if has('nvim')
  tnoremap <Leader>wh <c-\><c-n><c-w>h
  tnoremap <Leader>wj <c-\><c-n><c-w>j
  tnoremap <Leader>wk <c-\><c-n><c-w>k
  tnoremap <Leader>wl <c-\><c-n><c-w>l
endif

"Moving lines up and down https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Undo plugin mappings
nnoremap <F4> :<C-u>UndotreeToggle<CR>

"using cscope
nnoremap <F9> :!find . \! -path './node_modules/*' -iname '*.js' -o -iname '*.jsx' -o -iname '*.ts' -o -iname '*.tsx' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>

