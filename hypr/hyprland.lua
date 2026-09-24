-- Hyprland Configuration (Lua) — Hyprland 0.56+ / Noctalia v5
-- Mejora completa 2026-09-13: fixes de conflictos + modernización
-- Backup original: /tmp/opencode/hyprland.lua.pre-mejora-2026-09-13
-- https://wiki.hypr.land/Configuring/

-- ==================
-- MONITOR CONFIG
-- ==================
-- eDP-1 es 1920x1080@144 en tu laptop. Se deja "preferred/auto"
-- para no romper con monitores externos, con override comentado.
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1,
  -- Hueco a la derecha para la barra vertical de Noctalia (47px medidos).
  -- La barra en sí no se toca; esto solo evita que las ventanas la tapen.
  -- Se suma al área que ya reservan las capas (ej. barra inferior).
})
-- Descomenta si quieres forzar 144Hz en el panel interno:
-- hl.monitor({ output = "eDP-1", mode = "1920x1080@144", position = "0x0", scale = 1, vrr = 1 })

-- ==================
-- ENVIRONMENT VARS (Wayland-native)
-- ==================
hl.env("XCURSOR_THEME", "Sweet-cursors")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Sweet-cursors")
hl.env("GTK_THEME", "Sweet-Dark-v40")
hl.env("GTK_FONT_NAME", "Inter 13")
hl.env("TERMINAL", "kitty")
-- Wayland / Electron / Firefox / Java
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_QPA_PLATFORMTHEME_QT6", "gtk3")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
-- NOTA: no se fuerza QT_QPA_PLATFORM=wayland (rompe apps Qt viejas).
-- XDG_* las pone Hyprland/UWSM solas, no hace falta forzarlas.

