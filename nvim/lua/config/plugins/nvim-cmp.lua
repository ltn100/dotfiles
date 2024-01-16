return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    config = function()
        local module = require("cmp")
        module.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect"
            },

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
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end
}
