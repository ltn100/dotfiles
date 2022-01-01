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

----------------------------------------------------------------------------
-- Key Maps
----------------------------------------------------------------------------
local function keymap(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap=true, silent=true})
end
vim.g.mapleader = "<space>"

-- ctrl-c in insert mode behaves same as esc
keymap("i", "<C-C>", "<Esc>")

-- reload init.vim
keymap("n", "<leader>vr", ":source $MYVIMRC<cr>")

-- repeat shifting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

----------------------------------------------------------------------------
-- Plugins
----------------------------------------------------------------------------
require "plugins"
require "wombat"
require "lsp"
require "nvim-cmp"
require "treesitter"

-- Automatically install vim-plug
--let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
--if empty(glob(data_dir . '/autoload/plug.vim'))
--    silent execute
--        \ '!curl -fLo '.data_dir.'/autoload/plug.vim '.
--        \ '--create-dirs '.
--        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
--    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
--endif

--call plug#begin(data_dir . '/plugins')

--source ~/.config/nvim/plugins/wombat.vim
--source ~/.config/nvim/plugins/nvim-lspconfig.vim

--call plug#end()
--doautocmd User PlugLoaded


--require'lspconfig'.pyright.setup{}
