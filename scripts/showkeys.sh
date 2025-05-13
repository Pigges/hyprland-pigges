#!/usr/bin/env sh

killall wshowkeys
pkill wshowkeys
sleep 0.1
wshowkeys -a right -F 'Sans Bold 30' -t 1000 -l 42 &
