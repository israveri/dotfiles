hl.window_rule({
    name   = "steam-settings",
    match  = { class = "steam", title = "^(Steam Settings)$" },
    float  = true,
    center = true,
    size   = { 900, 1100 },
})

hl.window_rule({
    name   = "steam-friends",
    match  = { class = "steam", title = "^(Friends List)$" },
    float  = true,
    center = true,
    size   = { 1200, 900 },
})
