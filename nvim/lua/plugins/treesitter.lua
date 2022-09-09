-------------------------------------------------------------------------------
-- Treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
-------------------------------------------------------------------------------
local module = require("_utils").safe_require("nvim-treesitter.configs")
if not module then return end

module.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
      enable = true,
      disable = { "" }
  },
  rainbow = {
    enable = true,
  }
}
