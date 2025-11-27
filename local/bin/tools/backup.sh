#!/bin/bash
#
# backs up the given directories to /mnt with rsync
#
# Gabriele Rastello


cd ~ # backup must be done from home dir

BACKUPDIRS=("$HOME/go" "$HOME/org" "$HOME/.emacs.d" "$HOME/Pictures" "$HOME/Music" "$HOME/pdfs" "$HOME/blog" "$HOME/quicklisp" "$HOME/Videos/youtube" "$HOME/src" "$HOME/ledger")

for dir in "${BACKUPDIRS[@]}"; do
    rsync -av --delete "$dir" /mnt/backup
done

notify-send -u normal Backup "Backup completed!"
