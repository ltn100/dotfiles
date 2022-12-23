-------------------------------------------------------------------------------
-- nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp
-------------------------------------------------------------------------------
local module = require("_utils").safe_require("nvim-lsp-installer")
if not module then return end

local cmp_lsp = require("_utils").safe_require("cmp_nvim_lsp")
if not cmp_lsp then return end

module.on_server_ready(function(server)
    local opts = {
        capabilities = cmp_lsp.default_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )
    }

    if server.name == "sumneko_lua" then
        local sumneko_opts = {
            settings = {

                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        }
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end
    server:setup(opts)
end)
