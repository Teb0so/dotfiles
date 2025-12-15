#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wals"

# Pick random wallpaper
mapfile -t walls < <(find "$WALLPAPER_DIR" -type f)
wallpaper="${walls[RANDOM % ${#walls[@]}]}"

qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
var allDesktops = desktops();
for (i = 0; i < allDesktops.length; i++) {
  d = allDesktops[i];
  d.wallpaperPlugin = 'org.kde.image';
  d.currentConfigGroup = ['Wallpaper', 'org.kde.image', 'General'];
  d.writeConfig('Image', 'file://$wallpaper');
}
"

