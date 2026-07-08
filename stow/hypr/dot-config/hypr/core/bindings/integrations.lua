-- Noctalia integration
local ipc = "noctalia msg"

-- Core binds
hl.bind("SUPER + Space",  hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind("SUPER + period", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind("SUPER + comma",  hl.dsp.exec_cmd(ipc .. " settings-toggle"))

