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
  "call packager#add('mhartington/oceanic-next')
  "call packager#add('kaicataldo/material.vim')
  "call packager#add('blueshirts/darcula')
  "call packager#add('doums/darcula')
  "call packager#add('ghifarit53/tokyonight-vim')
  

  "COC
  call packager#add('neoclide/coc.nvim', {'branch': 'release'})
  
  "-----SYNTAX
  "call packager#add('yuezk/vim-js')
  call packager#add('othree/yajs.vim')
  call packager#add('maxmellon/vim-jsx-pretty')
  "let g:vim_jsx_pretty_template_tags = []
  "let g:vim_jsx_pretty_disable_tsx = 1
  call packager#add('herringtondarkholme/yats.vim')
  
  "call packager#add('pangloss/vim-javascript')
  "call packager#add('leafgarland/typescript-vim')
  "call packager#add('peitalin/vim-jsx-typescript')
  "include .jsx files as typescript.tsx files for syntax highlighting.
  "autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
  
  call packager#add('styled-components/vim-styled-components')
  "call packager#add('sheerun/vim-polyglot')
  "call packager#add('hail2u/vim-css3-syntax')
  "call packager#add('groenewege/vim-less')
  
  "colors preview
  call packager#add('ap/vim-css-color')
  "view the latest version of the packages you depend on 
  "call packager#add('meain/vim-package-info')

  "Loaded only for specific filetypes on demand. Requires autocommands below.
"  call packager#add('kristijanhusak/vim-js-file-import', { 'do': 'npm install', 'type': 'opt' })
"  call packager#add('fatih/vim-go', { 'do': ':GoInstallBinaries', 'type': 'opt' })
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
"augroup packager_filetype
"  autocmd!
"  autocmd FileType javascript, javascriptreact, typescript, typescriptreact packadd vim-styled-components
"augroup END
