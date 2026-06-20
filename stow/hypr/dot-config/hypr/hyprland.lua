-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Default programs. Can be referenced in any required file as Programs._key_
require("hyprplug").load()

require("core.base")
require("core.autostart")
require("core.monitors")
require("core.rules")
require("core.inputs")
require("core.bindings")
require("core.layout")
require("core.workspace")
require("core.looknfeel")
require("core.animations")

-- For Noctalia Color templates
require("noctalia")
