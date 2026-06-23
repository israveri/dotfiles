Helpers = {}

Helpers.avoid_auto_focus_floating_window = function(window_title)
    hl.on("window.active", function(w)
        if w.title == "Picture-in-Picture" then
            for _, win in ipairs(hl.get_windows({ workspace = w.workspace.id })) do
                if win.title ~= "Picture-in-Picture" then
                    hl.dispatch(hl.dsp.focus({ window = win }))
                    return
                end
            end
        end
    end)

    hl.on("workspace.active", function(ws)
        local active_window = hl.get_active_window()

        if active_window ~= nil then
            if active_window.title == "Picture-in-Picture" then
                local windows = ws.get_windows(ws)
                for _, w in ipairs(windows) do
                    if w.title ~= "Picture-in-Picture" then
                        hl.dispatch(hl.dsp.focus({ window = w }))
                        return
                    end
                end
            end
        end
    end)
end
