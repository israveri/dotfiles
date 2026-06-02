-- Core
hl.bind("SUPER + RETURN",       hl.dsp.exec_cmd("uwsm app -- " .. Programs.terminal),    { description = "Open Terminal" })
hl.bind("SUPER + B",            hl.dsp.exec_cmd("uwsm app -- " .. Programs.browser),     { description = "Open Browser" })
hl.bind("SUPER + Q",            hl.dsp.window.close(),                                    { description = "Close active window" })
hl.bind("SUPER + SHIFT + M",    hl.dsp.exit(),                                            { description = "Close Hyprland" })
hl.bind("SUPER + E",            hl.dsp.exec_cmd("uwsm app -- " .. Programs.fileManager), { description = "Open File Explorer" })
hl.bind("SUPER + Tab",          hl.dsp.exec_cmd("qs ipc -c overview call overview toggle"), { description = "Overview" })

-- Screenshot
hl.bind("SUPER + F12",          hl.dsp.exec_cmd("uwsm app -- humbleshot screen"), { description = "Take screenshot" })
hl.bind("SUPER + SHIFT + S",    hl.dsp.exec_cmd("uwsm app -- humbleshot"),        { description = "Take screenshot of selected region" })

-- Mission Center
hl.bind("SUPER + SHIFT + ESCAPE", hl.dsp.exec_cmd("uwsm app -- missioncenter"), { description = "Open Mission Center" })
