#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="vifm"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/Documents/referbib"
export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export XDG_CONFIG_HOME="$HOME/.config"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export TLDEXTRACT_CACHE="$HOME/.cache/tldextract"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=12
# PANEL_FONT="-*-fixed-*-*-*-*-10-*-*-*-*-*-*-*"
PANEL_FONT="xos4 Terminus:style=Bold:size=10"
# PANEL_FONT="xos4 Terminus"
PANEL_WM_NAME=bspwm_panel
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME

# if [[ $DISPLAY ]]; then
#     # If not running interactively, do not do anything
#     [[ $- != *i* ]] && return
#     [[ -z "$TMUX" ]] && exec tmux
# fi


echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if Dwm not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

