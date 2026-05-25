-- === Workspace Navigation ===
hl.bind(Mod .. " + Page_Down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Mod .. " + Page_Up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(Mod .. " + U", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Mod .. " + I", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(Mod .. " + CTRL + down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(Mod .. " + CTRL + up", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(Mod .. " + CTRL + U", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(Mod .. " + CTRL + I", hl.dsp.window.move({ workspace = "e-1" }))

-- === Special Workspaces ===
hl.bind(Mod .. " + M", hl.dsp.workspace.toggle_special("communication"))
hl.bind(Mod .. " + P", hl.dsp.workspace.toggle_special("multimedia"))
hl.bind(Mod .. " + O", hl.dsp.workspace.toggle_special("apps"))

hl.bind(Mod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:communication" }))
hl.bind(Mod .. " + SHIFT + P", hl.dsp.window.move({ workspace = "special:multimedia" }))
hl.bind(Mod .. " + SHIFT + O", hl.dsp.window.move({ workspace = "special:apps" }))

-- === Move window to workspace ===
hl.bind(Mod .. " + SHIFT + Page_Down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(Mod .. " + SHIFT + Page_Up", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(Mod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(Mod .. " + SHIFT + I", hl.dsp.window.move({ workspace = "e-1" }))

-- === Mouse Wheel Navigation ===
hl.bind(Mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(Mod .. " + CTRL + mouse_down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(Mod .. " + CTRL + mouse_up", hl.dsp.window.move({ workspace = "e-1" }))

-- === Numbered Workspace Navigation ===
for i = 1, 9 do
  hl.bind(Mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(Mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(Mod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(Mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
