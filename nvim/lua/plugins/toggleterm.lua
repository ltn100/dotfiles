-------------------------------------------------------------------------------
-- Toggleterm
-- https://github.com/akinsho/toggleterm.nvim
-------------------------------------------------------------------------------
local module = require("_utils").safe_require("toggleterm")
if not module then return end

module.setup{}

keymap = require("_utils").keymap

keymap("n", "<C- >", ":ToggleTerm<CR>")

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, "t", "<C- >", "<C-\\><C-n>:ToggleTerm<CR>", opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "<C-\\><C-n>", opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-w><C-w>", "<C-\\><C-n><C-w><C-w>", opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-w><C-j>", "<C-\\><C-n><C-w><C-j>", opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-w><C-k>", "<C-\\><C-n><C-w><C-k>", opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-w>w", "<C-\\><C-n><C-w><C-w>", opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-w>j", "<C-\\><C-n><C-w><C-j>", opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-w>k", "<C-\\><C-n><C-w><C-k>", opts)
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
