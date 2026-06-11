local function f(w)
    if w == nil 
        or w.floating
        or w.layout == nil
        or w.workspace == nil
        or w.layout.name ~= "scrolling"
        or w.layout.column == nil then

        return
    end

    local max_idx = 0
    local col_idx = w.layout.column.index

    for _, win in ipairs(hl.get_windows()) do
        if not win.floating
            and win.workspace ~= nil
            and win.workspace.id == w.workspace.id
            and win.layout ~= nil
            and win.layout.name == "scrolling"
            and win.layout.column ~= nil then

            if win.layout.column.index > max_idx then
                max_idx = win.layout.column.index
            end
        end
    end

    if col_idx > 0 and col_idx ~= max_idx then
        hl.config({ scrolling = { focus_fit_method = 0 } })
    else
        hl.config({ scrolling = { focus_fit_method = 1 } })
    end

    local cursor = hl.get_cursor_pos()
    if cursor ~= nil then
        hl.dispatch(hl.dsp.layout("focus l"))
        hl.dispatch(hl.dsp.layout("focus r"))
        hl.dispatch(hl.dsp.cursor.move({
            x = cursor.x,
            y = cursor.y
        }))
    end
end

return f
