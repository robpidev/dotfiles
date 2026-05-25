-- ==================
-- Gestures
-- ==================
hl.gesture({ fingers = 3, direction = "vertical", action = "workspace", scale = 2.5 })
hl.gesture({ fingers = 3, direction = "horizontal", action = "scroll_move", scale = 1.5 })
hl.gesture({ fingers = 4, direction = "horizontal", action = "resize", scale = 3 })

hl.gesture({
  fingers = 3,
  direction = "swipe",
  mods = "ALT",
  action = "move",
  scale = 2.5
})
