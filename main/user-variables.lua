--local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
--local with_dpi = require('beautiful').xresources.apply_dpi
--local get_dpi = require('beautiful').xresources.get_dpi
--local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

local beautiful = require('beautiful')

local launchmenu_command = "rofi -show drun -theme ".. beautiful.rofi_theme --"~/.config/rofi/launchers/type-4/style-3.rasi"

--local xrandr_command = require("configuration.utils.xrandr")


local _M = {


  modkey = "Mod4",
  altkey = 'Mod1',
  
  terminal = 'alacritty',
  launchmenu = launchmenu_command,
  browser = 'qutebrowser',
  zotero = '/opt/zotero/zotero',
  filebrowser = 'nautilus',
  email = 'thunderbird',
  codeeditor = 'codium', 


  -- lock = 'i3lock-fancy',
  -- --quake = 'alacritty',
  -- screenshot = 'flameshot screen -p ~/Pictures',
  -- region_screenshot = 'flameshot gui -p ~/Pictures',
  -- delayed_screenshot = 'flameshot screen -p ~/Pictures -d 5000',
  
  
  




}

return _M

