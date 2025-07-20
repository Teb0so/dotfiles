local awful = require("awful")
local beautiful = require("beautiful")

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
        properties = { border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen+awful.placement.centered
        }
    },
    -- Floating clients.
    { rule_any = {
        instance = {
            "DTA",
            "copyq",
            "pinentry",
        },
        class = {
            "Arandr",
            "Waypaper"
        },
        name = {
            "Event Tester",
        },
        role = {
            "AlarmWindow",
            "ConfigManager",
            "pop-up",
        }
    }, properties = { floating = true }},

    { rule_any = { 
        instance = {
            "steam",
            "lutris" }},
        properties = { tag = workspaces[5] } },

    { rule = { instance = "discord" },
        properties = { tag = workspaces[6] } },

    { rule = { instance = "virt-manager" },
        properties = { tag = workspaces[7] } },

    { rule_any = { 
        instance = {
            "nicotine",
            "qbittorrent" }},
        properties = { tag = workspaces[8] } },

}
