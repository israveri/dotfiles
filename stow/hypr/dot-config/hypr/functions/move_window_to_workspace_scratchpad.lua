local function f()
    local workspace = hl.get_active_workspace()

    if workspace ~= nil then
        hl.dispatch(hl.dsp.window.move({ workspace = "special:" .. tostring(workspace.id) }))
    end
end

return f
