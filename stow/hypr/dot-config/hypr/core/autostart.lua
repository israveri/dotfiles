hl.on("hyprland.start", function ()
    -- Starts Noctalia v5
    hl.exec_cmd("uwsm app -- noctalia")

    -- Start clipboard history manager
    hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")

    -- Csakura "wallpaper"
    hl.exec_cmd("uwsm app -- kitten panel --edge 'center' --layer 'bottom' --output-name 'DP-2' csakura -f 10 -p 3 -c $(shuf -e sakura rose blush magenta peach coral sunset gold lavender violet sky mint matcha white ink -n 1)")

    -- Allows xdg-desktop-portal-hyprland to be called when needed
    -- Keep at the bottom
    hl.exec_cmd("uwsm app -- dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
