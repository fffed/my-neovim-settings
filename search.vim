"command-line fuzzy finder, fzf should be installed on a system level
call minpac#add('junegunn/fzf')
"provides fuzzy matchers for a variety of sources, including the buffer list, command history, search history, helptags, and many more.
call minpac#add('junegunn/fzf.vim')
"filter out files that are marked ignore in Git. When used in a Git repository, this command does include files that have yet to be added to the Git index. When used outside of a version control repository, it falls back to listing all files. Ripgrep(rg) should be installed on a system level 
let $FZF_DEFAULT_COMMAND = 'rg --files'

"opens the fzf picker interface for Search
nnoremap <Leader>f :<C-u>FZF<CR>

"While the built-in :grep command runs synchronously, the Grepper plugin makes it possible to run grep asynchronously
call minpac#add('mhinz/vim-grepper')
let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'grep']

"In Command-Line mode, when type grep followed by <Space>, it will be expanded to GrepperGrep.
function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperGrep")

"Open Grepper-prompt for a particular grep-alike tool
nnoremap <Leader>G :Grepper -tool git<CR>
nnoremap <Leader>g :Grepper -tool rg<CR>
"Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
"Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
