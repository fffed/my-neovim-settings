vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- use 'antonk52/bad-practices.nvim'

  --to reload entire Neovim config completely
  -- use {'famiu/nvim-reload',
  --   cmd = { 'Reload', 'Restart' },
  --   requires = { 'nvim-lua/plenary.nvim' }
  -- }

  --visualizes undo history and makes it easier to browse and switch between different undo branches
  use {'simnalamburt/vim-mundo', cmd = {'MundoToggle'}}
  -- use {'mbbill/undotree', cmd = {'UndotreeToggle'}}

  --provides mappings to easily delete, change and add surroundings in pairs
  --e.g. cs"' change surround " with '
  use 'tpope/vim-surround'
  --Use `gcc` to comment out a line (takes a count),
  --`gc` to comment out the target of a motion (for example, `gcap` to comment out a paragraph),
  --`gc` in visual mode to comment out the selection
  -- use 'tpope/vim-commentary'
  --use 'b3nj5m1n/kommentary'

  --GIT--
  use 'TimUntersberger/neogit'

  -- use 'airblade/vim-gitgutter'
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('gitsigns').setup{
            signs = {
                add          = {hl = 'DiffAdd'   , text = '+', numhl='GitSignsAddNr'},
                change       = {hl = 'DiffChange', text = '│', numhl='GitSignsChangeNr'},
                delete       = {hl = 'DiffDelete', text = '_', numhl='GitSignsDeleteNr'},
                topdelete    = {hl = 'DiffDelete', text = '‾', numhl='GitSignsDeleteNr'},
                changedelete = {hl = 'DiffChange', text = '~', numhl='GitSignsChangeNr'},
            }
        }
    end
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

  use 'sindrets/diffview.nvim'

  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, { 'nvim-telescope/telescope-fzy-native.nvim' }}
      -- requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}}
  }

  --telescope plugin for clipboard history
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {'tami5/sqlite.lua', module = 'sqlite'}, --for persistent history
    config = function()
        require('neoclip').setup({
            enable_persistant_history = false,
        })
    end,
  }

  use{
      'kyazdani42/nvim-tree.lua',
       requires = {'kyazdani42/nvim-web-devicons'},
       -- cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
   }

  -- use{
  --     'gukz/ftFT.nvim',
  --     config = function()
  --         vim.g.ftFT_hl_group = "ftFTSearch"
  --         vim.g.ftFT_sight_hl_group = "ftFTSight"
  --
  --         require("ftFT").setup()
  --     end
  --   }

  use {
      'chentau/marks.nvim',
      config = function() require('marks').setup {} end
  }

  use {'neoclide/coc.nvim', branch = 'release'}

  --view the latest version of the packages you depend on 
  use {
      'vuki656/package-info.nvim' ,
      requires = "MunifTanjim/nui.nvim",
      -- ft = { 'json', 'jsonc'},
      cmd = { 'PackageInfoShow' },
      config = function() require('package-info').setup() end
    }

  --colors preview
  use {
      'norcalli/nvim-colorizer.lua',
      config = function() require('colorizer').setup() end
  }

  use { 'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate' }

  --use {
      --'JoosepAlviste/nvim-ts-context-commentstring',
       -- requires = {'nvim-treesitter/nvim-treesitter'}
      --ft = { 'javascriptreact', 'typescriptreact' },
      -- config = function() require('nvim-ts-context-commentstring').setup() end
  --}

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  --Use treesitter to autoclose and autorename html tag
  use {
      'windwp/nvim-ts-autotag',
       -- requires = {'nvim-treesitter/nvim-treesitter'}
      ft = { 'html', 'javascriptreact', 'typescriptreact' },
      -- config = function() require('nvim-ts-autotag').setup() end
  }

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

  -- use 'alpertuna/vim-header'
    use {
        'antoyo/vim-licenses',
        ft = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
    }

  --md preview (depends on glow)
  use {'npxbr/glow.nvim', opt = true,  ft = { 'markdown' } }

  use {'voldikss/vim-translator',
        cmd = { 'TranslateW', 'TranslateW', 'TranslateH', 'TranslateL' }
    }

  use {'dpelle/vim-LanguageTool', opt = true, cmd = {'LanguageToolCheck'}}

  --COLOR SCHEMES--
  --LUA
  -- use {'npxbr/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
  use {'kyazdani42/blue-moon'}
  -- use {'tanvirtin/nvim-monokai'}
  -- use {'ful1e5/onedark.nvim'}
  use {'projekt0n/github-nvim-theme'}
  use {'RishabhRD/nvim-rdark'}
  use {'shaeinst/roshnivim-cs'}

  use {
    'mrjones2014/lighthaus.nvim',
    --has a kitty theme
    -- config = function() require('lighthaus').setup({ bg_dark = true, }) end
  }
  use {
    'mcchrish/zenbones.nvim',
    requires = 'rktjmp/lush.nvim',
  }

  -- use {'gruvbox-community/gruvbox', opt = true}
  use {'wbthomason/vim-nazgul', opt = true}
  use {'arzg/vim-substrata', opt = true}
  use {'fenetikm/falcon', opt = true}
  use {'Lokaltog/vim-monotone', opt = true}
  use {'cocopon/iceberg.vim', opt = true}
  use {'NieTiger/halcyon-neovim', opt = true}
  use {'YorickPeterse/vim-paper', opt = true}
  use {'sjl/badwolf', opt = true}
  use {'pradyungn/Mountain', rtp = 'vim', opt = true}
  use {'aditya-azad/candle-grey', opt = true}
  use {'stefanvanburen/rams.vim', opt = true}
  use {'fxn/vim-monochrome', opt = true}
  use {'noahfrederick/vim-hemisu', opt = true}
  use {'cloudhead/shady.vim', opt = true}
  use {'andreasvc/vim-256noir', opt = true}
  use {'rking/vim-detailed', opt = true}
  use {'danishprakash/vim-yami', opt = true}
  use {'vv9k/bogster', opt = true}
  -- use {'frenzyexists/aquarium-vim', opt = true}
  -- use {'habamax/vim-bronzage', opt = true}
  -- use {'sainnhe/edge', opt = true}
  -- use {'sainnhe/forest-night', opt = true}
  -- use {'sainnhe/gruvbox-material', opt = true}
  -- use {'reewr/vim-monokai-phoenix', opt = true}
  -- use {'mhartington/oceanic-next', opt = true}
  -- use {'sainnhe/sonokai', opt = true}

  --STATUS LINE--
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  use {'alec-gibson/nvim-tetris', opt = true, cmd = {'Tetris'}}
end)
