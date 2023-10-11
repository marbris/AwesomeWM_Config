--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]

local dpi = require("beautiful.xresources").apply_dpi

local os = os
local theme = {}

theme.rofi_theme = "~/.config/rofi/launchers/type-2/style-2.rasi"

theme.confdir = os.getenv("HOME") .. "/.config/awesome/themes/My_multicolor"

theme.wallpaper = theme.confdir .. "/Wallpapers/230802_03_ETD_001_edited.tif"
theme.font = "JetBrainsMono Nerd Font 12" --"Terminus 8"
theme.menu_bg_normal = "#000000"
theme.menu_bg_focus = "#000000"
theme.bg_normal = "#000000"
theme.bg_focus = "#000000"
theme.bg_urgent = "#000000"
theme.fg_normal = "#aaaaaa"
theme.fg_focus = "#ff8c00"
theme.fg_urgent = "#af1d18"
theme.fg_minimize = "#ffffff"
theme.border_width = dpi(1)
theme.border_normal = "#1c2022"
--theme.border_focus                              = "#606060"
theme.border_focus = "#ff8c00"
theme.border_marked = "#3ca4d8"
theme.menu_border_width = 0
theme.menu_width = dpi(130)
theme.menu_fg_normal = "#aaaaaa"
theme.menu_fg_focus = "#ff8c00"
theme.menu_bg_normal = "#050505dd"
theme.menu_bg_focus = "#050505dd"

theme.hotkeys_bg = "#000000"
theme.hotkeys_fg = "#ff8c00"
theme.hotkeys_modifiers_fg = "#995400"
theme.hotkeys_font = "JetBrainsMono Nerd Font ExtraBold 10"
theme.hotkeys_description_font = "JetBrainsMono Nerd Font 8"

theme.useless_gap = dpi(3)

--------- icons ----------------
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true

theme.menu_submenu_icon = theme.confdir .. "/icons/submenu.png"
theme.widget_temp = theme.confdir .. "/icons/temp.png"
theme.widget_uptime = theme.confdir .. "/icons/ac.png"
theme.widget_cpu = theme.confdir .. "/icons/cpu.png"
theme.widget_weather = theme.confdir .. "/icons/dish.png"
theme.widget_fs = theme.confdir .. "/icons/fs.png"
theme.widget_mem = theme.confdir .. "/icons/mem.png"
theme.widget_note = theme.confdir .. "/icons/note.png"
theme.widget_note_on = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown = theme.confdir .. "/icons/net_down.png"
theme.widget_netup = theme.confdir .. "/icons/net_up.png"
theme.widget_mail = theme.confdir .. "/icons/mail.png"
theme.widget_batt = theme.confdir .. "/icons/bat.png"
theme.widget_clock = theme.confdir .. "/icons/clock.png"
theme.widget_vol = theme.confdir .. "/icons/spkr.png"
theme.taglist_squares_sel = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel = theme.confdir .. "/icons/square_b.png"
theme.layout_tile = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle = theme.confdir .. "/icons/dwindle.png"
theme.layout_max = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

return theme
