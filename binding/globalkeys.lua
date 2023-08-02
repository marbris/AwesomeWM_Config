-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup =  require("My_hotkeys_popup")
--require("awful.hotkeys_popup")
--                require("awful.hotkeys_popup.keys")
-- Menubar library
--local menubar = require("menubar")

local beautiful = require("beautiful")

-- Resource Configuration
local modkey = RC.vars.modkey
local altkey = RC.vars.altkey
local terminal = RC.vars.terminal
local browser = RC.vars.browser
local launchmenu = RC.vars.launchmenu
local filebrowser = RC.vars.filebrowser
local zotero = RC.vars.zotero
local codeeditor = RC.vars.codeeditor

local _M = {}

-- reading
-- https://awesomewm.org/wiki/Global_Keybindings

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

    
  local globalkeys = gears.table.join(

    -- awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
    --           {description="show help", group="awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

    awful.key({modkey}, 'Left', awful.tag.viewprev, {description = 'View Previous', group = 'Tag'}),
    awful.key({modkey}, 'Right', awful.tag.viewnext, {description = 'View Next', group = 'Tag'}),

    -- rotate through layouts
    awful.key(  {modkey},'space', function() awful.layout.inc(1) end,
                {description = 'Select Next', group = 'Navigation and Layout'}),
    awful.key(  {modkey, 'Shift'},'space', function() awful.layout.inc(-1) end,
                {description = 'Select Previous', group = 'Navigation and Layout'}),
   
    -- modkey + h-j-k-l : switch focus and position on clients.
    awful.key({ modkey,           }, "h", function () awful.client.swap.byidx(  -1)    end,
              {description = "Swap with Previous Client", group = 'Navigation and Layout'}),
    awful.key({ modkey,           }, "l", function () awful.client.swap.byidx( 1)    end,
              {description = "Swap wth Next Client", group = 'Navigation and Layout'}),
    awful.key({ modkey,           }, "k", function () awful.client.focus.byidx( 1) end,
              {description = "Focus Next Client", group = 'Navigation and Layout'}),
    awful.key({ modkey,           }, "j", function () awful.client.focus.byidx(-1) end,
              {description = "Focus Previous Client", group = 'Navigation and Layout'}),
    
    -- modkey|Shift +  h-j-k-l to resize the windows.
    awful.key({modkey, 'Shift'   }, 'l', function() awful.tag.incmwfact(0.05) end,
              {description = 'IncreaseMaster Width Factor', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Shift'}, 'h', function() awful.tag.incmwfact(-0.05) end,
              {description = 'Decrease Master Width Factor', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Shift'}, 'j', function() awful.client.incwfact(-0.05) end,
              {description = 'Decrease Master Height Factor', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Shift'}, 'k', function() awful.client.incwfact(0.05) end,
              {description = 'Increase Master Height Factor', group = 'Navigation and Layout'}),
    
    -- modkey|Ctrl + h-j-k-l to reorganize the Layout
    awful.key({modkey, 'Control'}, 'h', function() awful.tag.incnmaster(1, nil, true) end,
              {description = 'Increase the Number of master Clients', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Control'}, 'l', function() awful.tag.incnmaster(-1, nil, true) end,
              {description = 'Decrease the Number of master Clients', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Control'}, 'k', function() awful.tag.incncol(1, nil, true) end,
              {description = 'Increase the Cumber of Columns', group = 'Navigation and Layout'}),
    awful.key({modkey, 'Control'}, 'j', function() awful.tag.incncol(-1, nil, true) end,
              {description = 'Decrease the Number of Columns', group = 'Navigation and Layout'}),

    -- Monitor navigation
    awful.key({modkey, 'Shift'}, 'g', function () awful.screen.focus_relative( 1) end,
    {description = 'Toggle Screen', group = 'Navigation and Layout'}),
    --awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
    --          {description = "focus the previous screen", group = "screen"}),
    awful.key({modkey, }, 'g', awful.client.movetoscreen,
            {description = 'Move Window to Next Screen', group = 'Navigation and Layout'}),


    -- Applications
    -- awful.key({modkey, },   'Return', function() awful.spawn(terminal) end,
    --           {description = 'Terminal', group = 'Applications'}),
    -- awful.key({modkey, },   'e', function() awful.spawn(filebrowser) end,
    -- {description = 'File Browser', group = 'Applications'}),
    
    -- Launch terminal. Special launch commands for some tags to open in the right directory

    awful.key({modkey, },   'Return', 
              function() 
                  local t = awful.screen.focused().selected_tag
                  if (t.terminal_launch_command) then
                    awful.spawn(t.terminal_launch_command)
                    --awful.spawn(terminal.. " --hold -e sh -c 'cd ~/.config/awesome && exec zsh'")
                  else
                    awful.spawn(terminal)
                  end
              end,
              {description = "Terminal", group = "Applications"}),


    awful.key({modkey, },   'e', 
              function() 
                  local t = awful.screen.focused().selected_tag
                  if (t.filebrowser_launch_command) then
                    awful.spawn(t.filebrowser_launch_command)
                  else
                    awful.spawn(filebrowser)
                  end
              end,
              {description = 'File Browser', group = 'Applications'}),

    awful.key({modkey, },   'w', 
              function() 
                  local t = awful.screen.focused().selected_tag
                  if (t.codeeditor_launch_command) then
                    awful.spawn(t.codeeditor_launch_command)
                  else
                    awful.spawn(codeeditor)
                  end
              end,
              {description = 'VScodium', group = 'Applications'}),
          
    

    -- awful.key({ modkey },            "r",     function () awful.spawn("bash ~/.config/rofi/launchers/type-4/launcher.sh") end,
    -- {description = "run rofi", group = "launcher"}),
    awful.key({ modkey },   "a",     function () awful.spawn(launchmenu) end,
                {description = "Launch Menu", group = "Applications"}),
    awful.key({modkey, },   'q', function() awful.spawn(browser) end,
                {description = 'QuteBrowser', group = 'Applications'}),
    awful.key({modkey, },   'z', function() awful.spawn(zotero) end,
                {description = 'Zotero', group = 'Applications'}),
    


    -- Utilities
    awful.key({modkey, 'Shift'}, 'Delete', function() awful.spawn('reboot') end,
              {description = 'Reboot Computer', group = 'Utilities'}),

    awful.key({modkey, 'Control'}, 'Delete', function() awful.spawn('shutdown now') end,
              {description = 'Shutdown Computer', group = 'Utilities'}),

    awful.key({ modkey, }, "F2", awesome.restart,
              {description = "Reload Awesome", group = "Utilities"}),

    awful.key({ modkey, }, "F3", awesome.quit,
              {description = "Quit Awesome", group = "Utilities"}),

    awful.key({modkey}, 'F1', hotkeys_popup.show_help,
              {description = 'Show Help', group = 'Utilities'}),

    awful.key({modkey, 'Shift'}, 'F12', function() awful.spawn("nm-applet") end,
              {description = 'nm-applet', group = 'Utilities'}),
      
    awful.key({  }, "XF86AudioRaiseVolume",
                function ()
                    os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
                    beautiful.volume.update()
                end,
                {description = "Volume up", group = "Utilities"}),
    awful.key({ }, "XF86AudioLowerVolume",
                function ()
                    os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
                    beautiful.volume.update()
                end,
                {description = "volume down", group = "Utilities"}),


    awful.key({  }, "XF86AudioMute",
                function ()
                    os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
                    beautiful.volume.update()
                end,
                {description = "toggle mute", group = "Utilities"}),
              
    
    -- awful.key({modkey, }, 'Escape', function() _G.exit_screen_show() end,
    --           {description = 'Log Out Screen', group = 'Utilities'}),
    -- awful.key({modkey, }, 'End', function() awful.spawn(lock) end,
    --           {description = 'Lock the screen', group = 'Utilities'}),
    -- awful.key({modkey, 'Control'}, 'r', _G.awesome.restart,
    --           {description = 'Reload awesome', group = 'Utilities'}),
    -- awful.key({modkey, 'Control'}, 'q', _G.awesome.quit,
    --           {description = 'Quit awesome', group = 'Utilities'}), 
    
    -- awful.key({}, 'F8', function() xrandr.xrandr() end,
    --           {description = 'Toggle monitor mode', group = 'Utilities'}),

    -- Client
  
    awful.key({altkey}, 'Tab',
    function ()
        awful.client.focus.byidx( 1)
        if client.focus then
            client.focus:raise()
        end
    end,
    {description = "Focus Next Client", group = "Client"}
    ),
    awful.key({altkey, 'Shift'}, 'Tab',
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "Focus Previous Client", group = "Client"}
    ),
      
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
    {description = "toggle floating", group = "Client: Floating"}),


     -- Resize
    awful.key({ modkey, "Control" }, "Up", function () awful.client.moveresize( 0, 0, 0, -20) end,
                {description = 'Increase Height', group = 'Client: Floating'}),
    awful.key({ modkey, "Control" }, "Down", function () awful.client.moveresize( 0, 0, 0,  20) end,
                {description = 'Decrease Height', group = 'Client: Floating'}),
    awful.key({ modkey, "Control" }, "Left",function () awful.client.moveresize( 0, 0, -20, 0) end,
    {description = 'Decrease Width', group = 'Client: Floating'}),
    awful.key({ modkey, "Control" }, "Right", function () awful.client.moveresize( 0, 0,  20, 0) end,
      {description = 'Increase Width', group = 'Client: Floating'}),

    -- Move
    awful.key({ modkey, "Shift"   }, "Down",function () awful.client.moveresize(  0,  20,   0,   0) end,
      {description = 'Move Down', group = 'Client: Floating'}),
    awful.key({ modkey, "Shift"   }, "Up",function () awful.client.moveresize(  0, -20,   0,   0) end,
      {description = 'Move Up', group = 'Client: Floating'}),
    awful.key({ modkey, "Shift"   }, "Left",function () awful.client.moveresize(-20,   0,   0,   0) end,
      {description = 'Move Left', group = 'Client: Floating'}),
    awful.key({ modkey, "Shift"   }, "Right",function () awful.client.moveresize( 20,   0,   0,   0) end,
      {description = 'Move Right', group = 'Client: Floating'})
    
    -- awful.key({ modkey }, "x",
    --           function ()
    --               awful.prompt.run {
    --                 prompt       = "Run Lua code: ",
    --                 textbox      = awful.screen.focused().promptbox.widget,
    --                 exe_callback = awful.util.eval,
    --                 history_path = awful.util.get_cache_dir() .. "/history_eval"
    --               }
    --           end,
    --           {description = "lua execute prompt", group = "awesome"})

    -- Menubar
    -- awful.key({ modkey }, "p", function() menubar.show() end,
    --           {description = "show the menubar", group = "launcher"})

    -- awful.key({ modkey,           }, "m",
    --           function()
    --             if cl_menu then
    --               cl_menu:hide()
    --               cl_menu=nil
    --             else
    --               client_list={}
    --               local tag = awful.tag.selected()
    --               for i=1, #tag:clients() do
    --                     cl=tag:clients()[i]
    --                     if tag:clients()[i].minimized then
    --                         prefix = "_ "
    --                     else
    --                         prefix = "* "
    --                     end
    --                     if not awful.rules.match(cl, {class= "Conky"}) then
    --                       client_list[i]=
    --                         {prefix .. cl.name,
    --                         function()
    --                           tag:clients()[i].minimized=not tag:clients()[i].minimized
    --                         end,
    --                         cl.icon
    --                         }
    --                     end
    --               end
    --                 cl_menu=awful.menu({items = client_list, theme = {width=300}})
    --                 cl_menu:show()
    --             end
    --           end,
    --         {description = "(un)maximize", group = "other"})

  )

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { 
  __call = function(_, ...) return _M.get(...) end 
})
