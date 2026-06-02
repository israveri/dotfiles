-- Noctalia region selector: disable animation for screenshot compatibility
-- See https://noctalia.dev/plugins/screen-shot-and-record/
hl.layer_rule({
    match    = { namespace = "noctalia-shell:regionSelector" },
    no_anim  = true,
})
