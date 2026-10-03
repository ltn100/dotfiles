return {
    "okuuva/auto-save.nvim",
    version = '^1.0.0',
    cmd = "ASToggle",
    event = {
        "BufLeave",
        "FocusLost",
        "VimLeavePre",
        -- "InsertLeave",
        -- "TextChanged",
    },
    opts = {
        -- your config goes here
        -- or just leave it empty :)
    },
}

