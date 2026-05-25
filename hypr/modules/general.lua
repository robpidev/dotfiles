-- ==================
-- GENERAL LAYOUT
-- ==================
hl.config({
  general = {
    gaps_in     = 1,
    gaps_out    = {
      right = 2,
    },
    border_size = 2,
    col         = {
      active_border   = { colors = { "rgba(7c4dffcc)", "rgba(009688cc)" }, angle = 45 },
      inactive_border = { colors = { "rgba(7c4dff55)", "rgba(00968855)" }, angle = 90 },
    },
    -- layout      = "scrolling",
  },
  scrolling = {
    follow_focus = true,
  }
})

-- =================
-- Tabs (Groups)
-- =================
hl.config({
  group = {
    groupbar = {
      enabled = true,
      stacked = false,
      render_titles = false,
      font_size = 12,
      gradients = true,
      height = 1,
      blur = true
    },
    auto_group = true
  }
})
