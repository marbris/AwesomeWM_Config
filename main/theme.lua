-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

--local dpi = require('beautiful').xresources.apply_dpi

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
--local home = os.getenv("HOME")

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init("/usr/share/awesome/themes/default/theme.lua")
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
--beautiful.init(home .. "/.config/awesome/themes/MyTheme/theme.lua")
local themes = {
    "blackburn",       -- 1
    "copland",         -- 2
    "dremora",         -- 3
    "holo",            -- 4
    "multicolor",      -- 5
    "powerarrow",      -- 6
    "powerarrow-dark", -- 7
    "rainbow",         -- 8
    "steamburn",       -- 9
    "vertex",           -- 10
    "My_multicolor"     --11
}

local chosen_theme = themes[11]
beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))


-- if (RC.vars.wallpaper) then
--     local wallpaper = RC.vars.wallpaper
--     if awful.util.file_readable(wallpaper) then theme.wallpaper = wallpaper end
-- end

-- Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
