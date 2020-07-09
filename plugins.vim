"Package manager 'minpack' initialization
"Add custom comands
command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists('*minpac#init')
  finish
endif

call minpac#init()
"add minpac so it could autoupdate itself
call minpac#add('k-takata/minpac', {'type': 'opt'})


"Asynchronous build and test dispatcher
call minpac#add('tpope/vim-dispatch')
"makes Dispatch run programs using Neovim’s terminal emulator
call minpac#add('radenling/vim-dispatch-neovim')

"visualizes undo history and makes it easier to browse and switch between different undo branches
call minpac#add('mbbill/undotree')

"provides mappings to easily delete, change and add surroundings in pairs
"e.g. cs"' change surround " with '
call minpac#add('tpope/vim-surround')
"Use `gcc` to comment out a line (takes a count),
"`gc` to comment out the target of a motion (for example, `gcap` to comment out a paragraph),
"`gc` in visual mode to comment out the selection
call minpac#add('tpope/vim-commentary')
"git
call minpac#add('tpope/vim-fugitive')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('junegunn/gv.vim')
call minpac#add('lambdalisue/gina.vim')

"Sessions saving
call minpac#add('tpope/vim-obsession')

"Text sorting
"gsip => Sort the current paragraph
"gsi( => Sort within parenthesis. (b, c, a) would become (a, b, c)
call minpac#add('christoomey/vim-sort-motion')

"for Abbrivations, Substitutions and Coercion
"camelCase (crc), snake_case (crs), UPPER_CASE (crucamelCase (crc), snake_case (crs), UPPER_CASE (cru))
call minpac#add('tpope/vim-abolish')

"-----SEARCH
"command-line fuzzy finder, fzf should be installed on a system level
call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
"provides fuzzy matchers for a variety of sources, including the buffer list, command history, search history, helptags, and many more.
call minpac#add('junegunn/fzf.vim')
"While the built-in :grep command runs synchronously, the Grepper plugin makes it possible to run grep asynchronously
call minpac#add('mhinz/vim-grepper')

"Status line
call minpac#add('itchyny/lightline.vim')

"Themes
call minpac#add('gruvbox-community/gruvbox')
"call minpac#add('mhartington/oceanic-next')
""call minpac#add('kaicataldo/material.vim')
"call minpac#add('blueshirts/darcula')


"COC
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

"-----SYNTAX
call minpac#add('yuezk/vim-js')
call minpac#add('maxmellon/vim-jsx-pretty')
"let g:vim_jsx_pretty_template_tags = []
"let g:vim_jsx_pretty_disable_tsx = 1
call minpac#add('herringtondarkholme/yats.vim')

"call minpac#add('leafgarland/typescript-vim')
"call minpac#add('peitalin/vim-jsx-typescript')
"include .jsx files as typescript.tsx files for syntax highlighting.
"autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

call minpac#add('styled-components/vim-styled-components')

"call minpac#add('sheerun/vim-polyglot')
"call minpac#add('pangloss/vim-javascript')
"call minpac#add('hail2u/vim-css3-syntax')
"call minpac#add('groenewege/vim-less')

