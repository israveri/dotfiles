-- Shell integration IPC target (set to "" to disable)
local ipc = "qs -c noctalia-shell ipc call"

hl.bind("SUPER + SPACE",  hl.dsp.exec_cmd(ipc .. " launcher toggle"),      { description = "Open Launcher" })
hl.bind("SUPER + period", hl.dsp.exec_cmd(ipc .. " controlCenter toggle"), { description = "Open Control Center" })
hl.bind("SUPER + L",      hl.dsp.exec_cmd(ipc .. " lockScreen lock"),      { description = "Lock Session" })
hl.bind("SUPER + comma",  hl.dsp.exec_cmd(ipc .. " settings toggle"),      { description = "Open Noctalia Settings" })
hl.bind("SUPER + A",      hl.dsp.exec_cmd("qs -c noctalia-shell ipc call plugin:assistant-panel toggle"), { description = "Open AI assistant" })
