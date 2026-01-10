#!/usr/bin/sh

# Get the current state of hyprbars:enabled (0 or 1)
CURRENT=$(hyprctl getoption plugin:hyprbars:enabled | grep 'int:' | awk '{print $2}')

case "$CURRENT" in
    1)
        hyprctl keyword plugin:hyprbars:enabled 0
        MESSAGE="Disabled"
        ;;
    *)
        hyprctl keyword plugin:hyprbars:enabled 1
        MESSAGE="Enabled"
        ;;
esac

# Optional notification (notify-send is widely available)
#if command -v notify-send >/dev/null 2>&1; then
    #notify-send "Hyprbars" "$MESSAGE"
#fi
