----------------------------------------------------------------------------
-- Key Maps
----------------------------------------------------------------------------
function keymap(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap=true, silent=true})
end

vim.g.mapleader = " "

-- ctrl-c in insert mode behaves same as esc
keymap("i", "<C-C>", "<Esc>")

-- reload init.vim
keymap("n", "<leader>vr", ":source $MYVIMRC<cr>")

-- repeat shifting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

