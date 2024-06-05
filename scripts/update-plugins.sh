#!/usr/bin/env bash

hyprctl notify -1 3000 "rgb(634B7E)" "Updating hypr plugins"
if hyprpm update ; then
    hyprctl notify -1 3000 "rgb(00FF00)" "Hypr plugins updated"
else
    hyprctl notify -1 3000 "rgb(FF0000)" "Failed to updating hypr plugins"
fi
