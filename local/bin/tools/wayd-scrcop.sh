#!/bin/bash

# Check if scrcpy is currently running
if pgrep "scrcpy" > /dev/null
then
    echo "scrcpy is running. Killing it."
    # Use pkill to terminate the process
    pkill "scrcpy"
else
    echo "scrcpy is not running. Starting it."
    # Start scrcpy nm-applet in the background
    scrcpy  -Sw -m800 -s BF32ETYQ231025079103 &
fi
