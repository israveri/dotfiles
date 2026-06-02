hl.window_rule({
    name = "mission-center-float",
    match = { title = "^(Mission Center)$" },
    float = true,
    pin = true,
    opacity = "1.0 1.0 override",
    center = true,
    size = { 1789, 1006 }, -- 1600x900 * 1.25 scaling factor
})
