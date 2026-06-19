local base = (...):match("^(.+)%.components%.file_format")
local config = require(base .. ".config")

return function()
    local fileformat = vim.bo.fileformat
    return config.icons.file.format[fileformat] .. " " .. fileformat
end
