local apps = {
    browser = "firefox",
    file_manager = "thunar",
    terminal = "kitty",
}

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("uwsm app -- " .. apps.terminal),     { description = "Open Terminal" })
hl.bind("SUPER + B",      hl.dsp.exec_cmd("uwsm app -- " .. apps.browser),      { description = "Open Browser" })
hl.bind("SUPER + E",      hl.dsp.exec_cmd("uwsm app -- " .. apps.file_manager), { description = "Open File Explorer" })

-- Custom apps
hl.bind("SUPER + SHIFT + ESCAPE", hl.dsp.exec_cmd("uwsm app -- missioncenter"), { description = "Open Mission Center" })
