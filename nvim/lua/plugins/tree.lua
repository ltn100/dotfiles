-------------------------------------------------------------------------------
-- Toggleterm
-- https://github.com/akinsho/toggleterm.nvim
-------------------------------------------------------------------------------

local module = require("_utils").safe_require("nvim-tree")
if not module then return end

module.setup {
    diagnostics = {
        enable = false
    }
}

keymap = require("_utils").keymap

keymap("n", "<leader>f", ":NvimTreeToggle<CR>")
