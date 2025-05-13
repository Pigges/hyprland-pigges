#!/usr/bin/env sh

alias update-rice='~/.config/hypr/manage/update.sh'
alias random-wallpaper='set_wallpaper $(find ~/Pictures/Wallpapers/ -type f | shuf -n 1)'

set_wallpaper () {
	swww img "$1" -t grow --transition-pos top
}

run_hook () {
	$HOME/.hyprland_rice/autostart_$1
}

eww-rice () {
	eww --config ~/.config/hypr/eww/ $*
}
