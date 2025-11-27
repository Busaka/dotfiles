#!/bin/bash

# This script checks if a Waydroid session is running and stops it if it is.

# Check if waydroid is currently running
if pgrep "waydroid" > /dev/null
then
    export XDG_RUNTIME_DIR="/run/user/$(id -u)" # A slightly safer way to set it
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus" # Assuming standard path
    echo "waydroid is running, Stopping session."
    notify-send "Stopping waydroid session."
    waydroid session stop 
else
    echo "waydroid is not running. Starting it."
    notify-send "Starting waydroid session."
    waydroid session start 
fi
