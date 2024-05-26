#!/usr/bin/env bash

# Make sure hypridle isn't disabled before we run it
if ! ls ~/.config/hypr/disabled/HYPRIDLE; then
    hypridle
fi