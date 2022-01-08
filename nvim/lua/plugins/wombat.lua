vim.opt.termguicolors = true
vim.opt.cursorline = true

local status_ok, _ = pcall(vim.cmd, [[ colorscheme wombat ]])
if not status_ok then
    return
end

-- Column limit
vim.cmd [[ highlight ColorColumn guibg=#303030 ]]

-- Gutter
vim.cmd [[ highlight SignColumn guibg=#202020 ]]
vim.cmd [[ highlight LineNr guibg=#202020 ]]

-- Change cursor line in INSERT mode
vim.cmd [[ autocmd InsertEnter * highlight CursorLine guibg=#3d2d2d ]]
vim.cmd [[ autocmd InsertLeave * highlight CursorLine guibg=#2d2d2d ]]
