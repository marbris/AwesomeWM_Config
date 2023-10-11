-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey
local altkey = RC.vars.altkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
	local clientkeys = gears.table.join(

		awful.key({ modkey }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "Toggle Fullscreen", group = "Client" }),

		awful.key({ modkey, "Shift" }, "c", function(c)
			c:kill()
		end, { description = "Close", group = "Client" }),

		awful.key({ modkey, "Control" }, "Return", function(c)
			c:swap(awful.client.getmaster())
		end, { description = "Move to master", group = "Client" }),
		awful.key({ modkey }, "o", function(c)
			c:move_to_screen()
		end, { description = "Move to screen", group = "Client" }),
		awful.key({ modkey }, "t", function(c)
			c.ontop = not c.ontop
		end, { description = "Toggle Keep on Top", group = "Client" }),

		-- awful.key({ modkey,           }, "n",
		--   function (c)
		--     -- The client currently has the input focus, so it cannot be
		--     -- minimized, since minimized clients can't have the focus.
		--     c.minimized = true
		--   end ,
		--   {description = "(Un)Minimize", group = "Client"}),

		-- awful.key({ modkey}, "n",
		--   function ()
		--       local c = awful.client.restore()
		--       -- Focus restored client
		--       if c then
		--         c:emit_signal(
		--             "request::activate", "key.unminimize", {raise = true}
		--         )
		--       end
		--   end),

		-- awful.key(
		--   {modkey },
		--   'n',
		--   function()
		--     local c = awful.client.restore()
		--     -- Focus restored client
		--     if c then
		--       client.focus = c
		--       c:raise()
		--     end
		--   end,
		--   {description = 'Restore minimized', group = 'Navigation and Layout'}),

		awful.key({ modkey }, "m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "(Un)Maximize", group = "Client" })

		--{description = "Restore Minimized", group = "Client"}),
	)

	return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
