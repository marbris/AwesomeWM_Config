pcall(require, "luarocks.loader")


-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- Miscellanous awesome library
local menubar = require("menubar")


-- Themes
require("main.theme")

RC = {} -- global namespace, on top before require any modules
RC.vars = require("main.user-variables")
modkey = RC.vars.modkey

-- Error handling
require("main.error-handling")



-- -- --

-- Calling All Module Libraries

-- Custom Local Library
local main = {
  layouts = require("main.layouts"),
  tags    = require("main.tags"),
  --menu    = require("main.menu"),
  rules   = require("main.rules"),
}

-- Custom Local Library: Keys and Mouse Binding
local binding = {
  globalbuttons = require("binding.globalbuttons"),
  clientbuttons = require("binding.clientbuttons"),
  globalkeys    = require("binding.globalkeys"),
  clientkeys    = require("binding.clientkeys"),
  bindtotags    = require("binding.bindtotags")

  --globalkeys = require("binding.oldkeys"),
}
-- local binding = {
--   globalbuttons = require("binding.oldkeys")
-- }

-- Layouts
RC.layouts = main.layouts()
awful.layout.layouts = RC.layouts

-- Tags
RC.tags = main.tags()

-- Menu
-- RC.mainmenu = awful.menu({ items = main.menu() }) -- in globalkeys
-- RC.launcher = awful.widget.launcher(
--   { image = beautiful.awesome_icon, menu = RC.mainmenu }
-- )
-- menubar.utils.terminal = RC.vars.terminal

-- Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- Rules
awful.rules.rules = main.rules(
  binding.clientkeys(),
  binding.clientbuttons()
)

-- Signals
require("main.signals")

-- Statusbar: Wibar
--local statusbar = require("statusbar.default.statusbar")
--local statusbar = require("statusbar.stacked.statusbar")
--local statusbar = require("statusbar.vicious.statusbar")
-- --local statusbar = require("statusbar.lain.statusbar")
-- --local statusbar = require("statusbar.arrow.statusbar")

local statusbar = require('MyStatusBar')
statusbar()


------Start at startup
--awful.spawn('bash /home/martin/.screenlayout/Layout_at_Work.sh')
--awful.spawn('picom --backend glx --vsync opengl-swc')
--awful.spawn.with_shell('picom --config ~/.config/picom/picom.conf')

--- hotkeys_popup. Extra hotkeys
--- Extra hotkeys are already added with require(awful.hotkeys_popup.keys)
---require("hotkeys_popup")

