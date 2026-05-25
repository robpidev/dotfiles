-- === Application Launchers ===
hl.bind(Mod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(Mod .. " + B", hl.dsp.exec_cmd("brave"))
hl.bind(Mod .. " + SUPER_L", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))
hl.bind(Mod .. " + V", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher clipboard"))
hl.bind(Mod .. " + SHIFT + semicolon", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher calculator"))
hl.bind(Mod .. " + semicolon", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher emoji"))
hl.bind(Mod .. " + E", hl.dsp.exec_cmd("thunar"))

-- === Noctalia ===
hl.bind(Mod .. " + X", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call sessionMenu toggle"))

-- === Screenshots ===
hl.bind(Mod .. " + S", hl.dsp.exec_cmd("grimblast copysave area"))
hl.bind("XF86Launch1", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("CTRL + XF86Launch1", hl.dsp.exec_cmd("grimblast copy screen"))
hl.bind("ALT + XF86Launch1", hl.dsp.exec_cmd("grimblast copy active"))
hl.bind("Print", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grimblast copy screen"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("grimblast copy active"))

-- === AI Assistant ===
hl.bind(Mod .. " + A", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call plugin:assistant-panel toggle"))
