-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Default programs. Can be referenced in any required file as Programs._key_
Programs = {
    browser = "firefox",
    fileManager = "thunar",
    menu = "hyprlauncher",
    terminal = "kitty",
}

require("core.environment")
require("core.autostart")
require("core.monitors")
require("core.rules")
require("core.inputs")
require("core.bindings")
require("core.looknfeel")
require("core.layout")
require("core.workspace")
require("core.misc")
