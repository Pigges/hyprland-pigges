#!/usr/bin/env bash

source ~/.config/hypr/lib.sh

# Configuration stuff
wl-clipboard-history -t &
~/.config/hypr/scripts/xdg-portal-hyprland &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
wlsunset -S 9:00 -s 19:30 &
wl-paste -p --watch wl-copy -pc &

# Sort of fix wayland screensharing
#xwaylandvideobridge &

# Wallpaper
swww-daemon &
#swaybg -m fill -i ~/Pictures/Wallpapers/hyprfog-2.png &
set_wallpaper $(find ~/Pictures/Wallpapers/ -type f | shuf -n 1)

# Reload Hyprland plugins
hyprpm reload &

# Applications
# waybar &
~/.config/hypr/waybar/start &
nm-applet &
blueman-applet &

brightnessctl --restore &

~/.config/hypr/scripts/update-plugins.sh &
~/.config/hypr/scripts/hypridle.sh &