----------------------------------------------------------------------------
-- Options
----------------------------------------------------------------------------
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true          -- smart indenting when opening new line
vim.opt.colorcolumn = { 80, 120 }
vim.opt.visualbell = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
-- show visible whitespace chars
vim.opt.list = true
vim.opt.listchars:append({ tab = ">-", trail = "~" })
vim.opt.signcolumn = "yes"
vim.opt.completeopt = "menu,menuone,noselect"
