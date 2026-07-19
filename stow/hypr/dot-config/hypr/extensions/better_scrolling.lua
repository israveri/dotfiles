local fit_edges = function(window)
    if window == nil
        or window.floating
        or window.workspace == nil
        or window.layout == nil
        or window.layout.name ~= "scrolling"
        or window.layout.column == nil then

        return
    end

    local max_index = 0
    local column_index = window.layout.column.index

    -- Counts the amount of windows in the workspace
    local ws = hl.get_active_workspace()
    for _, w in ipairs(hl.get_windows({ workspace = ws })) do
        if not w.floating
            and w.workspace ~= nil
            and w.workspace.id == w.workspace.id
            and w.layout ~= nil
            and w.layout.name == "scrolling"
            and w.layout.column ~= nil then

            if w.layout.column.index > max_index then
                max_index = w.layout.column.index
            end
        end
    end

    -- If window is "in the middle", set fit method to 'center' (0)
    -- Otherwise it is in one of the edges, then set fit method to 'fit' (1)
    if column_index > 0 and column_index ~= max_index then
        hl.config({ scrolling = { focus_fit_method = 0 } })
    else
        hl.config({ scrolling = { focus_fit_method = 1 } })
    end
end

hl.on("window.open", fit_edges)
hl.on("window.active", fit_edges)
