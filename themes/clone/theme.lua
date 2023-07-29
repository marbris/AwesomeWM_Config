local awful = require("awful")
awful.util = require("awful.util")

theme_path = awful.util.getdir("config") .. "/themes/clone/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

theme = {}

dofile(theme_path .. "elements.lua")
dofile(theme_path .. "titlebar.lua")
dofile(theme_path .. "layouts.lua")
dofile(theme_path .. "icons.lua")

theme.wallpaper          = "~/Pictures/Backgrounds/jj_dark_by_Hiking93.jpg"
theme.awesome_icon       = theme_path .. "launcher/logo20_kali_black.png"
theme.awesome_subicon    = theme_path .. "launcher/logo20_kali_black.png"

return theme


