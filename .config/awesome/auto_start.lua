local awful = require("awful")

awful.spawn.with_shell("xinput --set-prop 'pointer:''SINOWEALTH Wired Gaming Mouse' 'libinput Accel Profile Enabled' 0, 1")
awful.spawn.with_shell("xinput --set-prop 'pointer:''SINOWEALTH Wired Gaming Mouse' 'libinput Accel Speed' -0.4")

awful.spawn.with_shell("lxqt-policykit-agent")

awful.spawn.with_shell("$HOME/.screenlayout/TWO.sh")

awful.spawn.with_shell("nitrogen --restore")

awful.spawn.once("xset s off -dpms")

awful.spawn.with_shell("pkill volumeicon")

awful.spawn.with_shell("pkill nm-tray")

awful.spawn.single_instance("picom")

awful.spawn.single_instance("gkrellm")

awful.spawn.single_instance("volumeicon")

awful.spawn.single_instance("nm-tray")

awful.spawn.once("flatpak run com.discordapp.Discord")

awful.spawn.once("protonmail-bridge")
