-- === Security ===
hl.bind(Mod .. " + ALT + L", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call sessionMenu lockAndSuspend"))
hl.bind(Mod .. " + SHIFT + E", hl.dsp.exit())

-- === Audio Controls ===
hl.bind("+ XF86AudioRaiseVolume", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume increase"), { repeat_ = true })
hl.bind("+ XF86AudioLowerVolume", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume decrease"), { repeat_ = true })
hl.bind("+ XF86AudioMicMute", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume muteInput"), { locked = true })

-- === Brightness Controls ===
hl.bind("+ XF86MonBrightnessUp", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call brightness increase"), { repeat_ = true })
hl.bind("+ XF86MonBrightnessDown", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call brightness decrease"),
  { repeat_ = true })

-- === Layout Messages ===
hl.bind(Mod .. " + bracketleft", hl.dsp.layout("preselect l"))
hl.bind(Mod .. " + bracketright", hl.dsp.layout("preselect r"))
hl.bind(Mod .. " + R", hl.dsp.layout("togglesplit"))
hl.bind(Mod .. " + CTRL + F", hl.dsp.window.fullscreen())

-- === Resize ===
hl.bind("ALT + R", hl.dsp.submap("resize"))

hl.bind(Mod .. " + minus", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(Mod .. " + equal", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(Mod .. " + SHIFT + minus", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -10%"), { repeating = true })
hl.bind(Mod .. " + SHIFT + equal", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 10%"), { repeating = true })

-- === Resize Submap ===
hl.define_submap("resize", function()
  hl.bind("L", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
  hl.bind("H", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
  hl.bind("J", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
  hl.gesture({ fingers = 3, direction = "swipe", action = "resize", scale = 2.5 })
  hl.bind("escape", hl.dsp.submap("reset"))
end)

-- === Keyboard Layout Toggle ===
hl.bind(Mod .. " + SHIFT + Space", function()
  local current = hl.get_config("input.kb_variant")
  local next = current == "intl" and "" or "intl"
  hl.notification.create({
    text     = "current: " .. tostring(current) .. " | next: " .. tostring(next),
    duration = 5000,
    icon     = "ok"
  })
  hl.dispatch(
    hl.dsp.exec_cmd(
      'hyprctl eval \'hl.config({ input = { kb_layout = "us", kb_variant = "' .. next .. '" } })\''
    )
  )
end)
