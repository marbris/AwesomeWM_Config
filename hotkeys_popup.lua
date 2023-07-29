



local hotkeys_popup = require("awful.hotkeys_popup").widget


local QB_rule = { class = { "qutebrowser"} }


for group_name, group_data in pairs({
    ["Qutebrowser"] = { color = "#009F00", rule_any = QB_rule },
    ["Search Engine !Bangs"] = { color = "#009F00", rule_any = QB_rule }
}) do
    hotkeys_popup.add_group_rules(group_name, group_data)
end

-- QuteBrowser hotkeys
local Qutebrowser_keys = {

    ["Qutebrowser"] = {
    {
        modifiers = {  },
        keys = {    ["h|j|k|l"] = "Scroll Left|Down|Up|Right",
                    ["H|L"] = "Go Back|Forward in History",
                    ["J|K"] = "Next|Previous Tab",
                    r = "Reload",
                    ["u|d"] = "Undo| Close Tab",
                    ["f|F"] = "Hints to Open |in New Tab",
                    ["gg|G"] = "Scroll to Top|Bottom",
                    ["i|v|:|Esc"] = "Insert|Visual|Command|Normal Mode",
                    ["+|-"] = "Zoom in|out",
                    ["o|O"] = "Open |in New Tab",
                    ["n|N"] = "Seach Next|Previous",
                    ["/|?"] = "Search in Page (Forward|Backward)",
                    ["yy"] = "copy URL to clipboard"

                    
                }
    }
                    },
    ["Search Engine !Bangs"] = {
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


hotkeys_popup.add_hotkeys(Qutebrowser_keys)
hotkeys_popup.add_hotkeys(Tags_keys)
