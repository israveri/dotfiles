-- Core
hl.bind("SUPER + Q",                hl.dsp.window.close(), { description = "Close active window" })
hl.bind("SUPER + CTRL + SHIFT + M", hl.dsp.exit(),         { description = "Close Hyprland" })

-- Screenshot
hl.bind("SUPER + F12",       hl.dsp.exec_cmd("uwsm app -- noctalia msg screenshot-fullscreen"), { description = "Take screenshot" })
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("uwsm app -- noctalia msg screenshot-region"),     { description = "Take screenshot of selected region" })
