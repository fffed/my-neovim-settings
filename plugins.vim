"Package manager 'packager' initialization
"Load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()

  "add minpac so it could autoupdate itself
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  "Asynchronous build and test dispatcher
  call packager#add('tpope/vim-dispatch')
  "makes Dispatch run programs using Neovim’s terminal emulator
  call packager#add('radenling/vim-dispatch-neovim')
  
  "visualizes undo history and makes it easier to browse and switch between different undo branches
  call packager#add('mbbill/undotree')
  
  "provides mappings to easily delete, change and add surroundings in pairs
  "e.g. cs"' change surround " with '
  call packager#add('tpope/vim-surround')
  "Use `gcc` to comment out a line (takes a count),
  "`gc` to comment out the target of a motion (for example, `gcap` to comment out a paragraph),
  "`gc` in visual mode to comment out the selection
  call packager#add('tpope/vim-commentary')

  "git
  call packager#add('tpope/vim-fugitive')
  call packager#add('airblade/vim-gitgutter')
  call packager#add('junegunn/gv.vim')
  call packager#add('christoomey/vim-conflicted')
  "call packager#add('lambdalisue/gina.vim')
  
  "Sessions saving
  call packager#add('tpope/vim-obsession')
  
  "Text sorting
  ":PackagerInstalcall packager#add('christoomey/vim-sort-motion')
  "gsip => Sort the current paragraph
  "gsi( => Sort within parenthesis. (b, c, a) would become (a, b, c)
  
  "for Abbrivations, Substitutions and Coercion
  "camelCase (crc), snake_case (crs), UPPER_CASE (crucamelCase (crc), snake_case (crs), UPPER_CASE (cru))
  call packager#add('tpope/vim-abolish')
  
  "-----SEARCH
  "ctags
  call packager#add('ludovicchabant/vim-gutentags')
  
  "command-line fuzzy finder, fzf should be installed on a system level
  call packager#add('junegunn/fzf', { 'do': './install --all && ln -s $(pwd) ~/.fzf'})
  "provides fuzzy matchers for a variety of sources, including the buffer list, command history, search history, helptags, and many more.
  call packager#add('junegunn/fzf.vim')
  "While the built-in :grep command runs synchronously, the Grepper plugin makes it possible to run grep asynchronously
  call packager#add('mhinz/vim-grepper')
  
  "search source code by codequery(replace of ctaqs and cscope)
  "call packager#add('Shougo/unite.vim')
  "call packager#add('devjoe/vim-codequery')
  
  
  "Status line
  call packager#add('itchyny/lightline.vim')
  
  "Themes
  call packager#add('gruvbox-community/gruvbox')
  call packager#add('lifepillar/vim-solarized8', { 'type': 'opt' })
  "call packager#add('mhartington/oceanic-next', { 'type': 'opt' }) "no JSX
  "call packager#add('ghifarit53/tokyonight-vim', {'type': 'opt' })
  "call packager#add('sainnhe/gruvbox-material')
  "call packager#add('kaicataldo/material.vim')
  "call packager#add('blueshirts/darcula')
  "call packager#add('doums/darcula')
  "call packager#add('rakr/vim-one', { 'type': 'opt' })


  "COC
  call packager#add('neoclide/coc.nvim', {'branch': 'release'})
  
  "colors preview
  call packager#add('ap/vim-css-color')

  "LOADED ONLY FOR SPECIFIC FILETYPES ON DEMAND. REQUIRES AUTOCOMMANDS BELOW!!!
   "view the latest version of the packages you depend on 
   call packager#add('meain/vim-package-info', { 'do': 'npm install', 'type': 'opt' })
  
  "-----SYNTAX
  "call packager#add('yuezk/vim-js', { 'type': 'opt' })
  "call packager#add('othree/yajs.vim', { 'type': 'opt' })
  call packager#add('maxmellon/vim-jsx-pretty', { 'type': 'opt' })
  "let g:vim_jsx_pretty_template_tags = []
  "let g:vim_jsx_pretty_disable_tsx = 1
  "only for tsx/jsx files and better highlighting as it's already included in neovim
  call packager#add('herringtondarkholme/yats.vim', { 'type': 'opt' })
  
  "call packager#add('pangloss/vim-javascript')
  "call packager#add('leafgarland/typescript-vim', { 'type': 'opt' })
  "call packager#add('peitalin/vim-jsx-typescript')
  "include .jsx files as typescript.tsx files for syntax highlighting.
  "autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
  
  "call packager#add('styled-components/vim-styled-components')
  "call packager#add('sheerun/vim-polyglot')
  "call packager#add('hail2u/vim-css3-syntax')
  "call packager#add('groenewege/vim-less')

"  call packager#add('kristijanhusak/vim-js-file-import', { 'do': 'npm install', 'type': 'opt' })
"  call packager#add('neoclide/coc.nvim', { 'do': function('InstallCoc') })
"  call packager#add('sonph/onehalf', {'rtp': 'vim/'})
endfunction

"Add custom comands
command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

"Load plugins only for specific filetype
"Note that this should not be done for plugins that handle their loading using ftplugin file.
"More info in :help pack-add
augroup packager_filetype
  autocmd!
  autocmd BufNewFile,BufRead *.js set filetype=typescript
  autocmd BufNewFile,BufRead *.jsx set filetype=typescriptreact
  " autocmd FileType javascript,javascriptreact packadd yajs.vim
  autocmd FileType javascriptreact,typescriptreact packadd vim-jsx-pretty
  autocmd FileType typescriptreact packadd yats.vim
  autocmd FileType json packadd vim-package-info
augroup END
