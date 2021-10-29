let g:python3_host_prog = expand("/usr/bin/python3") 

source $HOME/.config/nvim/options.vim
source $HOME/.config/nvim/fileExplorer.vim
source $HOME/.config/nvim/utils.vim

" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" ./lua/plugins.lua 
lua require('plugins')
" ./lua/configs.lua
lua require('configs') 

" lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
" lua <<EOF
"     vim.cmd('packadd nvim-lspconfig')
"     require'lspconfig'.tsserver.setup{}
" EOF

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"     -- Modules and its options go here
"     highlight = { enable = true },
"     incremental_selection = { enable = true },
"   }
" EOF
" source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/search.vim
source $HOME/.config/nvim/coc-plugin.vim
source $HOME/.config/nvim/themes.vim
source $HOME/.config/nvim/headers.vim
source $HOME/.config/nvim/translator.vim

iabbr af () => {};

"grammar
let g:languagetool_jar='$HOME/LanguageTool-5.2/languagetool-commandline.jar'
"This will create an autocmd for FileType * to highlight every filetype for nvim-colorizer.lua
au! VimEnter * lua require 'colorizer'.setup()

let g:markdown_fenced_languages = ['html', 'javascript', 'js=javascript', 'json=javascript', 'jsx=javascriptreact', 'vim', 'bash', 'sh=bash']
