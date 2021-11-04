"make "Y" to work from the cursor to the end of line (which is more logical, but not Vi-compatible)
nnoremap Y y$

"turn off Help
nnoremap <F1> <Nop>
inoremap <F1> <Nop>

"turn off default SPACE behavior
nnoremap <Space> <Nop>

"change the default Leader key from \ to SPACE
let mapleader = " "

"don't copy single letter deletes
"nnoremap x "_x   "brake letters swapping

"to move to the first non-blank character
"nnoremap <Leader>h ^
"to move to the last non-blank character
"nnoremap <Leader>l g_

"Toggle vim's spell checking
nnoremap <silent> <Leader>s :<C-u>set spell!<CR>

"Turn off highliting on ESC press
map <ESC> :noh<CR>

"ESC in insert mode
inoremap kj <esc>
"ESC in command mode
"Note: In command mode mappings to ESC run the command for some odd historical vi compatibility reason. We use the alternate method of existing which is Ctrl-C
cnoremap kj <C-C>      

" replace native 'Insert next non-digit literally' with pasting for insert
" mode
inoremap <C-v> <C-r>*

"remap ESC key in terminal mode so we can send an Escape key to the terminal by pressing <C-v><Esc> (mnemonic: Verbatim escape).
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

"Delete selected text to BlackHole register
vnoremap X "_d

"Paste with replace visual selection without copying it
vnoremap <Leader>p "_dP

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

"Insert current path relative to `cwd`
cnoremap <C-h> <C-R>=expand('%:h').'/'<CR>

"##### WINDOW #####
"##################
"Windows navigation
nnoremap <Leader>w <C-W>w
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
" By default <CTRL-L> clears search highlighting :nohlsearch and updates diffs :diffupdate.
nnoremap <Leader><C-L> <Cmd>nohlsearch<Bar>diffupdate<CR><C-L>

"Resize current window
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

"Windows navigation for terminal
tnoremap <Leader>wh <c-\><c-n><c-w>h
tnoremap <Leader>wj <c-\><c-n><c-w>j
tnoremap <Leader>wk <c-\><c-n><c-w>k
tnoremap <Leader>wl <c-\><c-n><c-w>l
"##################

"##### BUFFER #####
"##################
"Move to next buffer
nnoremap <TAB> <Cmd>bnext<CR>
"Move to previous buffer
nnoremap <S-TAB> <Cmd>bprevious<CR>

"close current buffer without closing its window: Close Location windows, if exist, switch to the next view buffer, and then close the last switched buffer.
nnoremap <silent> <leader>q <Cmd>lclose<bar>bnext<bar>bdelete #<CR>

"open previous buffer in vertical split
nnoremap <C-p> <Cmd>vs #<CR>
"##################

"Moving lines up and down https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Undo plugin mappings
"nnoremap <F4> :<C-u>UndotreeToggle<CR>
nnoremap <F4> <Cmd>MundoToggle<CR>
"
"Glow markdown previewer, update before call
nmap <leader>p :<C-u>up \| Glow<CR>

"using cscope
nnoremap <F9> :!find . \! -path './node_modules/*' -iname '*.js' -o -iname '*.jsx' -o -iname '*.ts' -o -iname '*.tsx' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>


"Autoclose: set paste should be "nopaste", to brake mappings press before
"typing the character CTRL-V
" inoremap " ""<Left>
" inoremap ' ''<Left>
" inoremap ( ()<Left>
" inoremap [ []<Left>
" inoremap { {}<Left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap (<CR> (<CR>)<ESC>O

