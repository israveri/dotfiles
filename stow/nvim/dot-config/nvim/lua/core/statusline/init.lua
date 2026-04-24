local M = {}

M._module_path = ...
M._git_branch_cache = {}


-- =======================================================================================================
-- Public Api
-- =======================================================================================================
M.setup = function(opts)
    M.config = require(M._module_path .. ".config")
    M.config.setup(opts, M._module_path)

    -- Seeds git branch cache for loaded buffers
    -- for _,bufid in ipairs(vim.api.nvim_list_bufs()) do
    --     if vim.api.nvim_buf_is_loaded(bufid) then
    --         update_git_branch_cache(bufid)
    --     end
    -- end
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


-- =======================================================================================================
-- Side Effects
-- =======================================================================================================
-- Update git branch cache when entering a buffer
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
--     group = vim.api.nvim_create_augroup("StatuslineGitBranchUpdate", { clear = true }),
--     callback = function(event)
--         update_git_branch_cache(event.buf)
--     end,
-- })

-- Clears git branch cache when buffer is deleted
vim.api.nvim_create_autocmd({ "BufDelete" }, {
    group = vim.api.nvim_create_augroup("StatuslineGitBranchClear", { clear = true }),
    callback = function(event)
        M._git_branch_cache[event.buf] = nil
    end
})

local module_path = M._module_path
vim.api.nvim_create_user_command("StatuslineReload", function()
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

-- Effectively sets this statusline and hides the default mode to avoid duplication
vim.o.showmode = false
vim.o.statusline = string.format("%%!v:lua.require('%s').render()", module_path)


-- =======================================================================================================
-- Wrap up
-- =======================================================================================================
M.setup({})

return M
