return {
    source = { path = "modules/scolledging" },
    setup = function(plug)
        hl.on("window.active", plug.edge)
    end,
}
