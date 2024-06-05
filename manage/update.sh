#!/usr/bin/env bash

notify_flag=$1

notify_core () {
        notify-send "Rice Update Manager"  "$1" $2
}

notify () {
	notify_core "$1" ""
}

notify Updating...
cd ~/.config/hypr
git pull
notify "Done!"