local base = (...):match("^(.+)%.components%.file_type")
local config = require(base .. ".config")

return function()
    local filetype = vim.bo.filetype

    if config._devicons then
        local icon = config._devicons.get_icon_by_filetype(filetype)

        if icon then
            return string.format("%s %s", icon, filetype)
        end
    end

    return filetype
end
