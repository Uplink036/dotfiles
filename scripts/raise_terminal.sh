#!/bin/bash

# Check if gnome-terminal is running
if pgrep -f "gnome-terminal" > /dev/null; then
    # Terminal exists, close all and open fresh one
    pkill gnome-terminal
    sleep 0.2
fi

# Start new terminal
gnome-terminal &
