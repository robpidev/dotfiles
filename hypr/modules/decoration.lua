-- ==================
-- DECORATION
-- ==================
hl.config({
  decoration = {
    rounding         = 7,
    rounding_power   = 4,

    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow           = {
      enabled      = true,
      range        = 30,
      render_power = 5,
      offset       = "0 5",
      color        = "rgba(00000070)",
    },

    blur             = {
      enabled           = true,
      size              = 10,
      passes            = 3,
      ignore_opacity    = false,
      new_optimizations = true,
      xray              = false,
      noise             = 0.02,
      contrast          = 1.1,
      vibrancy          = 0.2,
      vibrancy_darkness = 0.3,
    },
  },
})
