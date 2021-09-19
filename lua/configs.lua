--STATUS LINE
require('lualine').setup{
    options = { theme = 'seoul256' },
    sections = {
        lualine_b = { 'branch', 'diff' },
        lualine_c = { {
            'filename',
            path = 1,
            -- full_path = true,
         }, 'ConflictedVersion' }
    },
    extensions = { 'fzf', 'fugitive' }
}

--GIT SIGNS
-- require('gitsigns').setup{
--     signs = {
--         add          = {hl = 'DiffAdd'   , text = '+', numhl='GitSignsAddNr'},
--         change       = {hl = 'DiffChange', text = '│', numhl='GitSignsChangeNr'},
--         delete       = {hl = 'DiffDelete', text = '_', numhl='GitSignsDeleteNr'},
--         topdelete    = {hl = 'DiffDelete', text = '‾', numhl='GitSignsDeleteNr'},
--         changedelete = {hl = 'DiffChange', text = '~', numhl='GitSignsChangeNr'},
--     }
-- }

--TREESITTER
require'nvim-treesitter.configs'.setup{
  playground = { enable = true },
  highlight = {
              enable = true,
              custom_captures = {
                ["export"] = "TSExport",
                ["return"] = "TSReturn",
                ["debugger"] = "TSDebugger",
                ["arrow"] = "TSArrow",
                ["dot"] = "TSDot",
                ["jsx.prop"] = "TSJsxProp",
                ["jsx.element"] = "TSJsxElement",
            },
  },
  incremental_selection = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true },
}

