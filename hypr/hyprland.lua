-- Hyprland Configuration (Lua)
-- Migrado desde hyprlang a Lua para Hyprland 0.55+
-- https://wiki.hypr.land/Configuring/

-- ==================
-- MONITOR CONFIG
-- ==================
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1,
})

-- ==================
-- ENVIRONMENT VARS
-- ==================
hl.env("XCURSOR_THEME", "Sweet-cursors")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Sweet-Dark-v40")
hl.env("GTK_FONT_NAME", "Inter 13")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_QPA_PLATFORMTHEME_QT6", "gtk3")
hl.env("TERMINAL", "kitty")


-- ==================
-- STARTUP APPS
-- ==================
-- hl.exec_once("qs -c noctalia-shell")
-- hl.exec_once("/usr/lib/mate-polkit/polkit-mate-authentication-agent-1")
hl.on("hyprland.start", function()
  hl.exec_cmd("qs -c noctalia-shell")
  hl.exec_cmd("/usr/lib/mate-polkit/polkit-mate-authentication-agent-1")
  hl.exec_cmd("asusctl profile set Balanced")
end)



-- ==================
-- INPUT CONFIG
-- ==================
hl.config({
  input = {
    kb_layout          = "us",
    numlock_by_default = true,
    follow_mouse       = 1,
    touchpad           = {
      natural_scroll = true,
    },
  },
})




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


-- ==================
-- ANIMATIONS
-- ==================
hl.config({
  animations = {
    enabled = true,
  },
})
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "default" })
-- hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "workspaces", style = "slidefadevert", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "default", style = "slidefadevert 80%" })


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

-- ==================
-- LAYOUTS
-- ==================
hl.config({
  dwindle = {
    -- preserve_split = true,
  },
  master = {
    mfact = 0.5,
  },
})


-- ==================
-- MISC
-- ==================
hl.config({
  misc = {
    disable_hyprland_logo    = true,
    disable_splash_rendering = true,
    vrr                      = 1,
  },
})


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


-- ==================
-- KEYBINDINGS
-- ==================
local mod = "SUPER"


-- === Tabas ===

hl.bind(mod .. " + G", hl.dsp.group.toggle())         -- crear/disolver grupo
hl.bind(mod .. " + tab", hl.dsp.group.next())         -- siguiente tab
hl.bind(mod .. " + SHIFT + tab", hl.dsp.group.prev()) -- tab anterior
hl.bind(mod .. " + L", hl.dsp.group.lock())           -- bloquear grupo (no entran más ventanas)

-- Mover ventana activa al grupo de la dirección
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l", group = true }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r", group = true }))

