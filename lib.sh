#!/usr/bin/env sh

alias update-rice='~/.config/hypr/manage/update.sh'
alias random-wallpaper='set_wallpaper "$(find ~/Pictures/Wallpapers/ -type f | shuf -n 1)"'


set_wallpaper () {
	[ -z "$1" ] && { echo "Error: No wallpaper path provided" >&2; return 1; }

	bg="~/.local/share/bg"

	# Unload all loaded wallpapers
	hyprctl hyprpaper listloaded >/dev/null | \
	while IPF= read -r file; do
		[ -n "$file" ] && hyprctl hyprpaper unload $file >/dev/null
	done

	ln -sf $1 ~/.local/share/bg

	# Preload and set new wallpaper
	#hyprctl hyprpaper preload "$bg" >/dev/null
	hyprctl hyprpaper wallpaper ",$bg" >/dev/null
}

run_hook () {
	$HOME/.hyprland_rice/autostart_$1
}

eww-rice () {
	eww --config ~/.config/hypr/eww/ $*
}
