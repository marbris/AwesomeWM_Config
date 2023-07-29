-- Standard awesome library
local awful = require("awful")
local beautiful = require("beautiful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get ()
  local tags = {
    { --tag #1
      icon = beautiful.tag_icon_communication,
      -- type = 'Browser',
      -- defaultApp = RC.vars.browser
    },
    { --tag #2
      -- icon = icons.code,
      -- icon = "2"
      -- type = 'code',
      -- defaultApp = apps.default.editor,
      -- screen = 1
    },
    { -- tag #3
      -- icon = icons.social,
      -- icon = "3"
      -- type = 'social',
      -- defaultApp = apps.default.social,
      -- screen = 1
    },
    { -- tag #4
      -- icon = icons.game,
      -- icon = "4"
      -- type = 'game',
      -- defaultApp = apps.default.game,
      -- screen = 1
    },
    { -- tag #5
      -- icon = icons.folder,
      -- icon = "5"
      -- type = 'files',
      -- defaultApp = apps.default.files,
      -- screen = 1
    },
    { -- tag #6
      -- icon = icons.music,
      -- icon = "6"
      -- type = 'music',
      -- defaultApp = apps.default.music,
      -- screen = 1
    },
    { -- tag #7
      icon = beautiful.awesome_icon,
      -- icon = "7"
      -- type = 'any',
      -- defaultApp = apps.default.rofi,
      -- screen = 1
    }
  }

  awful.screen.connect_for_each_screen(
  function(s)
    for i, tag in pairs(tags) do
      awful.tag.add(
        i,
        {
          icon = tag.icon,
          --icon_only = true,
          layout = RC.layouts[1],
          -- gap_single_client = false,
          -- gap = 4,
          screen = s,
          -- defaultApp = tag.defaultApp,
          selected = i == 1
        }
      )
    end
  end)

  -- awful.screen.connect_for_each_screen(function(s)
  --   -- Each screen has its own tag table.
  --   tags[s] = awful.tag(
  --     { "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, RC.layouts[1]
  --   )
  -- end)
  
  return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
