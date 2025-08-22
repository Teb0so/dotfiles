pcall(require, "luarocks.loader")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

 -- Error handling
require("error")

 -- Theme
local beautiful = require("beautiful")
beautiful.init("~/.config/awesome/theme.lua")
beautiful.notification_icon_size = 100

 -- Variable definitions
require("variable")

 -- Layouts
require("layout")

 -- Wibar
require("wibar")

 -- Bindings
require("bindings")

 -- Rules
require("rules")

 -- Signals
require("signals")

 -- Auto start
require("auto_start")

require("freedesktop")
