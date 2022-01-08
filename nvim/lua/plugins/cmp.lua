-------------------------------------------------------------------------------
-- nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp
-------------------------------------------------------------------------------
local module = require("_utils").safe_require("cmp")
if not module then return end

module.setup {
    sources = module.config.sources({
        { name = "nvim_lsp" },
    })
}
