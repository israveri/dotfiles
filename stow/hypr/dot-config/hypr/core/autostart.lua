hl.on("hyprland.start", function ()
    -- Starts Noctalia v5
    hl.exec_cmd("uwsm app -- noctalia")

    -- Start clipboard history manager
    hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")

    -- Allows xdg-desktop-portal-hyprland to be called when needed
    -- Keep at the bottom
    hl.exec_cmd("uwsm app -- dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
