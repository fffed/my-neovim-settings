vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  --visualizes undo history and makes it easier to browse and switch between different undo branches
  use {'simnalamburt/vim-mundo', cmd = {'MundoToggle'}}
  -- use {'mbbill/undotree', cmd = {'UndotreeToggle'}}

  --provides mappings to easily delete, change and add surroundings in pairs
  --e.g. cs"' change surround " with '
  use 'tpope/vim-surround'
  --Use `gcc` to comment out a line (takes a count),
  --`gc` to comment out the target of a motion (for example, `gcap` to comment out a paragraph),
  --`gc` in visual mode to comment out the selection
  use 'tpope/vim-commentary'
  --use 'b3nj5m1n/kommentary'

  --GIT--
  use 'TimUntersberger/neogit'

  -- use 'airblade/vim-gitgutter'
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
      'tpope/vim-fugitive'--,
      -- opt = true,
      -- cmd = {'G', 'Git', 'GMove', 'Grename', 'Gcommit', 'Gpull', 'Gwrite'}
  }
  use {
      'christoomey/vim-conflicted'--,
      -- opt = true,
      -- cmd = {'Conflicted', 'GitNextConflict'}
  }

  use {
      'junegunn/fzf.vim',
      requires = {'junegunn/fzf', run = './install --all && ln -s $(pwd) ~/.fzf'},
      cmd = { 'Files', 'Buffers', 'RG', 'History', 'GFiles', 'Commits' }
  }

  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, { 'nvim-telescope/telescope-fzy-native.nvim' }}
  }

  use{
      'kyazdani42/nvim-tree.lua',
       requires = {'kyazdani42/nvim-web-devicons'},
       cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
   }

  use {'neoclide/coc.nvim', branch = 'release'}

  --view the latest version of the packages you depend on 
  use {'meain/vim-package-info', ft = { 'json', 'jsonc' }, run = { 'npm install', ':UpdateRemotePlugins'}}

  --colors preview
  use {
      'norcalli/nvim-colorizer.lua',
      config = function() require('colorizer').setup() end
  }

  --Use treesitter to autoclose and autorename html tag
  use {
      'windwp/nvim-ts-autotag',
       -- requires = {'nvim-treesitter/nvim-treesitter'}
      -- ft = { 'html', 'javascriptreact', 'typescriptreact' },
      -- config = function() require('nvim-ts-autotag').setup() end
  }

  use {
      'JoosepAlviste/nvim-ts-context-commentstring',
       -- requires = {'nvim-treesitter/nvim-treesitter'}
      -- ft = { 'javascriptreact', 'typescriptreact' },
      -- config = function() require('nvim-ts-context-commentstring').setup() end
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
      'nvim-treesitter/playground',
      opt = true,
      cmd = {'TSPlaygroundToggle'}
  }
  -- use {'othree/yajs.vim'}--, ft = {'javascript', 'javascriptreact'}}
  -- use {'maxmellon/vim-jsx-pretty'}--, ft = {'javascriptreact', 'typescriptreact'}}
  --Looks like yats do not need anymore
  -- use {'herringtondarkholme/yats.vim', ft = {'typescriptreact'}}

  --LSP--
  -- use {
  --     'neovim/nvim-lspconfig',
  --     -- requires = {{ 'nvim-lua/completion-nvim' }},
  --     -- config = "vim.cmd [[lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }]]"
  --     }

  use 'alpertuna/vim-header'
  use 'antoyo/vim-licenses'

  --md preview (depends on glow)
  use {'npxbr/glow.nvim', opt = true,  ft = { 'markdown' } }

  use {'voldikss/vim-translator',
        cmd = { 'TranslateW', 'TranslateW', 'TranslateH', 'TranslateL' }
    }

  use {'dpelle/vim-LanguageTool', opt = true, cmd = {'LanguageToolCheck'}}

  --COLOR SCHEMES--
  --LUA
  use {'npxbr/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
  use {'kyazdani42/blue-moon'}
  use {'tanvirtin/nvim-monokai'}

  -- use {'gruvbox-community/gruvbox', opt = true}
  use {'wbthomason/vim-nazgul', opt = true}
  use {'arzg/vim-substrata', opt = true}
  use {'fenetikm/falcon', opt = true}
  use {'Lokaltog/vim-monotone', opt = true}
  use {'cocopon/iceberg.vim', opt = true}
  use {'reewr/vim-monokai-phoenix', opt = true}
  use {'NieTiger/halcyon-neovim', opt = true}
  use {'rakr/vim-one', opt = true}
  use {'YorickPeterse/vim-paper', opt = true}
  use {'sjl/badwolf', opt = true}
  -- use {'mhartington/oceanic-next', opt = true}
  use {'sainnhe/gruvbox-material', opt = true}
  -- use {'sainnhe/forest-night', opt = true}
  -- use {'sainnhe/sonokai', opt = true}
  -- use {'sainnhe/edge', opt = true}

  --STATUS LINE--
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  use {'alec-gibson/nvim-tetris', opt = true, cmd = {'Tetris'}}
end)
