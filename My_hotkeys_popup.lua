

local hotkeys_popup = require("awful.hotkeys_popup")


--Vim commands when vim or VIM is open
require("awful.hotkeys_popup.keys.vim")

--Vim commands when qutebrowser is open
require("awful.hotkeys_popup.keys.qutebrowser")

--local hotkeys_popup = require("awful.hotkeys_popup").widget


--local Vim_rule = { class = { "alacritty"} }


local qutebrowser_rule = { class = "qutebrowser" }


for group_name, group_data in pairs({
    ["Qutebrowser: Search Engine !Bangs"] = { color = "#009F00", rule_any = qutebrowser_rule },
    --["Vim"] = { color = "#009F00", rule_any = Vim_rule }
}) do
    hotkeys_popup.widget.add_group_rules(group_name, group_data)
end

-- QuteBrowser hotkeys
local Qutebrowser_keys = {

    ["Qutebrowser: Search Engine !Bangs"] = {
    {
        modifiers = {  },
        keys = {    ["!w"] = "Wikipedia",
                    ["!scry"] = "Scryfall",
                    ["!g"] = "Google",
                    ["!omap"] = "Open Street Maps",
                    ["!gmap"] = "Google Maps",
                    ["!plt"] = "Matplotlib",
                    ["!gsc"] = "Google Scholar"
                }
    }
                    }
}


-- Tags hotkeys
local Tags_keys = {

    ["Tags"] = {
    {
        modifiers = { modkey },
        keys =      { ["1..9"] = "View Tag #"}
    },
    {
        modifiers = { modkey, "Control" },
        keys =      { ["1..9"] = "Toggle Tag #"}
    },
    {
        modifiers = { modkey, "Shift" },
        keys =      { ["1..9"] = "Move Client to Tag #"}
    },
    {
        modifiers = { modkey, "Control", "Shift" },
        keys =      { ["1..9"] = "Toggle Focused Client on Tag #"}
    }
                }
}

-- -- Vim hotkeys
-- local Vim_keys = {

--     ["Vim"] = {
--     {
--         modifiers = {  },
--         keys = {    ["h|j|k|l"] = "Scroll Left|Down|Up|Right",
--                     ["H|M|L"] = "Go to Top|Middle|Bottom Line in File",
--                     ["/|?"] = "Search in File (Forward|Backward)",
--                     ["f{}|F{}"] = "Go to Next|Previous {} in Line",
--                     ["%"] = "Jump Between nearest (), [], {}",
--                     ["#G"] = "Go to Line #",
--                     ["w|b"] = "Move Forward|Backward a Word",
--                     ["#w|#b"] = "Move Forward|Backward # Words",
--                     ['e'] = "Move to End of Current Word",
--                     ['y'] = "Copy Selection",
--                     ['p'] = "Paste at Cursor",
--                     ['x'] = "Cuts Selection",
--                     ["i|v|:|Esc"] = "Insert|Visual|Command|Normal Mode",
--                     ['dw|db'] = "Delete Next|Previous Word",
--                     ['de'] = "Delete to End of Current Word",
--                     ['dL'] = "Delete All Text Below Cursor in File",
--                     ['dd'] = "Delete Current Line",
--                     ['u'] = "Undo",
--                     ['.'] = "Repeat Previous"
                    
--                 }
--             }
--         }
--     }

-- local Utilities_Commands = {

--     ["Utilities: Wifi"] = {
--         {
--             modifiers = {},
--             keys = { ['nmtui'] = "Wifi terminal user interface",
--                         ['nmcli connection up <SSID>'] = "Connect to <SSID>",
--                         ['nmcli connection'] = "List known connections",
--                         ['nmcli device wifi connect <SSID> password <password>'] = "Connect to Wifi",
--                         ['nmcli device wifi list'] = 'List all visible wifi connections'}
--         }
--     }
-- }

hotkeys_popup.widget.add_hotkeys(Qutebrowser_keys)
hotkeys_popup.widget.add_hotkeys(Tags_keys)
-- hotkeys_popup.widget.add_hotkeys(Vim_keys)
--hotkeys_popup.widget.add_hotkeys(Utilities_Commands)


return hotkeys_popup