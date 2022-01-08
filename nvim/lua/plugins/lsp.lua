-------------------------------------------------------------------------------
-- nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp
-------------------------------------------------------------------------------
local module = require("_utils").safe_require("nvim-lsp-installer")
if not module then return end

local cmp_lsp = require("_utils").safe_require("cmp_nvim_lsp")
if not cmp_lsp then return end

module.on_server_ready(function(server)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_lsp.update_capabilities(capabilities)

    server:setup({
        capabilities = capabilities
    })
end)
