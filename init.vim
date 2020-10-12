"add python3 for checkhealth
let g:python3_host_prog = expand("/usr/bin/python3") 

    source $HOME/.config/nvim/options.vim
	"TODO: move to https://github.com/wbthomason/packer.nvim for plugins managing
    source $HOME/.config/nvim/fileExplorer.vim
    source $HOME/.config/nvim/utils.vim
    source $HOME/.config/nvim/plugins.vim
    source $HOME/.config/nvim/mappings.vim
    source $HOME/.config/nvim/search.vim
    source $HOME/.config/nvim/coc-plugin.vim
    source $HOME/.config/nvim/themes.vim

"This will create an autocmd for FileType * to highlight every filetype for nvim-colorizer.lua
lua require 'colorizer'.setup()

