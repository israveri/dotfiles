local M = {}

---@class Devicons
---@field get_icon_by_filetype fun(filetype: string, opts?: table): string|nil, string|nil

-- =======================================================================================================
-- State
-- =======================================================================================================

M._module_path = ...
M._git_branch_cache = {}
M._devicons = nil ---@type Devicons|nil

-- =======================================================================================================
-- Helpers
-- =======================================================================================================

--- Returns the filename of given buffer.
--- @param bufid integer The buffer id
--- @param strip_extension? boolean If true, strips the file extension (default: false)
--- @return string
local function get_filename(bufid, strip_extension)
    local name = vim.api.nvim_buf_get_name(bufid)
    if name == "" then return "[No Name]" end

    local modifier = strip_extension and ":t:r" or ":t"

    return vim.fn.fnamemodify(name, modifier)
end

--- Resolves the git branch for given buffer and stores it in cache
--- @param bufid integer The buffer id
local function update_git_branch_cache(bufid)
    local filepath = vim.api.nvim_buf_get_name(bufid)
    if filepath == "" then
        M._git_branch_cache[bufid] = nil
        return
    end

    local dir = vim.fn.fnamemodify(filepath, ":h")
    local branch = vim.trim(vim.fn.system(string.format(
        "git -C %q branch --show-current 2>/dev/null", dir
    )))

    if branch ~= "" then
        M._git_branch_cache[bufid] = string.format("%s", branch)
    else
        M._git_branch_cache[bufid] = nil
    end
end

-- =======================================================================================================
-- Components
-- =======================================================================================================

M.components = {
    --- Returns the label and highlight group key for the current editor mode
    --- @return { name: string, hl: string }
    mode = function()
        local unknown_mode = { name = "UNKNOWN", hl = "Normal" }
        local modes = {
            -- \19 = ^S (S-BLOCK), \22 = ^V (V-BLOCK)
            ["n"]     = { name = "NORMAL",     hl = "Normal" },
            ["no"]    = { name = "OP-PENDING", hl = "Pending" },
            ["nov"]   = { name = "OP-PENDING", hl = "Pending" },
            ["noV"]   = { name = "OP-PENDING", hl = "Pending" },
            ["no\22"] = { name = "OP-PENDING", hl = "Pending" },
            ["niI"]   = { name = "NORMAL",     hl = "Normal" },
            ["niR"]   = { name = "NORMAL",     hl = "Normal" },
            ["niV"]   = { name = "NORMAL",     hl = "Normal" },
            ["nt"]    = { name = "NORMAL",     hl = "Normal" },
            ["ntT"]   = { name = "NORMAL",     hl = "Normal" },
            ["v"]     = { name = "VISUAL",     hl = "Visual"  },
            ["vs"]    = { name = "VISUAL",     hl = "Visual"  },
            ["V"]     = { name = "V-LINE",     hl = "Visual"  },
            ["Vs"]    = { name = "V-LINE",     hl = "Visual"  },
            ["\22"]   = { name = "V-BLOCK",    hl = "Visual"  },
            ["\22s"]  = { name = "V-BLOCK",    hl = "Visual"  },
            ["s"]     = { name = "SELECT",     hl = "Insert"  },
            ["S"]     = { name = "S-LINE",     hl = "Normal"  },
            ["\19"]   = { name = "S-BLOCK",    hl = "Normal"  },
            ["i"]     = { name = "INSERT",     hl = "Insert"  },
            ["ic"]    = { name = "INSERT",     hl = "Insert"  },
            ["ix"]    = { name = "INSERT",     hl = "Insert"  },
            ["R"]     = { name = "REPLACE",    hl = "Replace" },
            ["Rc"]    = { name = "REPLACE",    hl = "Replace" },
            ["Rx"]    = { name = "REPLACE",    hl = "Replace" },
            ["Rv"]    = { name = "V-REPLACE",  hl = "Replace" },
            ["Rvc"]   = { name = "V-REPLACE",  hl = "Replace" },
            ["Rvx"]   = { name = "V-REPLACE",  hl = "Replace" },
            ["c"]     = { name = "COMMAND",    hl = "Command" },
            ["cv"]    = { name = "EX",         hl = "Command" },
            ["ce"]    = { name = "EX",         hl = "Command" },
            ["r"]     = { name = "REPLACE",    hl = "Normal"  },
            ["rm"]    = { name = "MORE",       hl = "Normal"  },
            ["r?"]    = { name = "CONFIRM",    hl = "Normal"  },
            ["!"]     = { name = "SHELL",      hl = "Normal"  },
            ["t"]     = { name = "TERMINAL",   hl = "Command" },
        }

        return modes[vim.fn.mode()] or unknown_mode
    end,

    git = {
        --- Returns the current git branch for given buffer
        --- @param bufid integer The buffer id
        --- @return string|nil
        branch = function(bufid)
            local branch = M._git_branch_cache[bufid]

            if branch == nil then
                return "_"
            else
                return M.icon.git.branch .. branch
            end
        end
    },

    file = {
        encoding = function()
            local encoding = vim.bo.fileencoding
            return encoding:upper()
        end,

        format = function()
            return M.icon.file.format[vim.bo.fileformat]
        end,

        name = function(bufid)
            return string.format("%s", get_filename(bufid))
        end,

        progress = function()
            local current_line = vim.fn.line(".")
            local total_lines = vim.fn.line("$")

            if current_line == 1 then
                return "Top"
            elseif current_line == total_lines then
                return "Bot"
            else
                return string.format("%2d%%%%", math.floor(current_line / total_lines * 100))
            end
        end,

        type = function()
            local filetype = vim.bo.filetype

            if M._devicons then
                local icon = M._devicons.get_icon_by_filetype(filetype)

                if icon then
                    return string.format("%s %s", icon, filetype)
                end
            end

            return string.format("%s", filetype)
        end
    },

    cursor = {
        position = function()
            local row, column = unpack(vim.api.nvim_win_get_cursor(0))
            return string.format("%d:%d", row, column + 1)
        end
    },
}

