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
