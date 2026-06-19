local M = {}

M._module_path = ...

M.setup = function(opts)
    M.config = require(M._module_path .. ".config")
    M.config.setup(opts, M._module_path)
end

--- Renders the statusline contextualized to it's buffer (special, inactive, active)
--- @return string
M.render = function()
    local winid = vim.g.statusline_winid

    local special = M.config.lines.special(winid)
    if special then
        return special
    end

    if winid ~= vim.api.nvim_get_current_win() then
        return M.config.lines.inactive(winid)
    end

    return M.config.lines.active(winid)
end

-- Side Effects
local module_path = M._module_path
vim.api.nvim_create_user_command("StatuslineReload", function()
    package.loaded["colors.palette"] = nil

    for key in pairs(package.loaded) do
        if key:match("^" .. module_path) then
            package.loaded[key] = nil
        end
    end

    local success, result = pcall(require, module_path)
    if success then
        vim.cmd("redrawstatus!")
        print("Statusline successfully reloaded!")
    else
        print("Error reloading statusline: " .. result)
    end
end, { desc = "Reloads statusline module" })

-- Hides default mode indicator and sets statusline
vim.o.showmode = false
vim.o.statusline = string.format("%%!v:lua.require('%s').render()", module_path)

-- Setup and cleanup
M.setup({})

return M
