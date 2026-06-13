return {
    source = { path = "modules.gridwalk" },
    config = function(plug)
        plug.configure({
            linear = { style = "slide", speed = "2", curve = "default" },
            jump_to = { style = "fade", speed = "1", curve = "default" },
        })
    end,
    setup = function(plug)
        hl.bind("SUPER + CTRL + right", function() plug.walk("right") end)
        hl.bind("SUPER + CTRL + left",  function() plug.walk("left") end)

        for i = 1, 9 do
            hl.bind("SUPER + " .. i, function() plug.jump_to(i) end)
        end
        hl.bind("SUPER + 0", function() plug.jump_to(10) end)
    end
}
