#!/usr/bin/env sh

# Check if wihotspot is currently running
if pgrep "wihotspot-gui" > /dev/null
then
    echo "wihotspot is running. Killing it."
    # Use killall to terminate the process
    killall -q  wihotspot-gui
    # Wait until the processes have been shut down
    while pgrep -x wihotspot-gui >/dev/null; do sleep 1; done
else
    echo "wihotspot is not running. Starting it."
    wihotspot-gui &
fi
