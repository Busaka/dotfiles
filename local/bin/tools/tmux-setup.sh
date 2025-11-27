#!/bin/sh
#
# Gabriele Rastello

session="my-tmux"

# set up tmux
tmux start-server

# create a new tmux session and populates it
tmux new-session -d -s $session 'cmus'
tmux new-window -t $session:2 'transmission-remote-cli'
tmux new-window -t $session:3

# attach to the session
tmux attach-session -t $session
