----------------------------------------------------------------------------
-- Key Maps
----------------------------------------------------------------------------
local utils = require("_utils")
local keymap = utils.keymap

vim.g.mapleader = " "

-- ctrl-c in insert mode behaves same as esc
keymap("i", "<C-C>", "<Esc>")

-- reload init.vim
keymap("n", "<leader>vr", ":source $MYVIMRC<cr>")

-- repeat shifting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

