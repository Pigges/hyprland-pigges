#!/usr/bin/env python

import subprocess
import json
import math
from html import escape

# If there is no active player - hide
if subprocess.getoutput("playerctl metadata") == "No players found":
    print(json.dumps({"text": ""}))
    exit()

# Fetch all metadata from the player
media = {
    "trackid": subprocess.getoutput("playerctl metadata mpris:trackid"),
    "length": int(subprocess.getoutput("playerctl metadata mpris:length")),
    "artUrl": subprocess.getoutput("playerctl metadata mpris:artUrl"),
    "album": escape(subprocess.getoutput("playerctl metadata xesam:album")),
    "albumArtist": escape(subprocess.getoutput("playerctl metadata xesam:albumArtist")),
    "artist": escape(subprocess.getoutput("playerctl metadata xesam:artist")),
    "autoRating": float(subprocess.getoutput("playerctl metadata xesam:autoRating")),
    "discNumber": subprocess.getoutput("playerctl metadata xesam:discNumber"),
    "title": escape(subprocess.getoutput("playerctl metadata xesam:title")),
    "trackNumber": subprocess.getoutput("playerctl metadata xesam:trackNumber"),
    "url": subprocess.getoutput("playerctl metadata xesam:url"),
    "status": subprocess.getoutput("playerctl status"),
    "position": float(subprocess.getoutput("playerctl position")),
}

# Determine the duration of a media in the format {minutes}:{seconds}: 02:25
minutes = math.floor(media["length"]/(1000000*60))
seconds = math.floor(media["length"]/(1000000) - minutes*60)

# Make sure the duration is specified with two digits
if minutes < 10:
    minutes = f"0{minutes}"
if seconds < 10:
    seconds = f"0{seconds}"

progress = math.floor((media["position"] / ((media["length"])/(1000000)))*35)

# Create a progress bar for how far into the media we are
bar = ""
for i in range(35):
    bar += "&#10074;" if progress > 0 else "-"
    progress -= 1

# Create stars for ratings
rating = math.ceil(media["autoRating"]*5)
stars = ""
for i in range(5):
    stars += "★" if rating > 0 else "☆"
    rating -= 1

# Structure the message
message = [
    f"<b>{media['artist']}</b> {stars}",
    f"Title: <i>{media['title']}</i>",
    f"Album: <i>{media['album']}</i>",
    f"Duration: <i>{minutes}:{seconds}</i>",
    f"\t\t\t\uf049\t{'' if media['status'] == 'Playing' else ''}\t\udb81\udcac",
    f"|{bar}|",
]

# Put together the message
tooltip = "\n".join(message)

# Print the message
print(json.dumps({"text": f"{'' if media['status'] == 'Playing' else ''}", "tooltip": tooltip, "class": "media"}))