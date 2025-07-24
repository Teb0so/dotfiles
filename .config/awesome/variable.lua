terminal = "alacritty"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
applauncher_cmd = "rofi -show drun"
system_menu_cmd = "sys_menu.sh"
pwr_menu_cmd = "sys_pwr_menu.sh"
rofi_calc = "rofi -show calc"
msc_plr_cmd = terminal .. " -e rmpc"
wall_picker_cmd = "waypaper"
wall_random_cmd = "waypaper --random"
file_xplr_gui_cmd = "pcmanfm"
file_xplr_cli_cmd = terminal .. " -e ranger"
browser_cmd = "floorp"
printscrn_cmd = [[scrot -p ~/Pictures/screenshots/screenshot_%Y-%m-%d-%H%M%S.png & notify-send "Taking screenshot!"]]
modkey = "Mod4"

-- Workspaces
workspaces = { "一", "二", "三", "四", "五", "六", "七", "八", "九" }
