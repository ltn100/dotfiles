----------------------------------------------------------------------------
-- Key Maps
----------------------------------------------------------------------------
function keymap(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap=true, silent=true})
end

-- ctrl-c in insert mode behaves same as esc
keymap("i", "<C-C>", "<Esc>")

-- reload init.vim
keymap("n", "<leader>vr", ":source $MYVIMRC<cr>")

-- repeat shifting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- open links/files in native app
keymap("n", "gx", [[:silent execute '!xdg-open ' . shellescape(expand('<cfile>'), 1)<CR>]], {})

-- nvim-tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- telescope
vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>g", require("telescope.builtin").git_status)
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers)

-- toggleterm
keymap("n", "<leader>t", "<cmd>ToggleTerm<CR>")