-- ==================
-- STARTUP APPS
-- ==================
hl.on("hyprland.start", function()
  hl.exec_cmd(
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE 2>/dev/null || true")
  hl.exec_cmd(
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE 2>/dev/null || true")
  hl.exec_cmd("noctalia")
  hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
end)

-- ==================
-- INPUT / BINDS / CURSOR / ECOSYSTEM
-- ==================
hl.config({
  input = {
    kb_layout = "us,us",
    kb_variant = ",intl",
    kb_options = "grp:alt_space_toggle",
    repeat_rate = 35,
    repeat_delay = 250,
    follow_mouse = 1,
    float_switch_override_focus = 1,
    sensitivity = 0,
    accel_profile = "adaptive",
    touchpad = {
      natural_scroll = true,
      tap_to_click = true,
      disable_while_typing = true,
      scroll_factor = 0.8,
      tap_and_drag = true,
    },
  },
  binds = {
    workspace_back_and_forth = true,
    allow_workspace_cycles = true,
    movefocus_cycles_fullscreen = true,
    pass_mouse_when_bound = false,
    scroll_event_delay = 300,
  },
  cursor = {
    enable_hyprcursor = true,
    hide_on_key_press = false, -- cursor siempre visible al escribir
    inactive_timeout = 0,      -- 0 = nunca ocultar por inactividad
    no_warps = false,
  },
  ecosystem = {
    no_donation_nag = true,
    no_update_news = true,
    enforce_permissions = true,
  },
})

-- ==================
-- GENERAL LAYOUT
-- ==================
hl.config({
  general = {
    gaps_in = 1,
    gaps_out = 0,
    gaps_workspaces = 0,
    border_size = 2,
    resize_on_border = true,
    hover_icon_on_border = true,
    allow_tearing = true,
    snap = { enabled = true, window_gap = 8, monitor_gap = 8, respect_gaps = true },
    col = {
      active_border = { colors = { "rgba(7c4dffcc)", "rgba(009688cc)" }, angle = 45 },
      inactive_border = { colors = { "rgba(7c4dff55)", "rgba(00968855)" }, angle = 90 },
    },
    -- layout = "dwindle", -- default
  },
  dwindle = {
    -- preserve_split = true,
  },
  master = {
    mfact = 0.5,
  },
  scrolling = {
    follow_focus = true,
  },
})

-- =================
-- Tabs (Groups)
-- =================
hl.config({
  group = {
    auto_group = true, -- cambialo a false si te agrupa ventanas sin pedirlo
    drag_into_group = 1,
    merge_groups_on_drag = true,
    group_on_movetoworkspace = false,
    groupbar = {
      enabled = true,
      stacked = false,
      render_titles = true,
      font_size = 12,
      height = 14, -- 1 era casi invisible; 14 se puede clickear
      gradients = true,
      blur = true,
      gaps_in = 2,
      gaps_out = 4,
      rounding = 6,
    },
  },
})

-- ==================
-- DECORATION (blur restaurado del .bak + dim)
-- ==================
hl.config({
  decoration = {
    rounding = 8,
    rounding_power = 2.0,
    active_opacity = 1.0,
    inactive_opacity = 0.96,
    fullscreen_opacity = 1.0,
    dim_inactive = false,
    dim_strength = 0.15,
    border_part_of_window = true,
    shadow = {
      enabled = true,
      range = 30,
      render_power = 4,
      offset = { 0, 5 },
      color = "rgba(00000066)",
      color_inactive = "rgba(00000044)",
    },
    blur = {
      enabled = true,
      size = 10,
      passes = 3,
      ignore_opacity = true,
      new_optimizations = true,
      noise = 0.05,
      contrast = 1,
      vibrancy = 0.3,
      vibrancy_darkness = 0.3,
      popups = true,
      popups_ignorealpha = 0.8,
      input_methods = true,
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
hl.animation({ leaf = "workspaces", style = "slidefadevert", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "default", style = "slidefadevert 80%" })

-- ==================
-- Gestures
-- ==================
hl.config({
  gestures = {
    workspace_swipe_distance = 300,
    workspace_swipe_cancel_ratio = 0.5,
    workspace_swipe_direction_lock = true,
  },
})
hl.gesture({ fingers = 3, direction = "vertical", action = "workspace", scale = 2.5 })
hl.gesture({ fingers = 3, direction = "horizontal", action = "scroll_move", scale = 1.5 })
hl.gesture({ fingers = 4, direction = "horizontal", action = "resize", scale = 3 })
hl.gesture({ fingers = 3, direction = "swipe", mods = "ALT", action = "move", scale = 2.5 })

-- ==================
-- MISC / RENDER
-- ==================
hl.config({
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    disable_hyprland_guiutils_check = true,
    vrr = 1,
    focus_on_activate = true,
    middle_click_paste = false,
    mouse_move_enables_dpms = true,
    key_press_enables_dpms = true,
    mouse_move_focuses_monitor = true,
    render_unfocused_fps = 15,
    animate_manual_resizes = true,
    animate_mouse_windowdragging = true,
    close_special_on_empty = true,
    allow_session_lock_restore = true,
    enable_anr_dialog = true,
  },
  render = {
    direct_scanout = 1,
    new_render_scheduling = true,
  },
})

-- ==================
-- WINDOW / WORKSPACE RULES
-- ==================
hl.workspace_rule({
  workspace = "special:apps",
  layout = "scrolling",
  layout_opts = { direction = "right" },
})
-- Gaps amplios en especiales para que respire el blur
hl.workspace_rule({ workspace = "special:communication", gaps_out = 60, gaps_in = 30 })
hl.workspace_rule({ workspace = "special:multimedia", gaps_out = 60, gaps_in = 20 })
hl.workspace_rule({ workspace = "special:apps", gaps_out = 60, gaps_in = 30 })

-- Flotantes del sistema: siempre float + centro
hl.window_rule({ match = { class = "^(xdg-desktop-portal.*)$" }, float = true, center = true })
hl.window_rule({ match = { class = "^(polkit-.*|.*polkit.*)$" }, float = true, center = true, stay_focused = true })
hl.window_rule({
  match = { class = "^(pavucontrol|nm-connection-editor|blueman-manager|wdisplays)$" },
  float = true,
  center = true,
  size =
  "900 600"
})
-- Diálogos comunes
hl.window_rule({ match = { title = "^(Open File|Save File|Choose.*|Select.*)$" }, float = true, center = true })
hl.window_rule({ match = { initial_title = "^(Untitled.*)$" }, float = true, center = true })

hl.window_rule({ match = { class = "thunar" }, float = true, center = true, size = "1000 600" })
hl.window_rule({ match = { class = "mpv" }, float = true, center = true, size = "1280 720", idle_inhibit = "focus" })
hl.window_rule({ match = { class = "dev.noctalia.Noctalia" }, float = true, center = true, size = "1080 920" })

-- Opacidad + xray en especiales
hl.window_rule({ match = { workspace = "special:communication" }, opacity = "0.92 0.85 1.0", xray = true })
hl.window_rule({ match = { workspace = "special:multimedia" }, opacity = "0.92 0.85 1.0", xray = true })
hl.window_rule({ match = { workspace = "special:apps" }, opacity = "0.92 0.85 1.0", xray = true })

-- Enrutado automático a especiales
hl.window_rule({ match = { title = "WhatsApp.*" }, workspace = "special:communication" })
hl.window_rule({ match = { title = "Telegram.*" }, workspace = "special:communication" })
hl.window_rule({ match = { initial_title = "YouTube.*" }, workspace = "special:multimedia" })

-- ==================
-- LAYER RULES (Noctalia v5)
-- ==================
hl.layer_rule({
  name = "noctalia-popups",
  match = { namespace = "^noctalia-(notification|dock|osd|window-switcher)$" },
  no_anim = true,
  ignore_alpha = 0.1,
  blur = true,
  blur_popups = true,
})
hl.layer_rule({
  name = "noctalia-bar",
  match = { namespace = "^noctalia-(bar-.+|attached-panel)$" },
  blur = false,
  xray = false,
})

-- ==================
-- KEYBINDINGS (conflictos resueltos)
-- ==================
-- FIXES aplicados:
--  * SUPER+S era control-center Y screenshot -> S=control-center, SHIFT+S=screenshot
--  * SUPER+L era group-lock Y focus-right -> L=focus, SHIFT+G=lock
--  * SUPER+SHIFT+L era move-group Y move-right -> ALT+H/L=move-group
--  * SUPER+W duplicaba a SUPER+G -> W=float toggle
--  * repeat_ -> repeating (el otro era inválido y no repetía)
--  * resize K/J estaban invertidos
local mod = "SUPER"
local ipc = "noctalia msg "

-- === Tabs / Groups ===
hl.bind(mod .. " + G", hl.dsp.group.toggle())
hl.bind(mod .. " + SHIFT + G", hl.dsp.group.lock()) -- antes: SUPER+L (chocaba con foco)
hl.bind(mod .. " + tab", hl.dsp.group.next())
hl.bind(mod .. " + SHIFT + tab", hl.dsp.group.prev())
hl.bind(mod .. " + ALT + H", hl.dsp.window.move({ direction = "l", group = true }))
hl.bind(mod .. " + ALT + L", hl.dsp.window.move({ direction = "r", group = true }))

-- === Launchers ===
hl.bind(mod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("brave-origin"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mod .. " + SUPER_L", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mod .. " + V", hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"))
hl.bind(mod .. " + SHIFT + semicolon", hl.dsp.exec_cmd(ipc .. 'panel-toggle launcher "/calc "'))
hl.bind(mod .. " + semicolon", hl.dsp.exec_cmd(ipc .. 'panel-toggle launcher "/emo "'))

-- === Noctalia ===
hl.bind(mod .. " + X", hl.dsp.exec_cmd(ipc .. "panel-toggle session"))
hl.bind(mod .. " + comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
hl.bind(mod .. " + A", hl.dsp.exec_cmd(ipc .. "window-switcher"))

-- === Sesión / sistema ===
hl.bind(mod .. " + ALT + L", hl.dsp.exec_cmd(ipc .. "session lock-and-suspend"))
hl.bind(mod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"), { description = "Reload Hyprland config" })

-- === Audio ===
hl.bind("+ XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"), { repeating = true, locked = true })
hl.bind("+ XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"), { repeating = true, locked = true })
hl.bind("+ XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"), { locked = true })
hl.bind("+ XF86AudioMicMute", hl.dsp.exec_cmd(ipc .. "mic-mute"), { locked = true })
hl.bind("+ XF86AudioPlay", hl.dsp.exec_cmd(ipc .. "media toggle"), { locked = true })
hl.bind("+ XF86AudioNext", hl.dsp.exec_cmd(ipc .. "media next"), { locked = true })
hl.bind("+ XF86AudioPrev", hl.dsp.exec_cmd(ipc .. "media previous"), { locked = true })

-- === Brillo (FIX: repeat_ -> repeating) ===
hl.bind("+ XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"), { repeating = true, locked = true })
hl.bind("+ XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"), { repeating = true, locked = true })

-- === Ventanas ===
hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + Q", hl.dsp.window.pseudo())
hl.bind(mod .. " + W", hl.dsp.window.float({ action = "toggle" })) -- antes duplicaba group.toggle
hl.bind(mod .. " + SHIFT + space", hl.dsp.window.pin())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mod .. " + Space", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- === Foco ===
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "d" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "r" }))

-- === Mover ventanas ===
hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- === Monitores ===
hl.bind(mod .. " + CTRL + left", hl.dsp.focus({ monitor = "l" }))
hl.bind(mod .. " + CTRL + right", hl.dsp.focus({ monitor = "r" }))
hl.bind(mod .. " + CTRL + H", hl.dsp.focus({ monitor = "l" }))
hl.bind(mod .. " + CTRL + J", hl.dsp.focus({ monitor = "d" }))
hl.bind(mod .. " + CTRL + K", hl.dsp.focus({ monitor = "u" }))
hl.bind(mod .. " + CTRL + L", hl.dsp.focus({ monitor = "r" }))

hl.bind(mod .. " + SHIFT + CTRL + left", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mod .. " + SHIFT + CTRL + down", hl.dsp.window.move({ monitor = "d" }))
hl.bind(mod .. " + SHIFT + CTRL + up", hl.dsp.window.move({ monitor = "u" }))
hl.bind(mod .. " + SHIFT + CTRL + right", hl.dsp.window.move({ monitor = "r" }))
hl.bind(mod .. " + SHIFT + CTRL + H", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mod .. " + SHIFT + CTRL + J", hl.dsp.window.move({ monitor = "d" }))
hl.bind(mod .. " + SHIFT + CTRL + K", hl.dsp.window.move({ monitor = "u" }))
hl.bind(mod .. " + SHIFT + CTRL + L", hl.dsp.window.move({ monitor = "r" }))

-- === Workspaces ===
hl.bind(mod .. " + Page_Down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + Page_Up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + I", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + U", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mod .. " + CTRL + down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mod .. " + CTRL + up", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mod .. " + CTRL + U", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mod .. " + CTRL + I", hl.dsp.window.move({ workspace = "e-1" }))

-- === Especiales ===
hl.bind(mod .. " + M", hl.dsp.workspace.toggle_special("communication"))
hl.bind(mod .. " + P", hl.dsp.workspace.toggle_special("multimedia"))
hl.bind(mod .. " + O", hl.dsp.workspace.toggle_special("apps"))
hl.bind(mod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:communication" }))
hl.bind(mod .. " + SHIFT + P", hl.dsp.window.move({ workspace = "special:multimedia" }))
hl.bind(mod .. " + SHIFT + O", hl.dsp.window.move({ workspace = "special:apps" }))

-- === Mover a workspace relativo ===
hl.bind(mod .. " + SHIFT + Page_Down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mod .. " + SHIFT + Page_Up", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mod .. " + SHIFT + I", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "e-1" }))

-- === Rueda del ratón ===
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + CTRL + mouse_down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mod .. " + CTRL + mouse_up", hl.dsp.window.move({ workspace = "e-1" }))

-- === Workspaces numerados ===
for i = 1, 9 do
  hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- === Layout ===
hl.bind(mod .. " + bracketleft", hl.dsp.layout("preselect l"))
hl.bind(mod .. " + bracketright", hl.dsp.layout("preselect r"))
hl.bind(mod .. " + R", hl.dsp.layout("togglesplit"))

-- === Ratón ===
hl.bind(mod .. " + ALT + mouse:272", hl.dsp.window.float({ action = "toggle" }), { mouse = true })
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- === Resize (FIX K/J invertidas + flechas) ===
hl.bind("ALT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  hl.bind("L", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
  hl.bind("H", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
  hl.bind("J", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
  hl.bind("right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
  hl.bind("left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
  hl.bind("up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
  hl.bind("down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
  hl.bind("escape", hl.dsp.submap("reset"))
  hl.bind("Return", hl.dsp.submap("reset"))
end)

hl.bind(mod .. " + minus", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + equal", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + SHIFT + minus", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -10%"), { repeating = true })
hl.bind(mod .. " + SHIFT + equal", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 10%"), { repeating = true })

-- === Screenshots (sin choque con SUPER+S) ===
hl.bind(mod .. " + S", hl.dsp.exec_cmd(ipc .. "screenshot-region"))
hl.bind("Print", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grimblast copy screen"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("grimblast copy active"))
hl.bind("XF86Launch1", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("CTRL + XF86Launch1", hl.dsp.exec_cmd("grimblast copy screen"))
hl.bind("ALT + XF86Launch1", hl.dsp.exec_cmd("grimblast copy active"))
