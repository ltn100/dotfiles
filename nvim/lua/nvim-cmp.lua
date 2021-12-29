local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    return
end

cmp.setup {
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
    })
}
