return function()
    local row, column = unpack(vim.api.nvim_win_get_cursor(0))
    return string.format("%d:%d", row, column + 1)
end
