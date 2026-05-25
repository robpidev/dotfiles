-- === Tabs ===
hl.bind(Mod .. " + G", hl.dsp.group.toggle())         -- crear/disolver grupo
hl.bind(Mod .. " + tab", hl.dsp.group.next())         -- siguiente tab
hl.bind(Mod .. " + SHIFT + tab", hl.dsp.group.prev()) -- tab anterior
hl.bind(Mod .. " + L", hl.dsp.group.lock())           -- bloquear grupo (no entran más ventanas)

-- Mover ventana activa al grupo de la dirección
hl.bind(Mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l", group = true }))
hl.bind(Mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r", group = true }))

-- === Window Management ===
hl.bind(Mod .. " + C", hl.dsp.window.close())
hl.bind(Mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(Mod .. " + Space", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(Mod .. " + W", hl.dsp.group.toggle())

-- === Focus Navigation ===
hl.bind(Mod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(Mod .. " + down", hl.dsp.focus({ direction = "d" }))
hl.bind(Mod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(Mod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(Mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(Mod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(Mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(Mod .. " + L", hl.dsp.focus({ direction = "r" }))

-- === Window Movement ===
hl.bind(Mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(Mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))
hl.bind(Mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(Mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(Mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(Mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(Mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(Mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- === Monitor Navigation ===
hl.bind(Mod .. " + CTRL + left", hl.dsp.focus({ monitor = "l" }))
hl.bind(Mod .. " + CTRL + right", hl.dsp.focus({ monitor = "r" }))
hl.bind(Mod .. " + CTRL + H", hl.dsp.focus({ monitor = "l" }))
hl.bind(Mod .. " + CTRL + J", hl.dsp.focus({ monitor = "d" }))
hl.bind(Mod .. " + CTRL + K", hl.dsp.focus({ monitor = "u" }))
hl.bind(Mod .. " + CTRL + L", hl.dsp.focus({ monitor = "r" }))

-- === Move to Monitor ===
hl.bind(Mod .. " + SHIFT + CTRL + left", hl.dsp.window.move({ monitor = "l" }))
hl.bind(Mod .. " + SHIFT + CTRL + down", hl.dsp.window.move({ monitor = "d" }))
hl.bind(Mod .. " + SHIFT + CTRL + up", hl.dsp.window.move({ monitor = "u" }))
hl.bind(Mod .. " + SHIFT + CTRL + right", hl.dsp.window.move({ monitor = "r" }))
hl.bind(Mod .. " + SHIFT + CTRL + H", hl.dsp.window.move({ monitor = "l" }))
hl.bind(Mod .. " + SHIFT + CTRL + J", hl.dsp.window.move({ monitor = "d" }))
hl.bind(Mod .. " + SHIFT + CTRL + K", hl.dsp.window.move({ monitor = "u" }))
hl.bind(Mod .. " + SHIFT + CTRL + L", hl.dsp.window.move({ monitor = "r" }))

-- === Mouse binds ===
hl.bind(Mod .. " + ALT + mouse:272", hl.dsp.window.float({ action = "toggle" }), { mouse = true })
hl.bind(Mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(Mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
