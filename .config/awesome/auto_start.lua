local awful = require("awful")

awful.spawn.with_shell("xinput --set-prop 'pointer:''SINOWEALTH Wired Gaming Mouse' 'libinput Accel Profile Enabled' 0, 1")
awful.spawn.with_shell("xinput --set-prop 'pointer:''SINOWEALTH Wired Gaming Mouse' 'libinput Accel Speed' -0.4")

awful.spawn.with_shell("waypaper --restore")

awful.spawn.once("xset s off -dpms")

awful.spawn.single_instance("picom")

-- Apps
awful.spawn.single_instance("discord")
