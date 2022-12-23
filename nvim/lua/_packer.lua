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

    -- nvim-tree
    use "kyazdani42/nvim-tree.lua"

    -- lualine
    use "nvim-lualine/lualine.nvim"

    use "p00f/nvim-ts-rainbow"
    use "tpope/vim-commentary"
    use "akinsho/toggleterm.nvim"
    -- use "mfussenegger/nvim-dap"
    -- use "mfussenegger/nvim-dap-python"
    -- use "rcarriga/nvim-dap-ui"

    use "jeffreyiacono/vim-colors-wombat"

    use "airblade/vim-gitgutter"

end


-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git', 'clone',
      '--depth', '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
