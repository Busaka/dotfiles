#!/bin/bash
#
# A super simple timer script that waits for the given amount of minutes and then
# notifies the user
#
# Gabriele, Rastello

notify-send -u low Timer "$1 minute(s) timer set" 
sleep "$1"m && notify-send -u low Timer "$1 minute(s) passed" || notify-send -u critical Timer "Something went wrong"
