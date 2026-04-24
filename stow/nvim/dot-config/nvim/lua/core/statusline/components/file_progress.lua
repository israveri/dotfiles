return function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")

    if current_line == 1 then
        return "Top"
    elseif current_line == total_lines then
        return "Bot"
    else
        return string.format("%2d%%%%", math.floor(current_line / total_lines * 100))
    end
end
