local function f()
    local workspace = hl.get_active_workspace()

    if workspace ~= nil then
        hl.dispatch(hl.dsp.workspace.toggle_special(workspace.id))
    end
end

return f
