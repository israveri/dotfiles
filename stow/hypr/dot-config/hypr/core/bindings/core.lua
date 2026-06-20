-- Core
hl.bind("SUPER + RETURN",           hl.dsp.exec_cmd("uwsm app -- kitty"),   { description = "Open Terminal" })
hl.bind("SUPER + B",                hl.dsp.exec_cmd("uwsm app -- firefox"), { description = "Open Browser" })
hl.bind("SUPER + E",                hl.dsp.exec_cmd("uwsm app -- thunar"),  { description = "Open File Explorer" })
hl.bind("SUPER + Q",                hl.dsp.window.close(),                                    { description = "Close active window" })
hl.bind("SUPER + CTRL + SHIFT + M", hl.dsp.exit(),                                            { description = "Close Hyprland" })

-- Screenshot
hl.bind("SUPER + F12",          hl.dsp.exec_cmd("uwsm app -- noctalia msg screenshot-fullscreen"), { description = "Take screenshot" })
hl.bind("SUPER + SHIFT + S",    hl.dsp.exec_cmd("uwsm app -- noctalia msg screenshot-region"),        { description = "Take screenshot of selected region" })

-- Mission Center
hl.bind("SUPER + SHIFT + ESCAPE", hl.dsp.exec_cmd("uwsm app -- missioncenter"), { description = "Open Mission Center" })
