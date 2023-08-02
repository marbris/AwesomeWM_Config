

local awful     = require("awful")
local beautiful = require('beautiful')
local wibox = require('wibox')
--local clickable_container = require('widget.material.clickable-container')
local gears = require("gears")
local dpi = require('beautiful').xresources.apply_dpi
local vicious = require('vicious')
local lain = require('lain')



--local battery_widget = require("widget.battery")

-- batwidget = wibox.widget.progressbar()

-- -- Create wibox with batwidget
-- batbox = wibox.layout.margin(
--     wibox.widget{ { max_value = 1, widget = batwidget,
--                     border_width = 0.5, border_color = "#000000",
--                     color = { type = "linear",
--                               from = { 0, 0 },
--                               to = { 0, 30 },
--                               stops = { { 0, "#AECF96" },
--                                         { 1, "#FF5656" } } } },
--                   forced_height = 10, forced_width = 8,
--                   direction = 'east', color = beautiful.fg_widget,
--                   layout = wibox.container.rotate },
--     1, 1, 3, 3)

-- -- Register battery widget
-- vicious.register(batwidget, vicious.widgets.bat, "$2", 61, "BAT0")

--------- Volume Bar ------------
--local volumebar = require('widget.volume.volume-slider')


local deco = {
    wallpaper = require("deco.wallpaper"),
    taglist   = require("deco.taglist"),
    tasklist  = require("deco.tasklist")
}

local _M = {}

------------system tray ---------------
local systray = wibox.widget.systray()
  systray:set_horizontal(true)
  systray:set_base_size(20)
  systray.forced_height = 20
-----------------------------------

-- -------- Clock/Calendar widget ----------
-- local textclock = wibox.widget.textclock('<span font="JetBrains Mono bold 14">%d.%m.%Y %H:%M</span>')
-- local month_calendar = awful.widget.calendar_popup.month({
--     screen = s,
--     start_sunday = false,
--     week_numbers = true,
--     font = 'JetBrains Mono 12'
-- })
-- month_calendar:attach(textclock)
-- local clock_widget = wibox.container.margin(textclock, dpi(13), dpi(13), dpi(9), dpi(8))
-- -------------------------------------------

local markup = lain.util.markup

----------------Textclock----------------
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(beautiful.widget_clock)
local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#ab7367", ">") .. markup("#de5e1e", " %H:%M "))
mytextclock.font = beautiful.font
--------------------------------
----------------Calendar----------------
beautiful.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Terminus 10",
        fg   = beautiful.fg_normal,
        bg   = beautiful.bg_normal
    }
})
--------------------------------

----------------CPU----------------
local cpuicon = wibox.widget.imagebox(beautiful.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(beautiful.font, "#e33a6e", cpu_now.usage .. "% "))
    end
})
--------------------------------
----------------Coretemp----------------
local tempicon = wibox.widget.imagebox(beautiful.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(beautiful.font, "#f1af5f", coretemp_now .. "°C "))
    end
})

----------------Battery----------------
local baticon = wibox.widget.imagebox(beautiful.widget_batt)
local bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc

        if bat_now.ac_status == 1 then
            perc = perc .. " plug"
        end

        widget:set_markup(markup.fontfg(beautiful.font, beautiful.fg_normal, perc .. " "))
    end
})
--------------------------------
----------------ALSA volume----------------
local volicon = wibox.widget.imagebox(beautiful.widget_vol)
beautiful.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end

        widget:set_markup(markup.fontfg(beautiful.font, "#7493d2", volume_now.level .. "% "))
    end
})
--------------------------------
-----------------Net---------------------------------
local netdownicon = wibox.widget.imagebox(beautiful.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(beautiful.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        --[[ uncomment if using the weather widget
        if iface ~= "network off" and
           string.match(beautiful.weather.widget.text, "N/A")
        then
            beautiful.weather.update()
        end
        --]]

        widget:set_markup(markup.fontfg(beautiful.font, "#e54c62", net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(beautiful.font, "#87af5f", net_now.received .. " "))
    end
})
---------------------------------


----------- MEM ---------------
local memicon = wibox.widget.imagebox(beautiful.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(beautiful.font, "#e0da37", mem_now.used .. "M "))
    end
})
---------------------------------


---------- Layout Box -----------------------
local layoutbox = function(s)
    local LayoutBox = awful.widget.layoutbox(s)
    LayoutBox:buttons(
      gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end)
      )
    )
    return LayoutBox
end
----------------------------------

---------- Task List ----------------
local tasklist = function(s)
    local TaskList = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = deco.tasklist()
    }
    return TaskList
end
---------------------------------------

------------ Tag List ---------------
local taglist = function(s)
    local TagList = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = deco.taglist()
    }
    return TagList
end
-----------------------------------------



local TopPanel = function(s)
  

    --s.promptbox = awful.widget.prompt()

    local panel =
    --wibox(
    awful.wibar(
    {
        position = 'top',
        --ontop = true,
        screen = s,
        height = dpi(32)
        --bg = beautiful.background.hue_800,
        --fg = beautiful.fg_normal,
        --struts = {
        --top = dpi(32)
        --}
    }
    )

    panel:setup {
        layout = wibox.layout.align.horizontal,
        {
        layout = wibox.layout.fixed.horizontal,
        taglist(s)
        --s.promptbox
        },
        nil,
        {
        layout = wibox.layout.fixed.horizontal,
        --wibox.container.margin(systray, dpi(3), dpi(3), dpi(6), dpi(3)),
        -- Layout box
        -- Clock
        --clock_widget,
        netdownicon,
        netdowninfo,
        netupicon,
        netupinfo.widget,
        volicon,
        beautiful.volume.widget,
        memicon,
        memory.widget,
        cpuicon,
        cpu.widget,
        tempicon,
        temp.widget,
        baticon,
        bat.widget,

        clockicon,
        mytextclock
        }
    }

  return panel
end

local BottomPanel = function(s)
  
    local panel =
    --wibox(
    awful.wibar({ 
        position = "bottom", 
        screen = s, 
        border_width = 0, 
        height = dpi(20), 
        bg = beautiful.bg_normal, 
        fg = beautiful.fg_normal })

    

    panel:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
        },
        tasklist(s), -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            layoutbox(s),
        },
    }

  return panel
end



-- {{{ Main
function _M.init()
      
    awful.screen.connect_for_each_screen(function(s)
        s.top_panel = TopPanel(s)
        s.bottom_panel = BottomPanel(s)
    end)
  
end
  -- }}}
  
  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  
return setmetatable({}, { __call = function(_, ...) return _M.init(...) end })
  