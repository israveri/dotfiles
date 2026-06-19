local M = {}

M.palette_to_groups = function(palette)
    return {
        StatuslineNormal =    { fg = palette.on_normal,  bg = palette.normal,  bold = true },
        StatuslineInsert =    { fg = palette.on_insert,  bg = palette.insert,  bold = true },
        StatuslineVisual =    { fg = palette.on_visual,  bg = palette.visual,  bold = true },
        StatuslineReplace =   { fg = palette.on_replace, bg = palette.replace, bold = true },
        StatuslineCommand =   { fg = palette.on_command, bg = palette.command, bold = true },
        StatuslinePending =   { fg = palette.on_pending, bg = palette.pending, bold = true },

        StatuslineMeta =      { fg = palette.fg,         bg = palette.bg },
        StatuslineFile =      { fg = palette.fg_muted,   bg = palette.bg },
        StatuslineSeparator = { fg = palette.fg_subtle,  bg = palette.bg },
        StatuslineProgress =  { fg = palette.fg_subtle,  bg = palette.bg },
        StatuslineSpecial =   { fg = palette.fg_muted,   bg = palette.bg },

        StatuslineInactive =  { fg = palette.fg_subtle,  bg = palette.bg_alt },
    }
end

M.apply = function()
    local ok, palette = pcall(require, "colors.palette")
    if not ok then return end

    local groups = M.palette_to_groups(palette)
    for name, spec in pairs(groups) do
        vim.api.nvim_set_hl(0, name, spec)
    end
end

M.hl = function(group, content)
    return string.format("%%#%s#%s%%#StatusLine#", group, content)
end

return M
