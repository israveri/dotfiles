local M = {}

local base = (...):match("^(.+)%.lines")
local config = require(base .. ".config")

--- Returns the filename of given buffer.
--- @param bufid integer The buffer id
--- @param strip_extension? boolean If true, strips the file extension (default: false)
--- @return string
local function get_filename(bufid, strip_extension)
    local name = vim.api.nvim_buf_get_name(bufid)
    if name == "" then return "[No Name]" end
    local modifier = strip_extension and ":t:r" or ":t"
    local filename = vim.fn.fnamemodify(name, modifier)

    return string.format("%s", filename)
end

--- Detects and return the statusline for "special case" buffers, like NvimTree and help pages
--- @param winid integer The window id
--- @return string|nil
M.special = function (winid)
    local bufid = vim.api.nvim_win_get_buf(winid)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufid })
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufid })

    if filetype == "NvimTree" then return "  NvimTree" end
    if buftype == "help" then return string.format("󰋼  Help | %s", get_filename(bufid, true)) end
    if buftype == "nofile" then return "󰧧 No File" end
    if buftype == "terminal" then return "  Terminal" end

    return nil
end

--- Detects and returns the statusline for inactive (unfocused) buffers
--- @param winid integer The window id
--- @return string
M.inactive = function (winid)
    local bufid = vim.api.nvim_win_get_buf(winid)
    local filename = get_filename(bufid)
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufid })
    local ft = filetype ~= "" and filetype or "plain"

    return string.format("%s | %s", filename, ft)
end

--- Detects and returns the statusline for active (focused) buffers
--- @param winid integer The window id
--- @return string
M.active = function (winid)
    local bufid = vim.api.nvim_win_get_buf(winid)

    local padding = (" "):rep(config.padding)
    return table.concat({
        padding,
        table.concat({
            config.components.mode().name,
            --components.git.branch(bufid),
            get_filename(bufid),
        }, config.icons.separator.left),

        "%=",

        table.concat({
            config.components.file.encoding(),
            config.components.file.format(),
            config.components.file.type(),
            config.components.file.progress(),
            config.components.cursor.position(),
        }, config.icons.separator.right),
        padding,
    })
end

return M
