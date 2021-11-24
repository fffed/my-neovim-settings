"Ctags
"let g:gutentags_add_default_project_roots=0
" let g:gutentags_project_root=['package.json', '.git']
" let g:gutentags_cache_dir = expand('~/.cache/nvim/ctags/')
""To clear cache
" command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
""Make Gutentags generate in most cases
" let g:gutentags_generate_on_new = 1
" let g:gutentags_generate_on_missing = 1
" let g:gutentags_generate_on_write = 1
" let g:gutentags_generate_on_empty_buffer = 0


"use rg by default if Ripgrep(rg) installed on a system level 
"if executable('rg')
"  "filter out files that are marked ignore in Git. When used in a Git repository, this command does include files that have yet to be added to the Git index. When used outside of a version control repository, it falls back to listing all files.
"  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"  set grepprg=rg\ --vimgrep
"endif

"top to bottom
" let $FZF_DEFAULT_OPTS="--reverse "

"turn on preview window
"command! -bang -nargs=? -complete=dir Files
"    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

""RG as ripgrep(Rg) command with preview window
"function! RipgrepFzf(query, fullscreen)
"  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
"  let initial_command = printf(command_fmt, shellescape(a:query))
"  let reload_command = printf(command_fmt, '{q}')
"  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
"endfunction

"command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

"" Customize fzf colors to match your color scheme if it has not build in support
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'WarningMsg'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Number'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'border':  ['fg', 'Ignore'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }


"floating fzf window with borders
"let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
"
"function! CreateCenteredFloatingWindow()
"    let width = min([&columns - 4, max([80, &columns - 20])])
"    let height = min([&lines - 4, max([20, &lines - 10])])
"    let top = ((&lines - height) / 2) - 1
"    let left = (&columns - width) / 2
"    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
"
"    let top = "╭" . repeat("─", width - 2) . "╮"
"    let mid = "│" . repeat(" ", width - 2) . "│"
"    let bot = "╰" . repeat("─", width - 2) . "╯"
"    let lines = [top] + repeat([mid], height - 2) + [bot]
"    let s:buf = nvim_create_buf(v:false, v:true)
"    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
"    call nvim_open_win(s:buf, v:true, opts)
"    set winhl=Normal:Floating
"    let opts.row += 1
"    let opts.height -= 2
"    let opts.col += 2
"    let opts.width -= 4
"    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
"    au BufWipeout <buffer> exe 'bw '.s:buf
"endfunction

"opens the fzf picker interface for Search
"nnoremap <Leader>f :<C-u>Files<CR>
"nnoremap <Leader>b :<C-u>Buffers<CR>
"nnoremap <Leader>/ :<C-u>RG<CR>
"nnoremap <Leader>? :<C-u>History<CR>
""Git files (git status)
"nnoremap <Leader>g :<C-u>:GFiles?<CR>
""Git commits (requires fugitive.vim)
"nnoremap <Leader>G :<C-u>:Commits<CR>

"While the built-in :grep command runs synchronously, the Grepper plugin makes it possible to run grep asynchronously
"let g:grepper = {}
"let g:grepper.tools = ['rg', 'git', 'grep']

"In Command-Line mode, when type grep followed by <Space>, it will be expanded to GrepperGrep.
"function! SetupCommandAlias(input, output)
"  exec 'cabbrev <expr> '.a:input
"        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
"        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
"endfunction
"call SetupCommandAlias("grep", "GrepperGrep")

"Open Grepper-prompt for a particular grep-alike tool
"nnoremap <Leader>G :Grepper -tool git<CR>
"nnoremap <Leader>g :Grepper -tool rg<CR>
""Search for the current word
"nnoremap <Leader>* :Grepper -cword -noprompt<CR>
""Search for the current selection
"nmap gs <plug>(GrepperOperator)
"xmap gs <plug>(GrepperOperator)

"let g:codequery_find_text_cmd = 'GrepperGrep'



"----------TELESCOPE
lua << EOF
-- require('telescope').load_extension('fzf')
-- This will load fzy_native and have it override the default file sorter
require('telescope').load_extension('fzy_native')
require('telescope').setup{
    defaults = {
        sorting_strategy = "ascending",
        set_env = { ['COLORTERM'] = 'truecolor' },
        layout_strategy = "flex",
        layout_config = {
            prompt_position = "top",
            vertical = {
                mirror = true,
            },
        },
        mappings = {
            n = {
                ['<Del>'] = require('telescope.actions').delete_buffer,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
EOF

function! RipgrepByType(type)
    execute "lua require('telescope.builtin').live_grep({ vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--type=".a:type."' }})"
endfunction

command! -nargs=* RipgrepByType call RipgrepByType( <f-args> )

" some of available parameters
"   prompt_title = "~ dotfiles ~",
"   shorten_path = false,
"   cwd = "~/.config/nvim",

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ find_command = {'fd', '--hidden', '--type', 'f'} })<cr>
nnoremap <leader>fu <cmd>lua require('telescope.builtin').find_files({ find_command = {'fd', '--hidden', '--type', 'f'}, cwd = vim.fn.expand('%:p:h') })<cr>
"to ignore file name while live_greping
":lua require'telescope.builtin'.live_grep{}
nnoremap <leader>f/ <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>f? <cmd>lua require('telescope.builtin').live_grep({ grep_open_files = true })<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').live_grep({ only_sort_text = true })<cr>
nnoremap <leader>fu <cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('%:p:h') })<cr>
" nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
"find exact match of a word under the cursor
nnoremap <leader>fw <cmd>lua require('telescope.builtin').grep_string({ word_match = '-w' })<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').resume()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fy <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap <leader>fgf <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fgs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>fgc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>fgb <cmd>lua require('telescope.builtin').git_branches()<cr>
"file explorer
nnoremap <leader>fe <cmd>lua require('telescope.builtin').file_browser()<cr>
"pluggin for clipboard
nnoremap <Leader>y :lua require('telescope').extensions.neoclip.default()<cr>
