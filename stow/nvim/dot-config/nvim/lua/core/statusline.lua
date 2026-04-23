local M = {}

local function get_filename(bufid, strip_extension)
    local name = vim.api.nvim_buf_get_name(bufid)
    if name == "" then return "[No Name]" end

    local modifier = strip_extension and ":t:r" or ":t"

    return vim.fn.fnamemodify(name, modifier)
end

local function special_line(winid)
    local bufid = vim.api.nvim_win_get_buf(winid)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufid })
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufid })

    if filetype == "NvimTree" then return "  NvimTree" end
    if buftype == "help" then return string.format("󰋼  Help | %s", get_filename(bufid, true)) end
    if buftype == "nofile" then return "󰧧 No File" end
    if buftype == "terminal" then return "  Terminal" end

    return nil
end

local function inactive_line(winid)
    local bufid = vim.api.nvim_win_get_buf(winid)
    local filename = get_filename(bufid)
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufid })
    local ft = filetype ~= "" and filetype or "plain"

    return string.format("%s | %s", filename, ft)
end

local function active_line(winid)
    local bufid = vim.api.nvim_win_get_buf(winid)
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufid })
    local filename = get_filename(bufid)

    if filetype == "" then filetype = "plain" end

    return table.concat({
        string.format("%s", filename),
        "%=",
        string.format("%s", filetype),
    })
end

M.render = function()
    local winid = vim.g.statusline_winid
    if not winid then return "" end

    local special = special_line(winid)
    if special then return special end

    if M._active_win == winid then
        return active_line(winid)
    else
        return inactive_line(winid)
    end
end

vim.api.nvim_create_autocmd({ "WinEnter", "WinLeave", "BufEnter"}, {
    group = vim.api.nvim_create_augroup("StatuslineRedraw", { clear = true }),
    callback = function()
        M._active_win = vim.api.nvim_get_current_win()
        vim.cmd("redrawstatus!")
    end
})

return M
