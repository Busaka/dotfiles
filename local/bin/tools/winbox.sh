#!/usr/bin/env sh

# Check if waydroid is currently running
if pgrep "WinBox" > /dev/null
then
    echo "winbox is running."
else
    echo "winbox is not running. Starting it."
    WinBox
fi
