local packer_startup = function(use)

    use "wbthomason/packer.nvim" -- packer manages itself

    -- lsp
    use "neovim/nvim-lspconfig"
    use {
        "williamboman/nvim-lsp-installer",
        run = ":LspInstall pyright sumneko_lua",
    }

    -- cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"    -- source for LSP

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "tpope/vim-commentary"
    use "akinsho/toggleterm.nvim"
    -- use "mfussenegger/nvim-dap"
    -- use "mfussenegger/nvim-dap-python"
    -- use "rcarriga/nvim-dap-ui"

    use "jeffreyiacono/vim-colors-wombat"
    use "nvim-lualine/lualine.nvim"

end


-- Automatically install packer
local data_path = vim.fn.stdpath "data"
local install_path = data_path .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system {
    "git", "clone",
    "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.cmd [[packadd packer.nvim]]
  vim.notify "Packer installed. Close and reopen Neovim..."
end

local packer = require("_utils").safe_require("packer")
if not packer then return end

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost _packer.lua source <afile> | PackerSync
  augroup end
]]


packer.startup(function(use)
    packer_startup(use)
    if packer_bootstrap then
        packer.sync()
    end
end)
