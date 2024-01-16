--[[
    A plugin to persist and toggle multiple terminals during an editing session

    https://github.com/akinsho/toggleterm.nvim
]]
return {
    "akinsho/toggleterm.nvim",
    config = function()
        local module = require("toggleterm")
        module.setup({})

        local keymap = vim.keymap
        keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>")
        keymap.set("n", "<C-Space>", "<cmd>ToggleTerm<CR>")

        function _G.set_terminal_keymaps()
          local opts = {buffer = 0}
          vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
          vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
          vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
          vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
          vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
          vim.keymap.set("t", "<C-Space>", [[<Cmd>ToggleTerm<CR>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
}
