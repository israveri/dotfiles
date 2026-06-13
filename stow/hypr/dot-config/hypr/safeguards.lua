---- Reload manually on demand
hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd("hyprctl reload"))

---- Basic Movement
hl.bind("SUPER + CTRL + right", hl.dsp.focus({ workspace = "r+1" }))
hl.bind("SUPER + CTRL + left",  hl.dsp.focus({ workspace = "r-1" }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))
for i = 1, 9 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
end
