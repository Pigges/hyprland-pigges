#!/bin/sh

LOCATION="London"  # Change to your city or use "" for auto IP location

# Fetch data
DATA=$(curl -s "wttr.in/${LOCATION}?format=%c+%t+%C+%w")

# Extract: icon condition temp wind
ICON=$(echo "$DATA" | awk '{print $1}')
CONDITION=$(echo "$DATA" | awk '{print $3}')
TEMP=$(echo "$DATA" | awk '{print $2}')
WIND=$(echo "$DATA" | awk '{print $4}')

# Map wttr.in's emoji/unicode to Nerd Font icons (common mappings)
case "$ICON" in
    "☀️"|"Sunny") ICON=" " ;;           # Clear/sunny
    "🌤️"|"Partly cloudy") ICON=" " ;;
    "⛅️"|"Cloudy") ICON="󰖐 " ;;
    "☁️"|"Overcast") ICON=" " ;;
    "🌫️"|"Fog") ICON=" " ;;
    "🌦️"|"Light rain") ICON=" " ;;
    "🌧️"|"Rain") ICON=" " ;;
    "❄️"|"Snow") ICON=" " ;;
    "⛈️"|"Thunder") ICON=" " ;;
    *) ICON=" " ;;                     # Default unknown
esac

# Output with Pango markup for styling (optional colors)
echo "<span font_desc='JetBrainsMono Nerd Font 24'>${ICON}</span> <span foreground='#ffffff'>${TEMP}</span> <span foreground='#a0a0a0'>${CONDITION} • ${WIND}</span>"
