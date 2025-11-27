#!/usr/bin/env sh

# Check if blueman is currently running
if pgrep "blueman" > /dev/null
then
    echo "blueman is running. Killing it."
    # Use killall to terminate the process
    pkill  blueman
    # Wait until the processes have been shut down
    while pgrep -x blueman >/dev/null; do sleep 1; done
else
    echo "blueman is not running. Starting it."
    blueman-manager &
    blueman-applet &
fi
