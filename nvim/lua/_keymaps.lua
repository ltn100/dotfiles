----------------------------------------------------------------------------
-- Key Maps
----------------------------------------------------------------------------
utils = require "_utils"
keymap = utils.keymap

vim.g.mapleader = "<space>"

-- ctrl-c in insert mode behaves same as esc
keymap("i", "<C-C>", "<Esc>")

-- reload init.vim
keymap("n", "<leader>vr", ":source $MYVIMRC<cr>")

-- repeat shifting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

