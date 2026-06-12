local M = {}

local config = {
    walk = { style = "slide", speed = 3, curve = "default", },
    jump_to = { style = "fade", speed = 3, curve = "default", },
    jump_n = { style = "slide", speed = 3, curve = "default", },
}

function M.setup(opts)
    for k, v in pairs(opts) do
        config[k] = v
    end
end

local function set_animations(config)
    hl.animation({ leaf = "workspaces", enabled = true, speed = config.speed, bezier = config.curve, style = config.style })
    hl.animation({ leaf = "workspacesIn", enabled = true, speed = config.speed, bezier = config.curve, style = config.style })
    hl.animation({ leaf = "workspacesOut", enabled = true, speed = config.speed, bezier = config.curve, style = config.style })
end

function M.walk(direction)
    set_animations(config.walk)
    hl.dispatch(hl.dsp.focus({ workspace = direction == "right" and "r+1" or "r-1" }))
end

function M.jump_n(direction)
    set_animations(config.jump_n)
    hl.dispatch(hl.dsp.focus({ workspace = direction == "up" and "r+10" or "r-10" }))
end

function M.jump_to(target)
    set_animations(config.jump_to)
    hl.dispatch(hl.dsp.focus({ workspace = target }))
end

return M
