#!/usr/bin/env bash

if ls ~/.config/hypr/disabled/SPLIT_MONITOR_WORKSPACES; then
    exit 1
fi

sleep 1

# Use the split-monitor-workspaces dispatcher if the plugin is active
if hyprctl plugin list | grep -q 'split-monitor-workspaces'; then
    for i in $(seq 1 9);
    do
        hyprctl keyword unbind SUPER, $i
        hyprctl keyword bind SUPER, $i, split-workspace, $i

        hyprctl keyword unbind SUPER SHIFT, $i
        hyprctl keyword bind SUPER SHIFT, $i, split-movetoworkspace, $i
    done

    hyprctl keyword unbind SUPER,0
    hyprctl keyword bind SUPER, 0, split-workspace, 10

    hyprctl keyword bind SUPER SHIFT, 0, split-movetoworkspace, 10

    hyprctl keyword unbind SUPER ALT, up
    hyprctl keyword unbind SUPER ALT, down
    hyprctl keyword unbind SUPER, TAB
    hyprctl keyword bind SUPER ALT, up, split-workspace, e+1
    hyprctl keyword bind SUPER ALT, down, split-workspace, e-1
    hyprctl keyword bind SUPER, TAB, split-workspace, previous

    hyprctl keyword unbind SUPER, mouse_down
    hyprctl keyword unbind SUPER, mouse_up
    hyprctl keyword bind SUPER, mouse_down, split-workspace, e+1
    hyprctl keyword bind SUPER, mouse_up, split-workspace, e-1

    # hyprctl keyword unbind SUPERSHIFT, grave
    # hyprctl keywork bind SUPERSHIFT, grave, split-movetoworkspace, special

    hyprctl notify -1 3000 "rgb(634B7E)" "Configured split-monitor-workspaces"
else
    hyprctl notify -1 10000 "rgb(ff0000)" "Failed to configure split-monitor-workspaces"
fi