"Ctags
let g:gutentags_add_default_project_roots=0
let g:gutentags_project_root=['package.json', '.git']
let g:gutentags_cache_dir = expand('~/.cache/nvim/ctags/')
"To clear cache
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
"Make Gutentags generate in most cases
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0


"filter out files that are marked ignore in Git. When used in a Git repository, this command does include files that have yet to be added to the Git index. When used outside of a version control repository, it falls back to listing all files. Ripgrep(rg) should be installed on a system level 
let $FZF_DEFAULT_COMMAND = 'rg --files'
"turn on preview window
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

"RG as ripgrep(Rg) command with preview window
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"opens the fzf picker interface for Search
nnoremap <Leader>f :<C-u>Files<CR>

"While the built-in :grep command runs synchronously, the Grepper plugin makes it possible to run grep asynchronously
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

"let g:codequery_find_text_cmd = 'GrepperGrep'
