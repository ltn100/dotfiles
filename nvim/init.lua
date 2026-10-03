vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true          -- smart indenting when opening new line
vim.opt.colorcolumn = { 80 }
vim.opt.visualbell = false
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.wrap = false
vim.opt.hidden = true
-- show visible whitespace chars
vim.opt.list = true
vim.opt.listchars:append({ tab = ">-", trail = "~" })
vim.opt.signcolumn = "yes:2"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.mouse = "a"
vim.opt.updatetime = 100 --ms

vim.g.mapleader = " "

vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/folke/flash.nvim" },
    { src = "https://github.com/christoomey/vim-tmux-navigator" },
    { src = "https://github.com/airblade/vim-gitgutter" },

    { src = "https://github.com/marko-cerovac/material.nvim" },
    { src = "https://github.com/Mofiqul/vscode.nvim" },
    -- { src = "https://github.com/gryf/wombat256grf" },
    { src = "https://github.com/rktjmp/lush.nvim" },
    { src = "https://github.com/ViViDboarder/wombat.nvim" },
})
-- vim.g.background = "dark"
-- vim.cmd.colorscheme("wombat256grf")

require("wombat").set_colorscheme(
    "wombat",
    require("lush_theme.wombat_classic"),
    "lush"
)
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
--
-- vim.cmd.colorscheme("wombat")

require("flash").setup({
    label = {
        uppercase = false,
        -- rainbow = {
        --     enabled = true,
        -- },
    },
    modes = {
        search = {
            enabled = true,
        },
        char = {
            enabled = true,
            -- show jump labels
            jump_labels = true,
        },
    },
})

-- local lush = require('lush')
--
-- -- Define your override using Lush syntax
-- local my_overrides = lush(function(injected_functions)
--   local sym = injected_functions.sym
--   return {
--     -- This tells Lush to style FlashLabel
--     FlashLabel = { bg = lush.hsl(330, 0, 0), fg = lush.hsl(0, 0, 100), gui = "bold" }, 
--   }
-- end)
--
-- -- Apply it
-- lush.apply(my_overrides)

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        "lua_ls",
        "stylua",
        "pyright",
    },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.cmd("set completeopt+=noselect")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client ~= nil and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
