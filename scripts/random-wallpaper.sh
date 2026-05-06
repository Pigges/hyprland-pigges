#!/usr/bin/env bash


set_wallpaper () {
	swww img "$1" -t grow --transition-pos top
}

set_wallpaper $(find ~/Pictures/Wallpapers/ -type f | shuf -n 1)
