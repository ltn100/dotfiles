-------------------------------------------------------------------------------
-- nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp
-------------------------------------------------------------------------------
local dap_python = require("_utils").safe_require("dap-python")
if not dap_python then return end

dap_python.setup(
    "python"  -- python executable
)

local dap_ui = require("_utils").safe_require("dapui")
if not dap_ui then return end

dap_ui.setup()

keymap = require("_utils").keymap

keymap("n", "<leader>dc", ":lua require('dap').continue()<CR>")