-- =======================================================================================================
-- Line builders
-- =======================================================================================================

--- Detects and return the statusline for "special case" buffers, like NvimTree and help pages
--- @param winid integer The window id
--- @return string|nil
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

--- Detects and returns the statusline for inactive (unfocused) buffers
--- @param winid integer The window id
--- @return string
local function inactive_line(winid)
    local bufid = vim.api.nvim_win_get_buf(winid)
    local filename = get_filename(bufid)
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufid })
    local ft = filetype ~= "" and filetype or "plain"

    return string.format("%s | %s", filename, ft)
end

--- Detects and returns the statusline for active (focused) buffers
--- @param winid integer The window id
--- @return string
local function active_line(winid)
    local bufid = vim.api.nvim_win_get_buf(winid)

    local padding = (" "):rep(M.padding)
    return table.concat({
        padding,
        table.concat({
            M.components.mode().name,
            M.components.git.branch(bufid),
            M.components.file.name(bufid),
        }, M.icon.separator.left),

        "%=",

        table.concat({
            M.components.file.encoding(),
            M.components.file.format(),
            M.components.file.type(),
            M.components.file.progress(),
            M.components.cursor.position(),
        }, M.icon.separator.right),
        padding,
    })
end

-- =======================================================================================================
-- Public Api
-- =======================================================================================================

M.setup = function(opts)
    M.padding = 1

    M.icon = {
        file = {
            format = {
                unix = "",
                dos = "",
                mac = ""
            },
        },
        git = {
            branch = " "
        },
        separator = {
            left = " | ",
            right = " | ",
        },
    }

    if opts then
        for k,v in pairs(opts) do
            M[k] = v
        end
    end

    -- Seeds git branch cache for loaded buffers
    for _,bufid in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(bufid) then
            update_git_branch_cache(bufid)
        end
    end

    -- Loads nvim-web-devicons
    local ok, result = pcall(require, "nvim-web-devicons")
    M._devicons = ok and result or nil
end

--- Renders the statusline contextualized to it's buffer (special, inactive, active)
--- @return string
M.render = function()
    local winid = vim.g.statusline_winid
    if not winid then return "" end

    local special = special_line(winid)
    if special then return special end

    if winid == vim.api.nvim_get_current_win() then
        return active_line(winid)
    else
        return inactive_line(winid)
    end
end

-- =======================================================================================================
-- Side Effects
-- =======================================================================================================

-- Effectively sets this statusline and hides the default mode to avoid duplication
vim.o.showmode = false
vim.o.statusline = string.format("%%!v:lua.require('%s').render()", M._module_path)

-- Update git branch cache when entering a buffer
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
    group = vim.api.nvim_create_augroup("StatuslineGitBranchUpdate", { clear = true }),
    callback = function(event)
        update_git_branch_cache(event.buf)
    end,
})

-- Clears git branch cache when buffer is deleted
vim.api.nvim_create_autocmd({ "BufDelete" }, {
    group = vim.api.nvim_create_augroup("StatuslineGitBranchClear", { clear = true }),
    callback = function(event)
        M._git_branch_cache[event.buf] = nil
    end
})

vim.api.nvim_create_user_command("StatuslineReload", function()
    local name = M._module_path

    package.loaded[name] = nil
    local success, result = pcall(require, name)
    if success then
        vim.cmd("redrawstatus!")
        print("Statusline successfully reloaded!")
    else
        print("Error reloading statusline: " .. result)
    end
end, { desc = "Reloads statusline module" })

M.setup({})

return M
