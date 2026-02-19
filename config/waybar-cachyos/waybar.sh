#!/usr/bin/env sh

# Check if waybar is currently running
if pgrep "waybar" > /dev/null
then
    echo "waybar is running. Killing it."
    # Use killall to terminate the process
    killall -q waybar
    # Wait until the processes have been shut down
    while pgrep -x waybar >/dev/null; do sleep 1; done
else
    echo "waybar is not running. Starting it."
    waybar &
fi
