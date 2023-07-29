
 ---- OLD VERSION THAT IM PATCHING INTO THE NEW FORMAT -----

local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = RC.vars.modkey
local altkey = RC.vars.altKey
local apps = RC.vars.apps

local terminal = RC.vars.terminal
local rofi = RC.vars.rofi_command
local lock = RC.vars.lock
local quake = terminal
local screenshot = RC.vars.screenshot
local region_screenshot = RC.vars.region_screenshot
local delayed_screenshot = RC.vars.delayed_screenshot
local browser = RC.vars.browser
local editor = RC.vars.editor -- gui text editor
--local social = RC.vars.'discord',
local game = RC.vars.game
local files = RC.vars.files
local music = RC.vars.music
local email = RC.vars.email

--This is a script to toggle between difference monitor settings.
--local xrandr = require('configuration.utils.xrandr')

local _M = {}
-- reading
-- https://awesomewm.org/wiki/Global_Keybindings
function _M.get()
  -- Key bindings
  local globalkeys =
    awful.util.table.join(
    -- Hotkeys
    -- Tag browsing
    awful.key({modkey}, 'Left', awful.tag.viewprev, {description = 'view previous', group = 'tag'}),
    awful.key({modkey}, 'Right', awful.tag.viewnext, {description = 'view next', group = 'tag'}),
    --awful.key({altkey, 'Control'}, 'Up', awful.tag.viewprev, {description = 'view previous', group = 'tag'}),
    --awful.key({altkey, 'Control'}, 'Down', awful.tag.viewnext, {description = 'view next', group = 'tag'}),
    --awful.key({modkey}, 'Escape', awful.tag.history.restore, {description = 'go back', group = 'tag'}),

    -- modkey + h-j-k-l : switch focus and position on clients.
    awful.key({ modkey,           }, "h", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = 'Navigation and Layout'}),
    awful.key({ modkey,           }, "l", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = 'Navigation and Layout'}),
    awful.key({ modkey,           }, "k", function () awful.client.focus.byidx( 1) end,
              {description = "focus the next client", group = 'Navigation and Layout'}),
    awful.key({ modkey,           }, "j", function () awful.client.focus.byidx(-1) end,
              {description = "focus the previous client", group = 'Navigation and Layout'}),
    
    -- modkey|Shift +  h-j-k-l to resize the windows.
    awful.key({modkey, 'Shift'   }, 'l', function() awful.tag.incmwfact(0.05) end,
              {description = 'Increase master width factor', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Shift'}, 'h', function() awful.tag.incmwfact(-0.05) end,
              {description = 'Decrease master width factor', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Shift'}, 'j', function() awful.client.incwfact(-0.05) end,
              {description = 'Decrease master height factor', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Shift'}, 'k', function() awful.client.incwfact(0.05) end,
              {description = 'Increase master height factor', group = 'Navigation and Layout'}),
    
    -- modkey|Ctrl + h-j-k-l to reorganize the Layout
    awful.key({modkey, 'Control'}, 'h', function() awful.tag.incnmaster(1, nil, true) end,
              {description = 'Increase the number of master clients', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Control'}, 'l', function() awful.tag.incnmaster(-1, nil, true) end,
              {description = 'Decrease the number of master clients', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Control'}, 'k', function() awful.tag.incncol(1, nil, true) end,
              {description = 'Increase the number of columns', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Control'}, 'j', function() awful.tag.incncol(-1, nil, true) end,
              {description = 'Decrease the number of columns', group = 'Navigation and Layout'}),
    
    -- Monitor navigation
    awful.key({modkey, 'Shift'}, 'g', function () awful.screen.focus_relative( 1) end,
              {description = 'Toggle screen', group = 'Navigation and Layout'}),
    --awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
    --          {description = "focus the previous screen", group = "screen"}),
    awful.key({modkey, }, 'g', awful.client.movetoscreen,
              {description = 'Move window to next screen', group = 'Navigation and Layout'}),
    
    -- Applications
    awful.key({modkey, }, 'Return', function() awful.spawn(terminal) end,
              {description = 'Open a terminal', group = 'Applications'}),
    --awful.key({ modkey, "Shift"   }, "BackSpace",      function (c) c:kill()        end,
    --          {description = "Close", group = "client"}),
    awful.key({modkey, }, 'a', function() awful.spawn('rofi -combi-modi window,drun -show combi -modi combi') end,
              {description = 'Main menu', group = 'Applications'}),
    
    awful.key({modkey, }, 'e', function() awful.util.spawn(files) end,
              {description = 'Open a filebrowser', group = 'Applications'}),
    awful.key({modkey, }, 'c', function() awful.util.spawn(editor) end,
              {description = 'Open a text/code editor', group = 'Applications'}),
    awful.key({modkey, }, 'b', function() awful.util.spawn(browser) end,
              {description = 'Open a browser', group = 'Applications'}),
    awful.key({modkey, }, 'z', function() _G.toggle_quake() end,
              {description = 'dropdown application', group = 'Applications'}),
    awful.key({modkey, }, '2', function() awful.util.spawn(email) end,
              {description = 'Open Thunderbird', group = 'Applications'}),


    -- Screenshot
    awful.key({modkey, 'Shift' }, 'Print', function() awful.util.spawn_with_shell(screenshot) end,
              {description = 'Take a screenshot of your active monitor and copy it to clipboard', group = 'Screenshot'}),
    awful.key({modkey, }, 'Print', function() awful.util.spawn_with_shell(region_screenshot) end,
              {description = 'Mark an area and screenshot it to your clipboard', group = 'Screenshot'}),
    --awful.key({modkey, }, 'Print', function() awful.util.spawn_with_shell(delayed_screenshot) end,
    --          {description = 'Mark an area and screenshot it 10 seconds later (clipboard)', group = 'Screenshot'}),
    
    -- Utilities
    awful.key({modkey, 'Shift'}, 'Delete', function() awful.spawn('reboot') end,
              {description = 'Reboot Computer', group = 'Utilities'}),
    awful.key({modkey, 'Control'}, 'Delete', function() awful.spawn('shutdown now') end,
              {description = 'Shutdown Computer', group = 'Utilities'}),
    awful.key({modkey, }, 'Escape', function() _G.exit_screen_show() end,
              {description = 'Log Out Screen', group = 'Utilities'}),
    awful.key({modkey, }, 'End', function() awful.spawn(lock) end,
              {description = 'Lock the screen', group = 'Utilities'}),
    -- awful.key({modkey, 'Control'}, 'r', _G.awesome.restart,
    --           {description = 'Reload awesome', group = 'Utilities'}),
    -- awful.key({modkey, 'Control'}, 'q', _G.awesome.quit,
    --           {description = 'Quit awesome', group = 'Utilities'}), 
    awful.key({modkey}, 'F1', hotkeys_popup.show_help,
              {description = 'Show help', group = 'Utilities'}),
    -- awful.key({}, 'F8', function() xrandr.xrandr() end,
    --           {description = 'Toggle monitor mode', group = 'Utilities'}),

    awful.key({ modkey,           }, "m",
              function()
                if cl_menu then
                  cl_menu:hide()
                  cl_menu=nil
                else
                  client_list={}
                  local tag = awful.tag.selected()
                  for i=1, #tag:clients() do
                        cl=tag:clients()[i]
                        if tag:clients()[i].minimized then
                            prefix = "_ "
                        else
                            prefix = "* "
                        end
                        if not awful.rules.match(cl, {class= "Conky"}) then
                          client_list[i]=
                            {prefix .. cl.name,
                            function()
                              tag:clients()[i].minimized=not tag:clients()[i].minimized
                            end,
                            cl.icon
                            }
                        end
                  end
                    cl_menu=awful.menu({items = client_list, theme = {width=300}})
                    cl_menu:show()
                end
              end,
            {description = "(un)maximize", group = "other"}),      


    --[[awful.key({ modkey,           }, "m",
      function(c)
        for _, c in ipairs(client.get()) do 
          if c.minimized then 
            c.minimized = false 
            client.focus = c
            c:raise() 
          end 
        end
      end,
      --[[function(c)
        c.maximized = not c.maximized
        c:raise()
      end,
              {description = "(un)maximize", group = "other"}),
    ]]
              --  awful.key({modkey}, 'u', awful.client.urgent.jumpto, {description = 'jump to urgent client', group = 'client'}),
    awful.key({altkey}, 'Tab',
      function()
        awful.client.focus.byidx(1)
        if _G.client.focus then
          _G.client.focus:raise()
        end
      end,
      {description = 'Switch to next window', group = 'Navigation and Layout'}
    ),
    awful.key({altkey, 'Shift'}, 'Tab',
      function()
        awful.client.focus.byidx(-1)
        if _G.client.focus then
          _G.client.focus:raise()
        end
      end,
      {description = 'Switch to previous window', group = 'Navigation and Layout'}
    ),
    -- Programms

    
    -- Standard program
    awful.key(
      {modkey},
      'space',
      function()
        awful.layout.inc(1)
      end,
      {description = 'Select next', group = 'Navigation and Layout'}
    ),
    awful.key(
      {modkey, 'Shift'},
      'space',
      function()
        awful.layout.inc(-1)
      end,
      {description = 'Select previous', group = 'Navigation and Layout'}
    ),
    awful.key(
      {modkey, 'Control'},
      'n',
      function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
          _G.client.focus = c
          c:raise()
        end
      end,
      {description = 'Restore minimized', group = 'Navigation and Layout'}
    ),

    awful.key(
      {modkey, "Control" },
      "space",
      awful.client.floating.toggle,
      {description = "Toggle floating", group = 'Navigation and Layout'}
    )
  )
  return globalkeys
end


for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = {description = 'view tag #', group = 'tag'}
    descr_toggle = {description = 'toggle tag #', group = 'tag'}
    descr_move = {description = 'move focused client to tag #', group = 'tag'}
    descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
  end
  globalkeys =
    awful.util.table.join(
    globalkeys,
    -- View tag only.
    awful.key(
      {modkey},
      '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      descr_view
    ),
    -- Toggle tag display.
    awful.key(
      {modkey, 'Control'},
      '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      descr_toggle
    ),
    -- Move client to tag.
    awful.key(
      {modkey, 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:move_to_tag(tag)
          end
        end
      end,
      descr_move
    ),
    -- Toggle tag on focused client.
    awful.key(
      {modkey, 'Control', 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:toggle_tag(tag)
          end
        end
      end,
      descr_toggle_focus
    )
  )
end

return globalkeys

  -- Dropdown application
  -- Widgets popups
  --[[awful.key(
    {altkey},
    'h',
    function()
      if beautiful.fs then
        beautiful.fs.show(7)
      end
    end,
    {description = 'Show filesystem', group = 'widgets'}
  ),
  awful.key(
    {altkey},
    'w',
    function()
      if beautiful.weather then
        beautiful.weather.show(7)
      end
    end,
    {description = 'Show weather', group = 'widgets'}
  ),--]]
  --[[
  -- Brightness
  awful.key({}, 'XF86MonBrightnessUp', function() awful.spawn('xbacklight -inc 10') end,
            {description = '+10%', group = 'hotkeys'}),
  awful.key({}, 'XF86MonBrightnessDown', function() awful.spawn('xbacklight -dec 10') end,
            {description = '-10%', group = 'hotkeys'}),
  -- ALSA volume control
  awful.key({}, 'XF86AudioRaiseVolume', function() awful.spawn('amixer -D pulse sset Master 5%+') end,
            {description = 'volume up', group = 'hotkeys'}),
  awful.key({}, 'XF86AudioLowerVolume', function() awful.spawn('amixer -D pulse sset Master 5%-') end,
            {description = 'volume down', group = 'hotkeys'}),
  awful.key({}, 'XF86AudioMute', function() awful.spawn('amixer -D pulse set Master 1+ toggle') end,
            {description = 'toggle mute', group = 'hotkeys'}),
  --awful.key({}, 'XF86AudioNext', function()  end,
  --          {description = 'toggle mute', group = 'hotkeys'}),
  awful.key(
    {},
    'XF86PowerDown',
    function()
      --
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86PowerOff',
    function()
      _G.exit_screen_show()
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  -- Open default program for tag
  awful.key(
    {modkey},
    't',
    function()
      awful.spawn(
          awful.screen.focused().selected_tag.defaultApp,
          {
            tag = _G.mouse.screen.selected_tag,
            placement = awful.placement.bottom_right
          }
        )
    end,
    {description = 'Open default program for tag/workspace', group = 'tag'}
  )
  
)
]]
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
