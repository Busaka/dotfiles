#!/usr/bin/env bash

export XDG_RUNTIME_DIR="/run/user/$(id -u)" # A slightly safer way to set it
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus" # Assuming standard path

# Check if waydroid is currently running
if pgrep "waydroid" > /dev/null
then
    notify-send "WAYDROID" "Waydroid is running."
else
    notify-send "WAYDROID" "Starting Waydroid."
    waydroid show-full-ui &
fi
