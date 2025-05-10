return {
    "gryf/wombat256grf",
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true
        vim.opt.cursorline = true
        vim.cmd([[ colorscheme wombat256grf ]])

        -- Treesitter
        vim.cmd([[ highlight @variable guibg=NONE guifg=NONE ]])

        -- VSCode autocomplete colours
        --
        -- gray
        vim.cmd [[ highlight CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080 ]]
        -- blue
        vim.cmd [[ highlight CmpItemAbbrMatch guibg=NONE guifg=#569CD6 ]]
        vim.cmd [[ highlight CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6 ]]
        -- light blue
        vim.cmd [[ highlight CmpItemKindVariable guibg=NONE guifg=#9CDCFE ]]
        vim.cmd [[ highlight CmpItemKindInterface guibg=NONE guifg=#9CDCFE ]]
        vim.cmd [[ highlight CmpItemKindText guibg=NONE guifg=#9CDCFE ]]
        -- pink
        vim.cmd [[ highlight CmpItemKindFunction guibg=NONE guifg=#C586C0 ]]
        vim.cmd [[ highlight CmpItemKindMethod guibg=NONE guifg=#C586C0 ]]
        -- front
        vim.cmd [[ highlight CmpItemKindKeyword guibg=NONE guifg=#D4D4D4 ]]
        vim.cmd [[ highlight CmpItemKindProperty guibg=NONE guifg=#D4D4D4 ]]
        vim.cmd [[ highlight CmpItemKindUnit guibg=NONE guifg=#D4D4D4 ]]

        -- Gitgutter
        vim.g.gitgutter_set_sign_backgrounds = 1
        vim.cmd [[ highlight GitGutterAdd guifg=#009900 ]]
        vim.cmd [[ highlight GitGutterChange guifg=#bbbb00 ]]
        vim.cmd [[ highlight GitGutterDelete guifg=#ff2222 ]]

    end,
}
