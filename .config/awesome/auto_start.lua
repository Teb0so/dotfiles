local awful = require("awful")

awful.spawn.with_shell("xinput --set-prop 'pointer:''SINOWEALTH Wired Gaming Mouse' 'libinput Accel Profile Enabled' 0, 1")
awful.spawn.with_shell("xinput --set-prop 'pointer:''SINOWEALTH Wired Gaming Mouse' 'libinput Accel Speed' -0.4")

awful.spawn.with_shell("lxpolkit")

awful.spawn.with_shell("$HOME/.screenlayout/TWO.sh")

awful.spawn.with_shell("nitrogen --restore")

awful.spawn("xset s off -dpms")

awful.spawn.with_shell("pkill volumeicon")

awful.spawn.with_shell("pkill nm-tray")

awful.spawn("picom")

awful.spawn("gkrellm")

awful.spawn("volumeicon")

awful.spawn("nm-tray")

awful.spawn("copyq")

awful.spawn("flatpak run com.discordapp.Discord --start-minimized")

awful.spawn.with_shell("protonmail-bridge --no-window")
