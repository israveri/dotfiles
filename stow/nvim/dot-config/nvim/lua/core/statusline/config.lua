local M = {}

---@class Devicons
---@field get_icon_by_filetype fun(filetype: string, opts?: table): string|nil, string|nil
M._devicons = nil ---@type Devicons|nil
M._module_path = nil

M.setup = function(opts, module_path)
    M.padding = 1
    M.icons = {
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

    M.lines = require(module_path .. ".lines")
    M.components = {
        mode = require(module_path .. ".components.mode"),
        file = {
            encoding = require(module_path .. ".components.file_encoding"),
            format = require(module_path .. ".components.file_format"),
            type = require(module_path .. ".components.file_type"),
            progress = require(module_path .. ".components.file_progress"),
        },
        cursor = {
            position = require(module_path .. ".components.cursor_position"),
        },
    }

    -- Loads nvim-web-devicons
    local ok, result = pcall(require, "nvim-web-devicons")
    M._devicons = ok and result or nil

    M._module_path = module_path
end

return M
