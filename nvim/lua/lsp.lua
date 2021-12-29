local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities = cmp_nvim_lsp.update_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )
    }
    server:setup(opts)
end)
