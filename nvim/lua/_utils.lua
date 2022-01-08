local M = {}

function M.keymap(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap=true, silent=true})
end

function M.safe_require(module_name)
    --[[
        Perform a protected call to "require" and notify of any errors
    ]]
    local status_ok, module = pcall(require, module_name)
    if not status_ok then
        vim.notify("Error requiring " .. module_name)
        return
    end
    return module
end

return M
