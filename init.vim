"Explorer with tree like style
let g:netrw_liststyle = 3
"Explorer stays in his window, file is opend within new one
"let g:netrw_browse_split = 4

"add python3 for checkhealth
let g:python3_host_prog = expand("/usr/bin/python3") 

source $HOME/.config/nvim/pluginManager.vim
source $HOME/.config/nvim/nativeSettings.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/search.vim
source $HOME/.config/nvim/coc-plugin.vim
source $HOME/.config/nvim/themes.vim

"Asynchronous build and test dispatcher
call minpac#add('tpope/vim-dispatch')
"makes Dispatch run programs using Neovim’s terminal emulator
call minpac#add('radenling/vim-dispatch-neovim')

"Syntax
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('yuezk/vim-js')

"visualizes undo history and makes it easier to browse and switch between different undo branches
call minpac#add('mbbill/undotree')

"provides mappings to easily delete, change and add surroundings in pairs
"e.g. cs"' change surround " with '
call minpac#add('tpope/vim-surround')
"Use `gcc` to comment out a line (takes a count),
"`gc` to comment out the target of a motion (for example, `gcap` to comment out a paragraph),
"`gc` in visual mode to comment out the selection
call minpac#add('tpope/vim-commentary')

"Lint
"call minpac#add('dense-analysis/ale')
"For JavaScript files, use `eslint` (and only eslint)
"let g:ale_linters = {
"\   'javascript': ['eslint'],
"\   'typescript': ['eslint'],
"\}
"Lint mappings mnemonic: “w” is for warning 
"nmap <silent> [W <Plug>(ale_first)
"nmap <silent> [w <Plug>(ale_previous)
"nmap <silent> ]w <Plug>(ale_next)
"nmap <silent> ]W <Plug>(ale_last)

"call minpac#add('sheerun/vim-polyglot')
"call minpac#add('pangloss/vim-javascript')
"call minpac#add('hail2u/vim-css3-syntax')
"call minpac#add('styled-components/vim-styled-components')
"call minpac#add('groenewege/vim-less')

