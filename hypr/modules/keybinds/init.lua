-- ==================
-- KEYBINDINGS
-- ==================
local keybinds_dir = debug.getinfo(1).source:match("@?(.*/)")

dofile(keybinds_dir .. "navigation.lua")
dofile(keybinds_dir .. "workspaces.lua")
dofile(keybinds_dir .. "apps.lua")
dofile(keybinds_dir .. "controls.lua")
