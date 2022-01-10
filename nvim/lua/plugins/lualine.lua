-------------------------------------------------------------------------------
-- nvim-lualine
-- https://github.com/nvim-lualine/lualine.nvim
-------------------------------------------------------------------------------
local module = require("_utils").safe_require("lualine")
if not module then return end

module.setup({
    options = {
        icons_enabled = false,
        theme = "powerline",
    }
})