-- === Application Launchers ===
hl.bind(mod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("brave"))
hl.bind(mod .. " + SUPER_L", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher clipboard"))
hl.bind(mod .. " + SHIFT + semicolon", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher calculator"))
hl.bind(mod .. " + semicolon", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher emoji"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("thunar"))

-- === Noctalia ===
hl.bind(mod .. " + X", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call sessionMenu toggle"))

-- === Security ===
hl.bind(mod .. " + ALT + L", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call sessionMenu lockAndSuspend"))
hl.bind(mod .. " + SHIFT + E", hl.dsp.exit())

-- === Audio Controls ===
hl.bind("+ XF86AudioRaiseVolume", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume increase"), { repeat_ = true })
hl.bind("+ XF86AudioLowerVolume", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume decrease"), { repeat_ = true })
hl.bind("+ XF86AudioMicMute", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume muteInput"), { locked = true })

-- === Brightness Controls ===
hl.bind("+ XF86MonBrightnessUp", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call brightness increase"), { repeat_ = true })
hl.bind("+ XF86MonBrightnessDown", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call brightness decrease"),
  { repeat_ = true })

-- === Window Management ===
hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mod .. " + Space", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mod .. " + W", hl.dsp.group.toggle())

-- === Focus Navigation ===
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "d" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "r" }))

-- === Window Movement ===
hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- === Monitor Navigation ===
hl.bind(mod .. " + CTRL + left", hl.dsp.focus({ monitor = "l" }))
hl.bind(mod .. " + CTRL + right", hl.dsp.focus({ monitor = "r" }))
hl.bind(mod .. " + CTRL + H", hl.dsp.focus({ monitor = "l" }))
hl.bind(mod .. " + CTRL + J", hl.dsp.focus({ monitor = "d" }))
hl.bind(mod .. " + CTRL + K", hl.dsp.focus({ monitor = "u" }))
hl.bind(mod .. " + CTRL + L", hl.dsp.focus({ monitor = "r" }))

-- === Move to Monitor ===
hl.bind(mod .. " + SHIFT + CTRL + left", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mod .. " + SHIFT + CTRL + down", hl.dsp.window.move({ monitor = "d" }))
hl.bind(mod .. " + SHIFT + CTRL + up", hl.dsp.window.move({ monitor = "u" }))
hl.bind(mod .. " + SHIFT + CTRL + right", hl.dsp.window.move({ monitor = "r" }))
hl.bind(mod .. " + SHIFT + CTRL + H", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mod .. " + SHIFT + CTRL + J", hl.dsp.window.move({ monitor = "d" }))
hl.bind(mod .. " + SHIFT + CTRL + K", hl.dsp.window.move({ monitor = "u" }))
hl.bind(mod .. " + SHIFT + CTRL + L", hl.dsp.window.move({ monitor = "r" }))

-- === Workspace Navigation ===
hl.bind(mod .. " + Page_Down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + Page_Up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + U", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + I", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mod .. " + CTRL + down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mod .. " + CTRL + up", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mod .. " + CTRL + U", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mod .. " + CTRL + I", hl.dsp.window.move({ workspace = "e-1" }))

-- === Special Workspaces ===
hl.bind(mod .. " + M", hl.dsp.workspace.toggle_special("communication"))
hl.bind(mod .. " + P", hl.dsp.workspace.toggle_special("multimedia"))
hl.bind(mod .. " + O", hl.dsp.workspace.toggle_special("apps"))

hl.bind(mod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:communication" }))
hl.bind(mod .. " + SHIFT + P", hl.dsp.window.move({ workspace = "special:multimedia" }))
hl.bind(mod .. " + SHIFT + O", hl.dsp.window.move({ workspace = "special:apps" }))

-- === Move window to workspace ===
hl.bind(mod .. " + SHIFT + Page_Down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mod .. " + SHIFT + Page_Up", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mod .. " + SHIFT + I", hl.dsp.window.move({ workspace = "e-1" }))

-- === Mouse Wheel Navigation ===
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + CTRL + mouse_down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mod .. " + CTRL + mouse_up", hl.dsp.window.move({ workspace = "e-1" })) -- === Numbered Workspaces ===

-- === Numbered Workspace Navigation ===
for i = 1, 9 do
  hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- === Layout Messages ===
hl.bind(mod .. " + bracketleft", hl.dsp.layout("preselect l"))
hl.bind(mod .. " + bracketright", hl.dsp.layout("preselect r"))
hl.bind(mod .. " + R", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + CTRL + F", hl.dsp.window.fullscreen())

-- === Mouse binds ===
hl.bind(mod .. " + ALT + mouse:272", hl.dsp.window.float({ action = "toggle" }), { mouse = true })
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- === Resize ===
-- hl.bind(mod .. " + code:20", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -100 0"), { repeating = true })
-- hl.bind(mod .. " + code:21", hl.dsp.exec_cmd("hyprctl dispatch resizeactive  100 0"), { repeating = true })
hl.bind("ALT + R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
  -- Set repeating binds for resizing the active window.
  hl.bind("L", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
  hl.bind("H", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
  hl.bind("J", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
  hl.gesture({ fingers = 3, direction = "swipe", action = "resize", scale = 2.5 })

  -- Use `reset` to go back to the global submap
  hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(mod .. " + minus", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + equal", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + SHIFT + minus", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -10%"), { repeating = true })
hl.bind(mod .. " + SHIFT + equal", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 10%"), { repeating = true })

-- === Screenshots ===
hl.bind(mod .. " + S", hl.dsp.exec_cmd("grimblast copysave area"))
hl.bind("XF86Launch1", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("CTRL + XF86Launch1", hl.dsp.exec_cmd("grimblast copy screen"))
hl.bind("ALT + XF86Launch1", hl.dsp.exec_cmd("grimblast copy active"))
hl.bind("Print", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grimblast copy screen"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("grimblast copy active"))

-- === AI Assistant ===
hl.bind(mod .. " + A", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call plugin:assistant-panel toggle"))

-- === Keyboard Layout Toggle ===
-- hl.bind(mod .. " + ALT + Space", hl.dsp.exec_cmd("~/.local/bin/toggle-kb.sh"))
-- hl.bind(mod .. " + SHIFT + Space", hl.dsp.exec_cmd("hyprctl switchxkblayout current next"))
hl.bind(mod .. " + SHIFT + Space", function()
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
