#!/bin/sh

# Use the "logo" key as the primary modifier
mod="Mod4"

# Mod+Shift+Return to start an instance of foot (https://codeberg.org/dnkl/foot)
riverctl map normal $mod Return spawn foot

riverctl map normal $mod W spawn qutebrowser
riverctl map normal $mod None XF86WWW spawn qutebrowser

riverctl map normal $mod F2 spawn pcmanfm
riverctl map normal $mod M spawn pcmanfm

riverctl map $mode None XF86Explorer spawn pcmanfm 


# Mod+Q to close the focused view
riverctl map normal $mod Q close

# Invoke bemenu
riverctl map normal $mod D spawn bemenu-run

# Mod+E to exit river
riverctl map normal $mod E exit

# Mod+J and Mod+K to focus the next/previous view in the layout stack
riverctl map normal $mod J focus-view next
riverctl map normal $mod K focus-view previous

# Mod+Shift+J and Mod+Shift+K to swap the focused view with the next/previous
# view in the layout stack
riverctl map normal $mod+Shift J swap next
riverctl map normal $mod+Shift K swap previous

# Mod+Period and Mod+Comma to focus the next/previous output
riverctl map normal $mod Period focus-output next
riverctl map normal $mod Comma focus-output previous

# Mod+Shift+{Period,Comma} to send the focused view to the next/previous output
riverctl map normal $mod+Shift Period send-to-output next
riverctl map normal $mod+Shift Comma send-to-output previous

# Mod+Return to bump the focused view to the top of the layout stack, making
# it the new master
# riverctl map normal $mod Return zoom
riverctl map normal $mod G zoom

# Mod+H and Mod+L to decrease/increase the width of the master column by 5%
riverctl map normal $mod H mod-master-factor -0.05
riverctl map normal $mod L mod-master-factor +0.05

# Mod+Shift+H and Mod+Shift+L to increment/decrement the number of
# master views in the layout
riverctl map normal $mod+Shift H mod-master-count +1
riverctl map normal $mod+Shift L mod-master-count -1

# Mod+Alt+{H,J,K,L} to move views
riverctl map normal $mod+Mod1 H move left 100
riverctl map normal $mod+Mod1 J move down 100
riverctl map normal $mod+Mod1 K move up 100
riverctl map normal $mod+Mod1 L move right 100

# Mod+Alt+Control+{H,J,K,L} to snap views to screen edges
riverctl map normal $mod+Mod1+Control H snap left
riverctl map normal $mod+Mod1+Control J snap down
riverctl map normal $mod+Mod1+Control K snap up
riverctl map normal $mod+Mod1+Control L snap right

# Mod+Alt+Shif+{H,J,K,L} to resize views
riverctl map normal $mod+Mod1+Shift H resize horizontal -100
riverctl map normal $mod+Mod1+Shift J resize vertical 100
riverctl map normal $mod+Mod1+Shift K resize vertical -100
riverctl map normal $mod+Mod1+Shift L resize horizontal 100

# Mod + Left Mouse Button to move views
riverctl map-pointer normal $mod BTN_LEFT move-view

# Mod + Right Mouse Button to resize views
riverctl map-pointer normal $mod BTN_RIGHT resize-view

for i in $(seq 1 9)
do
    tagmask=$((1 << ($i - 1)))

    # Mod+[1-9] to focus tag [0-8]
    riverctl map normal $mod $i set-focused-tags $tagmask

    # Mod+Shift+[1-9] to tag focused view with tag [0-8]
    riverctl map normal $mod+Shift $i set-view-tags $tagmask

    # Mod+Ctrl+[1-9] to toggle focus of tag [0-8]
    riverctl map normal $mod+Control $i toggle-focused-tags $tagmask

    # Mod+Shift+Ctrl+[1-9] to toggle tag [0-8] of focused view
    riverctl map normal $mod+Shift+Control $i toggle-view-tags $tagmask
done

# Mod+a to focus all tags
# Mod+Shift+a to tag focused view with all tags
all_tags_mask=$(((1 << 32) - 1))
riverctl map normal $mod 0 set-focused-tags $all_tags_mask
riverctl map normal $mod+Shift 0 set-view-tags $all_tags_mask

# Mod+Space to toggle float
riverctl map normal $mod Space toggle-float

# Mod+F to toggle fullscreen
riverctl map normal $mod F toggle-fullscreen

# Mod+{Up,Right,Down,Left} to change master orientation
riverctl map normal $mod Up layout rivertile top
riverctl map normal $mod Right layout rivertile right
riverctl map normal $mod Down layout rivertile down
riverctl map normal $mod Left layout rivertile left

# Mod+S to change to Full layout
riverctl map normal $mod S layout full
riverctl map normal $mod T  layout rivertile top

# Declare a passthrough mode. This mode has only a single mapping to return to
# normal mode. This makes it useful for testing a nested wayland compositor
riverctl declare-mode passthrough

# Mod+F11 to enter passthrough mode
riverctl map normal $mod F11 enter-mode passthrough

# Mod+F11 to return to normal mode
riverctl map passthrough $mod F11 enter-mode normal

# Various media key mapping examples for both normal and locked mode which do
# not have a modifier
for mode in normal locked
do
    # Eject the optical drive
    riverctl map $mode None XF86Eject spawn eject -T

    # Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
    riverctl map $mode None XF86AudioRaiseVolume  spawn pamixer -i 5
    riverctl map $mode None XF86AudioLowerVolume  spawn pamixer -d 5
    riverctl map $mode None XF86AudioMute         spawn pamixer --toggle-mute

    # Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
    riverctl map $mode None XF86AudioMedia spawn playerctl play-pause
    riverctl map $mode None XF86AudioPlay  spawn playerctl play-pause
    riverctl map $mode None XF86AudioPrev  spawn playerctl previous
    riverctl map $mode None XF86AudioNext  spawn playerctl next

    # Control screen backlight brighness with light (https://github.com/haikarainen/light)
    riverctl map $mode None XF86MonBrightnessUp   spawn light -A 5
    riverctl map $mode None XF86MonBrightnessDown spawn light -U 5
done

# Set repeat rate
riverctl set-repeat 50 300

# Set the layout on startup
riverctl layout rivertile top

# Set app-ids of views which should float
riverctl float-filter-add "float"
riverctl float-filter-add "popup"
# riverctl float-filter-add "mpv"

# Set app-ids of views which should use client side decorations
riverctl csd-filter-add "gedit"


# Set opacity and fade effect
# riverctl opacity 1.0 0.75 0.0 0.1 20
riverctl outer-padding 0
riverctl view-padding 0
riverctl border-color-focused #FF3CFF


gnome-keyring-daemon -r -d --components=secrets
gpg-connect-agent --no-autostart reloadagent /bye
waybar &
