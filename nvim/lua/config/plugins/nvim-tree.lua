--[[
    A File Explorer For Neovim Written In Lua

    https://github.com/nvim-tree/nvim-tree.lua
]]
return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local module = require("nvim-tree")
        module.setup({
            actions = {
                open_file = {
                    quit_on_open = true
                }
            }
        })

    end
}
