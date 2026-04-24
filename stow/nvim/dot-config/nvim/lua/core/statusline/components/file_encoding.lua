return function()
    local encoding = vim.bo.fileencoding
    return encoding:upper()
end

