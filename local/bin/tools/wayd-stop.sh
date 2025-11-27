#!/bin/bash

# This script checks if a Waydroid session is running and stops it if it is.

echo "Checking for a running Waydroid session..."

# Check if the Waydroid session is active.
if waydroid session stop; then
    echo "Waydroid session has been stopped."
else
    echo "No Waydroid session was found to be running."
fi

# You can add additional logic here, such as stopping the container if needed.
# Note: The 'waydroid container stop' command usually requires sudo.
# It is not always necessary to stop the container, as the session command is often enough.
# If you want to stop the container as well, uncomment the following lines:
# echo "Stopping the Waydroid container..."
# if sudo waydroid container stop; then
#     echo "Waydroid container has been stopped."
# else
#     echo "Waydroid container was not running or could not be stopped."
# fi

echo "Script finished."
