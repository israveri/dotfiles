hl.monitor({ output = "DP-1", mode = "2560x1440@240.00Hz", position = "2560x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "2560x1440@144.00Hz", position = "0x0", scale = 1 })

-- Quick mirror setup for testing
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "0x0", scale = 1, mirror = "DP-1" })

-- Fallback for any new monitor
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

