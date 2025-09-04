local awful = require("awful")

awful.spawn.with_shell([[
  killall xdg-desktop-portal xdg-desktop-portal-kde;
  sleep 1;
  /usr/lib/x86_64-linux-gnu/libexec/xdg-desktop-portal-kde &
  /usr/libexec/xdg-desktop-portal &
]])

awful.spawn.with_shell("xinput --set-prop 'pointer:''SINOWEALTH Wired Gaming Mouse' 'libinput Accel Profile Enabled' 0, 1")
awful.spawn.with_shell("xinput --set-prop 'pointer:''SINOWEALTH Wired Gaming Mouse' 'libinput Accel Speed' -0.4")

awful.spawn.with_shell("$HOME/.screenlayout/TWO.sh")

awful.spawn.with_shell("nitrogen --restore")

awful.spawn.once("xset s off -dpms")

awful.spawn.single_instance("picom")

-- Apps
awful.spawn.single_instance("discord")
