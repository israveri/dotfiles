local M = {}

-- Default Values
local configs = {
    walk =    { style = "slide", enabled = true, speed = 1, curve = "linear", },
    jump_to = { style = "slide", enabled = true, speed = 1, curve = "linear", },
    jump_n =  { style = "slide", enabled = true, speed = 1, curve = "linear", },
}

function M.configure(opts)
    for k, v in pairs(opts) do
        if configs[k] and type(v) == "table" then
            for field, value in pairs(v) do
                configs[k][field] = value
            end
        else
            configs[k] = v
        end
    end
end

local function set_animations(c)
    hl.animation({ leaf = "workspaces", enabled = c.enabled, speed = c.speed, bezier = c.curve, style = c.style })
end

function M.walk(direction)
    set_animations(configs.walk)
    hl.dispatch(hl.dsp.focus({ workspace = direction == "right" and "r+1" or "r-1" }))
end

function M.jump_n(direction)
    set_animations(configs.jump_n)
    hl.dispatch(hl.dsp.focus({ workspace = direction == "up" and "r+10" or "r-10" }))
end

function M.jump_to(target)
    set_animations(configs.jump_to)
    hl.dispatch(hl.dsp.focus({ workspace = target }))
end

return M
