--STATUS LINE
local custom_seoul256 = require'lualine.themes.seoul256'
-- Change the background of lualine_c section for normal mode
custom_seoul256.normal.c.bg = '#222020'
custom_seoul256.normal.a.bg = '#787271'
custom_seoul256.insert.a.bg = '#787271'

require('lualine').setup{
    options = { theme = custom_seoul256 },
    -- options = { theme = 'zenwritten_dark' },
    sections = {
        lualine_b = { 'branch', 'diff' },
        lualine_c = { {
            'filename',
            path = 1,
            -- full_path = true,
         }, 'ConflictedVersion' },
        lualine_x = { 'diagnostics' },
    },
    extensions = { 'fzf', 'fugitive' }
}

--FILE EXPLORER
vim.api.nvim_set_var('nvim_tree_git_hl', 1)                 --enable file highlight for git attributes
vim.api.nvim_set_var('nvim_tree_indent_markers', 1)         --shows indent markers when folders are open
vim.api.nvim_set_var('nvim_tree_add_trailing', 1)           --append a trailing slash to folder names
vim.api.nvim_set_var('nvim_tree_highlight_opened_files', 1) --enable folder and file icon highlight for opened files/directories.
-- vim.api.nvim_set_var('nvim_tree_follow', 1)                 --allows the cursor to be updated to the correct location in the tree on |BufEnter|

require('nvim-tree').setup{
  -- closes neovim automatically when the tree is the last **WINDOW** in the vie
  auto_close = true,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable = true,
  },
  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 35,
  }
}
-- nnoremap <F2> :<C-u>NvimTreeToggle<CR>
vim.api.nvim_set_keymap('n', '<F2>', ':<C-u>NvimTreeToggle<CR>', {})

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

