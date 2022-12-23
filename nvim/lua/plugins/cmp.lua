-------------------------------------------------------------------------------
-- nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp
-------------------------------------------------------------------------------
local module = require("_utils").safe_require("cmp")
if not module then return end

module.setup {
    mapping = module.mapping.preset.insert({
        ['<Tab>'] = module.mapping(function(fallback)
            if module.visible() then
                -- module.select_next_item()
                module.confirm({select = true})
                return
            end
                fallback()
        end
        , { 'i' }),
    }),
    sources = module.config.sources({
        { name = "nvim_lsp" },
    })
}
