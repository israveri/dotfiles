local configs = {
    walk_animation =    { style = "slide", enabled = true, speed = 3, curve = "easeOutBackSnappy", },
    jump_to_animation = { style = "fade", enabled = true, speed = 0.01, curve = "easeOutQuint", },

    walk_left_binding = "SUPER + CTRL + left",
    walk_right_binding = "SUPER + CTRL + right",

    jump_to_prefix_binding = "SUPER + ",
}

local function set_animations(c)
    hl.animation({ leaf = "workspaces", enabled = c.enabled, speed = c.speed, bezier = c.curve, style = c.style })
end

local walk = function(direction)
    set_animations(configs.walk_animation)
    hl.dispatch(hl.dsp.focus({ workspace = direction == "right" and "r+1" or "r-1" }))
end

local jump_to = function(target)
    set_animations(configs.jump_to_animation)
    hl.dispatch(hl.dsp.focus({ workspace = target }))
end


hl.bind(configs.walk_right_binding, function() walk("right") end)
hl.bind(configs.walk_left_binding,  function() walk("left") end)

for i = 1, 9 do
    hl.bind(configs.jump_to_prefix_binding .. i, function() jump_to(i) end)
end
hl.bind(configs.jump_to_prefix_binding .. "0", function() jump_to(10) end)
