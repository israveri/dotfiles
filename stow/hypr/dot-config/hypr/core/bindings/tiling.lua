-- Window management
hl.bind("SUPER + P",           hl.dsp.exec_cmd("hyprctl dispatch pin"))
hl.bind("SUPER + F",           hl.dsp.window.fullscreen())
hl.bind("SUPER + V",           hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + Z",           hl.dsp.window.fullscreen({ mode = 1 }))

-- Move focus
hl.bind("SUPER + left",        hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + right",       hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + up",          hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + down",        hl.dsp.focus({ direction = "d" }))

-- Move windows
hl.bind("SUPER + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))

-- Workspace navigation
hl.bind("SUPER + CTRL + left",  hl.dsp.focus({ workspace = "-1" }))
hl.bind("SUPER + CTRL + right", hl.dsp.focus({ workspace = "+1" }))
hl.bind("ALT + tab",            hl.dsp.focus({ window = "next" }))
hl.bind("ALT + tab",            hl.dsp.window.bring_to_top())

-- Switch workspaces (loop replaces 10 repetitive binds)
for i = 1, 9 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
end
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

-- Move window to workspace
for i = 1, 9 do
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Scroll through workspaces
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize with mouse
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
