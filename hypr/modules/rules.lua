-- ==================
-- WINDOW RULES
-- ==================
hl.workspace_rule({
  workspace   = "8",
  layout      = "scrolling",
  layout_opts = { direction = "right" },
})

hl.window_rule({
  match = { class = "^(xdg-desktop-portal.*)$" },
  float = true,
})
hl.window_rule({
  match = { initial_title = "^(Untitled.*)$" },
  float = true,
})
hl.window_rule({
  match = { class = "thunar" },
  float = true,
  size  = "1000 600",
})
hl.window_rule({
  match = { class = "mpv" },
  float = true,
  size  = "720 405",
})

-- Special workspaces
hl.workspace_rule({ workspace = "special:communication", gaps_out = 80, gaps_in = 40 })
hl.workspace_rule({ workspace = "special:multimedia", gaps_out = 80, gaps_in = 40 })
hl.workspace_rule({ workspace = "special:apps", gaps_out = 80, gaps_in = 40 })

hl.window_rule({
  match     = { title = "WhatsApp Web" },
  workspace = "special:communication",
})
hl.window_rule({
  match     = { title = "Telegram.*" },
  workspace = "special:communication",
})
hl.window_rule({
  match     = { initial_title = "YouTube.*" },
  workspace = "special:multimedia",
})

-- ==================
-- LAYER RULES
-- ==================
hl.layer_rule({ match = { namespace = "^noctalia-.*" }, blur = true })
hl.layer_rule({ match = { namespace = "^noctalia-.*" }, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = "^noctalia-region.*" }, ignore_alpha = 1 })
hl.layer_rule({ match = { namespace = "^noctalia-ann.*" }, ignore_alpha = 1 })
hl.layer_rule({ match = { namespace = "^noctalia-mea.*" }, ignore_alpha = 1 })
