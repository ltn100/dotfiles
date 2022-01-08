-- Automatically install packer
local data_path = vim.fn.stdpath "data"
local install_path = data_path .. "/site/pack/packer/start/packer.nvim"
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.startup(function()
  use "wbthomason/packer.nvim" -- packer manages itself

  -- lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

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

  use "jeffreyiacono/vim-colors-wombat"

  if packer_bootstrap then
    packer.sync()
  end
end)

-- Setup all plugins
require "plugins.wombat"
require "plugins.lsp"
require "plugins.cmp"
require "plugins.treesitter"
require "plugins.toggleterm"
