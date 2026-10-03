return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local module = require("telescope")
        module.setup({
            path_display = { "truncate" },
        })
        require('telescope').load_extension('fzf')

        -- Override netrw
        -- local find_files_hijack_netrw = vim.api.nvim_create_augroup("find_files_hijack_netrw", { clear = true })
        -- -- clear FileExplorer appropriately to prevent netrw from launching on folders
        -- -- netrw may or may not be loaded before telescope-find-files
        -- -- conceptual credits to nvim-tree and telescope-file-browser
        -- vim.api.nvim_create_autocmd("VimEnter", {
        --     pattern = "*",
        --     once = true,
        --     callback = function()
        --         pcall(vim.api.nvim_clear_autocmds, { group = "FileExplorer" })
        --     end,
        -- })
        -- vim.api.nvim_create_autocmd("BufEnter", {
        --     group = find_files_hijack_netrw,
        --     pattern = "*",
        --     callback = function()
        --         vim.schedule(function()
        --             -- Early return if netrw or not a directory
        --             if vim.bo[0].filetype == "netrw" or vim.fn.isdirectory(vim.fn.expand("%:p")) == 0 then
        --                 return
        --             end

        --             vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
        --             local cwd = vim.fn.expand("%:p:h")
        --             vim.api.nvim_set_current_dir(cwd)

        --             require("telescope.builtin").find_files({
        --                 cwd = cwd,
        --             })
        --         end)
        --     end,
        -- })
    end,
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
    }
}
