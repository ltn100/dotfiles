return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local module = require("lualine")
    module.setup({
      options = {
        theme = "powerline",
      },
    })
  end,
}
