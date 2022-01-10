-------------------------------------------------------------------------------
-- Toggleterm
-- https://github.com/akinsho/toggleterm.nvim
-------------------------------------------------------------------------------
vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 0,
    files = 0,
    folder_arrows = 1,
}


local module = require("_utils").safe_require("nvim-tree")
if not module then return end

module.setup {
    diagnostics = {
        enable = false
    }
}

keymap = require("_utils").keymap

keymap("n", "<leader>f", ":NvimTreeToggle<CR>")
