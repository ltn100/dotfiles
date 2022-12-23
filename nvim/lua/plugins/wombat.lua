-------------------------------------------------------------------------------
-- Wombat colour scheme
-- https://github.com/sheerun/vim-wombat-scheme
-------------------------------------------------------------------------------
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


-- VSCode autocomplete colours
--
-- gray
vim.cmd [[ highlight CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080 ]]
-- blue
vim.cmd [[ highlight CmpItemAbbrMatch guibg=NONE guifg=#569CD6 ]]
vim.cmd [[ highlight CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6 ]]
-- light blue
vim.cmd [[ highlight CmpItemKindVariable guibg=NONE guifg=#9CDCFE ]]
vim.cmd [[ highlight CmpItemKindInterface guibg=NONE guifg=#9CDCFE ]]
vim.cmd [[ highlight CmpItemKindText guibg=NONE guifg=#9CDCFE ]]
-- pink
vim.cmd [[ highlight CmpItemKindFunction guibg=NONE guifg=#C586C0 ]]
vim.cmd [[ highlight CmpItemKindMethod guibg=NONE guifg=#C586C0 ]]
-- front
vim.cmd [[ highlight CmpItemKindKeyword guibg=NONE guifg=#D4D4D4 ]]
vim.cmd [[ highlight CmpItemKindProperty guibg=NONE guifg=#D4D4D4 ]]
vim.cmd [[ highlight CmpItemKindUnit guibg=NONE guifg=#D4D4D4 ]]

-- Git gutter
vim.cmd [[ highlight GitGutterAdd guifg=#339933 ]]
vim.cmd [[ highlight GitGutterChange guifg=#bbbb33 ]]
vim.cmd [[ highlight GitGutterDelete guifg=#ff2222 ]]
